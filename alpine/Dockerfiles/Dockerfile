FROM alpine:3.5

# 添加源并更新
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main" > /etc/apk/repositories && \
    echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.5/main" >> /etc/apk/repositories && \
    echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.5/community" >> /etc/apk/repositories && \
    echo "https://mirror.tuna.tsinghua.edu.cn/alpine/edge/community" >> /etc/apk/repositories && \
    echo "https://mirror.tuna.tsinghua.edu.cn/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk upgrade


# 安装 bash, Supervisor, php7-fpm, redis, mongodb, nginx, mysql
RUN apk add --no-cache -u  bash \
    php7 \
    php7-common \
    php7-fpm \
    php7-gd \
    php7-mysqli \
    php7-mysqlnd \
    php7-mcrypt \
    php7-json \
    php7-zip \
    php7-zlib \
    php7-sysvmsg \
    php7-sysvsem \
    php7-sysvshm \
    php7-dom \
    php7-mongodb \
    php7-xdebug \
    php7-mbstring \
    php7-redis \
    php7-pdo \
    php7-pdo_mysql \
    icu-dev \
    php7-intl \
    php7-phar \
    php7-opcache \
    php7-xml \
    php7-openssl \
    php7-ctype \
    redis \
    mongodb \
    nginx \
    ca-certificates \
    mysql \
    mysql-client \
    supervisor

# 添加配置文件
RUN mkdir -p /etc/redis
ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD php/php.ini /etc/php7/php.ini
ADD php/50-setting.ini /etc/php7/conf.d/50-setting.ini
ADD php/php-fpm.conf /etc/php7/php-fpm.conf
ADD mysql/my.cnf /etc/mysql/my.cnf
ADD redis/6379.conf /etc/redis/6379.conf

# 修改配置文件权限
RUN chmod 644 /etc/nginx/nginx.conf
RUN chmod 644 /etc/php7/php.ini
RUN chmod 644 /etc/php7/conf.d/50-setting.ini
RUN chmod 644 /etc/php7/php-fpm.conf
RUN chmod 644 /etc/mysql/my.cnf
RUN chmod 644 /etc/redis/6379.conf

# 清除安装文件
RUN rm -rf /var/cache/apk/*

# supervisord 启动文件
RUN mkdir -p /etc/supervisord
ADD supervisord/redis_start.sh /etc/supervisord/
ADD supervisord/mysql_start.sh /etc/supervisord/
# ADD supervisord/mongo_start.sh /etc/supervisord/
ADD supervisord/supervisord.conf /etc/
ENTRYPOINT ["supervisord", "-n", "-c", "/etc/supervisord.conf"]

# 暴露端口
EXPOSE 80 443 3306