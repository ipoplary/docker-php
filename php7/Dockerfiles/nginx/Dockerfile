FROM nginx:stable

ADD nginx.conf    /etc/nginx/nginx.conf

RUN mkdir -p /opt && mkdir -p /opt/www && mkdir -p /opt/log && mkdir -p /opt/log/nginx
RUN chown -R www-data.www-data /opt/www /opt/log/nginx

EXPOSE 80

