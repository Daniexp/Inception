if [ ! "$(ls -A "$WPVLM")" ]; then 
	sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf &&  \
	chmod +rwx $WPVLM && 
	wp core download --path="$WPVLM" --allow-root &&
	echo "<?php \n
	define( 'DB_NAME', '$DBNAME' );\n
	define( 'DB_USER', '$DBUSER' );\n
	define( 'DB_PASSWORD', '$DBUSERPASS' );\n
	define( 'DB_HOST', '$DBHOST' );\n
	define( 'DB_CHARSET', 'utf8mb4' );\n
	define( 'DB_COLLATE', '' );\n
	\$table_prefix = 'wp_';\n
	define( 'WP_DEBUG', false );\n
	if ( ! defined( 'ABSPATH' ) ) {\n
		define( 'ABSPATH', __DIR__ . '/' );\n
	}\n
	require_once ABSPATH . 'wp-settings.php'; \
	" > /var/www/html/wordpress/wp-config.php && 
	wp core install  --allow-root --url="$DOMAIN" --title="DEXPOSIT HOME" --admin_user="$WPSUPER" --admin_password="$WPSUSERPASS" --admin_email="$EMAIL" --skip-email --path="$WPVLM" && wp user create $WPUSER $USEREMAIL --user_pass="$WPUSERPASS" --allow-root --role=subscriber --path="$WPVLM";
fi

php-fpm8.2 --nodaemonize

