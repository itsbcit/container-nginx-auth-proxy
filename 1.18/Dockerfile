FROM bcit/openshift-nginx:1.18

USER root

RUN apk add --no-cache openssl

COPY default.conf.tmpl          /etc/nginx/conf.d/default.conf.tmpl
COPY 40-gen-selfsigned-cert.sh  /docker-entrypoint.d/40-gen-selfsigned-cert.sh
COPY 50-dockerize-config.sh     /docker-entrypoint.d/50-dockerize-config.sh

RUN mkdir -p /certs \
 && chown nginx /etc/nginx/conf.d/default.conf /certs/ \
 && chmod 776 /etc/nginx/conf.d/default.conf \
 && chmod 2776 /certs

USER nginx
ENTRYPOINT ["/tini", "--", "/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
