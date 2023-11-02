# Nginx taban görüntüsü
FROM nginx

WORKDIR /etc/nginx/

COPY nginx-selfsigned.crt   /etc/ssl/certs/nginx-selfsigned.crt

COPY nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key

RUN chmod 777 /etc/ssl/private/nginx-selfsigned.key /etc/ssl/certs/nginx-selfsigned.crt

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/

EXPOSE 80 443

CMD ["/bin/sh", "-c", "nginx -g 'daemon off;'; nginx -s reload;"]
