FROM php:7.0-fpm-alpine

RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main" > /etc/apk/repositories && \
    echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/community" >> /etc/apk/repositories && \
    apk --update --no-cache add \
    libjpeg-turbo-dev \
    libpng-dev \
    autoconf \
    make \
    openssl-dev \
    g++ \
    file \
    re2c \
    libmcrypt \
    libmcrypt-dev \
    libxml2-dev \
    linux-headers \
    sqlite-dev \
    cmake

# 安装 php 扩展
RUN docker-php-ext-install zip \
    && docker-php-ext-install gd \
    && docker-php-ext-install json \
    && docker-php-ext-install dom \
    && docker-php-ext-install xml \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_sqlite \
    && docker-php-ext-install mysqli

# redis
COPY ./extensions/redis.tgz /home/redis.tgz
RUN pecl install /home/redis.tgz && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini

# mongodb
COPY ./extensions/mongodb.tgz /home/mongodb.tgz
RUN pecl install /home/mongodb.tgz && echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/mongodb.ini

# xdebug
COPY ./extensions/xdebug.tgz /home/xdebug.tgz
RUN pecl install /home/xdebug.tgz && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20151012/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini

# swoole
COPY ./extensions/swoole.tgz /home/swoole.tgz
RUN pecl install /home/swoole.tgz && echo "extension=swoole.so" > /usr/local/etc/php/conf.d/swoole.ini

# 删除安装扩展时所需的应用
RUN apk del -r autoconf \
    make \
    openssl-dev \
    g++ \
    file \
    re2c \
    cmake \
    libxml2-dev \
    linux-headers

# 删除文件
RUN rm -f /home/redis.tgz && \
    rm -f /home/mongodb.tgz && \
    rm -f /home/xdebug.tgz && \
    rm -f /home/swoole.tgz && \
    rm -f /var/cache/apk/*

EXPOSE 9000
