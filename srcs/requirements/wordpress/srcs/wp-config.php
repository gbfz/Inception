<?php

define( 'WP_DEBUG', true );
define( 'WP_DEBUG_DISPLAY', false );
define( 'WP_DEBUG_LOG', true );

define( 'DB_NAME', '_WP_BASE' );
define( 'DB_PASSWORD', '_WP_PASS' );
define( 'DB_USER', '_SQL_USER' );
define( 'DB_HOST', '_SQL_HOST' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',         '422' );
define( 'SECURE_AUTH_KEY',  '422' );
define( 'LOGGED_IN_KEY',    '422' );
define( 'NONCE_KEY',        '422' );
define( 'AUTH_SALT',        '422' );
define( 'SECURE_AUTH_SALT', '422' );
define( 'LOGGED_IN_SALT',   '422' );
define( 'NONCE_SALT',       '422' );

$table_prefix = 'wp_';

if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
