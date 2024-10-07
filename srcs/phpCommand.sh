
RUN if [ ! "$(ls -A "$VLM")" ]; then \ 
    chmod +rwx $VLM && \
    wp core download --path="$VLM" --allow-root && \
    wp core install  --allow-root \
	--url="$DOMAIN" \
	--title="DEXPOSIT HOME" \
	--admin_user="$SUPER" \
	--admin_password="$USERPASS" \
	--admin_email="$EMAIL" \
	--skip_email --path="$VLM" && \
    wp user create $USER $EMAIL \
	--user_pass="$USERPASS" \
	--allow-root \
	--role=subscriber \
	--path="$VLM"; \
    fi
