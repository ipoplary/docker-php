FROM php:7.0-fpm

ADD sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
        libssl-dev \
	libmcrypt-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        mcrypt \
        libxml2-dev \
        libsqlite3-dev \
	&& rm -r /var/lib/apt/lists/*

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

# 删除文件
RUN rm -f /home/*

EXPOSE 9000
