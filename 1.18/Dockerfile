FROM bcit/openshift-nginx:1.18

USER root

COPY default.conf.tmpl /etc/nginx/conf.d/default.conf.tmpl
COPY 50-dockerize-config.sh /docker-entrypoint.d/50-dockerize-config.sh

RUN chown nginx /etc/nginx/conf.d/default.conf \
 && chmod 776 /etc/nginx/conf.d/default.conf

USER nginx
ENTRYPOINT ["/tini", "--", "/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
