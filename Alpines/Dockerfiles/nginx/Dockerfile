FROM nginx:stable-alpine

ADD nginx.conf    /etc/nginx/nginx.conf

# RUN adduser -s /sbin/nologin -S www-data
RUN mkdir -p /opt && mkdir -p /opt/www && mkdir -p /opt/log && mkdir -p /opt/log/nginx
RUN chown -R nobody.nobody /opt/log/nginx

EXPOSE 80
