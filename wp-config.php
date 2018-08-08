<?php
define('DB_NAME', '_DB_NAME');

define('DB_USER', 'wordpress');

define('DB_PASSWORD', 'bad_password');

define('DB_HOST', 'localhost');

define('DB_CHARSET', 'utf8mb4');

define('DB_COLLATE', '');

_AUTH

$table_prefix  = 'wp_';

define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
