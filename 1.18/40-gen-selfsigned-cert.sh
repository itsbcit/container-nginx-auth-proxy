test "${NGINX_SCHEME#*ssl}" != "$NGINX_SCHEME" && touch /tmp/load-nginx-cert && echo "SSL enabled"
