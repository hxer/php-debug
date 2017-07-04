# php-debug
gdb debug php

## xdebug

configure PHP to get Xdebug running: [https://xdebug.org/wizard.php](configure PHP to get Xdebug running)

* analysize php

```php
<?php
$a = "hello";
$b = $a;
xdebug_debug_zval('a');
?>
```

## docker run

`docker run --privileged --name php-debug -it -v php-script-path:/www janes/php-debug:5.6.20`
