if [ ! "$(ls -A "$WPVLM")" ]; then 
	sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf &&  \
	chmod +rwx $WPVLM && 
	wp core download --path="$WPVLM" --allow-root &&
	echo "<?php
	define( 'DB_NAME', '$DBNAME' );
	define( 'DB_USER', '$DBUSER' );
	define( 'DB_PASSWORD', '$DBUSERPASS' );
	define( 'DB_HOST', '$DBHOST' );
	define( 'DB_CHARSET', 'utf8mb4' );
	define( 'DB_COLLATE', '' );
	\$table_prefix = 'wp_'
	define( 'WP_DEBUG', false );n
	if ( ! defined( 'ABSPATH' ) ) {
		define( 'ABSPATH', __DIR__ . '/' );
	}
	require_once ABSPATH . 'wp-settings.php'; \
	" > /var/www/html/wordpress/wp-config.php && 
	wp core install  --allow-root --url="$DOMAIN" --title="DEXPOSIT HOME" --admin_user="$WPSUPER" --admin_password="$WPSUSERPASS" --admin_email="$EMAIL" --skip-email --path="$WPVLM" && wp user create $WPUSER $USEREMAIL --user_pass="$WPUSERPASS" --allow-root --role=subscriber --path="$WPVLM";
fi

php-fpm8.2 --nodaemonize

