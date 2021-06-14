if test "${NGINX_SCHEME#*ssl}" != "$NGINX_SCHEME"; then
  openssl req -x509 -nodes -days 3650 -subj "/C=CA/ST=BC/O=BCIT/CN=bcit.ca" -newkey rsa:2048 -keyout /certs/nginx-selfsigned.key -out /certs/nginx-selfsigned.crt
  echo "SSL enabled"
fi
