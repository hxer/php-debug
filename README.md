# php-debug

使用Docker搭建php调试环境，支持gdb, xdebug, vld等工具调试php。

## xdebug

configure PHP to get Xdebug running:  [https://xdebug.org/wizard.php](https://xdebug.org/wizard.php)

* analysize php

```php
<?php
$a = "hello";
$b = $a;
xdebug_debug_zval('a');
?>
```

## VLD

使用VLD扩展查看opcode

```shell
php -dvld.active=1 test.php
# 设置显示详细内容级别
php -dvld.active=1 -dvld.verbosity=3 test.php
# 不执行PHP代码
php -dvld.active=1 -dvld.execute=0 test.php
```



## docker run

`docker run --privileged --name php-debug -it -v php-script-path:/www janes/php-debug:5.6.20`
