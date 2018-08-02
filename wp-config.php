<?php
define('DB_NAME', 'wordpress');

define('DB_USER', 'wordpress');

define('DB_PASSWORD', 'bad_password');

define('DB_HOST', 'localhost');

define('DB_CHARSET', 'utf8mb4');

define('DB_COLLATE', '');

define('AUTH_KEY',         '2O*>}-p_=!hI~<[5H5R9IvA~ Tjoka0 CXAqEXcJV?kJ.X:;+nr{uV8AP<kIom6y');
define('SECURE_AUTH_KEY',  'N|mqN7c+:2g%05,T4YSeHRH0%|;oSIB<di@wM>&]WzF{c5[7qD.?>n/AN~=1_DVu');
define('LOGGED_IN_KEY',    'ZU(h^*@^vUU1@a#Uw-S;tq)mO?_+h@~Jesm14as(lT(!FzYzRu7p/nrlK:m]1p4Q');
define('NONCE_KEY',        'w.QOA/D33Gg~LV9s%IN@XB1~5oVkJ#IB=1Uzgu#1`3*e5:dXTBcN=6Py3cxR)<kX');
define('AUTH_SALT',        '3:bSG<Q9lyw#u}}6tR.(Ne?P7~oJaQ1fe}y;x/x{T3XiCsYX:aJMo@G1wh:-t2lU');
define('SECURE_AUTH_SALT', 'jkXe2;M_[oC6z1>/@:MB^b$KY!a~Ik,[RCp,%}0`#uxlLGHBEo&}5hI#T$;LAWJZ');
define('LOGGED_IN_SALT',   'K7JVJZWqIJS_CYjav>n#/6,%LVHEiVcg?.0(El8?8yvl*QcY1H+8:f$/[X%nZ2UZ');
define('NONCE_SALT',       'hoEH8H^fAH1 ez`|-w%i#7>(~I;zu9VQ5}cHq.Di+M}:;GN9G5g[z*`+RU!xU`SI');

$table_prefix  = 'wp_';

define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
