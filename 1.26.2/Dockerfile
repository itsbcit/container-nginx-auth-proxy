FROM bcit.io/library/nginx:1.26.2

USER root

RUN apk add --no-cache openssl

COPY default.conf.tmpl          /etc/nginx/http.d/default.conf.tmpl
COPY 40-gen-selfsigned-cert.sh  /docker-entrypoint.d/40-gen-selfsigned-cert.sh
COPY 50-dockerize-config.sh     /docker-entrypoint.d/50-dockerize-config.sh

RUN mkdir -p /certs \
 && chown nginx /etc/nginx/http.d/default.conf /certs/ \
 && chmod 776 /etc/nginx/http.d/default.conf \
 && chmod 2776 /certs

USER nginx
ENTRYPOINT ["/tini", "--", "/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
