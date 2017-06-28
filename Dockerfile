FROM debian:jessie

# package with compile:
#   -- build-essential autoconf automake libtool bison2.7 re2c
RUN apt-get update && apt-get install -y \
    build-essential autoconf automake libtool re2c wget git gdb && \
    rm -rf /var/lib/apt/lists/*


RUN cd /tmp && wget http://ftp.gnu.org/gnu/bison/bison-2.7.tar.gz && \
    tar -xvf bison-2.7.tar.gz && \
    rm bison-2.7.tar.gz && \
    cd bison-2.7 && \
    configure --prefix=/opt/bison --with-libiconv-prefix=/opt/libiconv && \
    make && make install && \
    rm -rf /tmp/bison-2.7

ENV PATH "/opt/bison/bin:$PATH"
ENV PATH "/opt/php/bin:$PATH"
ENV PHP_VERSION PHP-5.6.20
COPY .gdbinit /tmp/.gdbinit

RUN git clone https://github.com/php/php-src.git /root/php-src && \
    git clone https://github.com/derickr/vld.git /root/vld && \
    cd /root/php-src && \
    git checkout $PHP_VERSION && \
    ./buildconf --force && \
    ./configure --disable-all --enable-debug --prefix=/opt/php && \
    make && make install && \
    cd /root/vld && \
    phpize && \
    ./configure && \
    make && make install \
    echo "extension=vld.so" >> /opt/php/lib/php.ini && \
    cp /root/php-src/.gdbinit /root/.gdbinit && \
    cat /tmp/.gdbinit >> /root/.gdbinit  && \
    mkdir /www

WORKDIR /www
#VOLUME ["/www"]

CMD ["/bin/bash"]
