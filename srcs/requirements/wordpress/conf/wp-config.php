<?php
define( 'DB_NAME', '${DBNAME}' );

define( 'DB_USER', '${DBUSER}' );

define( 'DB_PASSWORD', '${DBUSERPASS}' );

define( 'DB_HOST', '${DBHOST}' );

define( 'DB_CHARSET', '' );

define( 'DB_COLLATE', '' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
