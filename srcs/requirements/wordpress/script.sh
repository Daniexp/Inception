wp core install  --allow-root \
        --url="DOMAIN" \
        --title="DEXPOSIT HOME" \
        --admin_user="SUPER" \
        --admin_password="USERPASS" \
        --admin_email="EMAIL" \
        --skip_email --path="/var/www/html/wordpress" && \
wp user create USER EMAIL \
        --user_pass="USERPASS" \
        --allow-root \
        --role=subscriber \
        --path="/var/www/html/wordpress"; \

