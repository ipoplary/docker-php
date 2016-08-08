FROM debian:jessie

RUN mkdir -p /home/data

ADD php/php.tar.gz /home/data/php.tar.gz
ADD php/extensions/redis.tgz /home/data/redis.tgz
ADD php/extensions/xdebug.tgz /home/data/xdebug.tgz
ADD php/extensions/mongodb.tgz /home/data/mongodb.tgz
ADD redis/redis.tar.gz /home/data/redis.tar.gz
ADD nginx/nginx.tar.gz /home/data/nginx.tar.gz

ADD sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
    echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list && \
    apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db && \
    echo "deb [arch=amd64,i386] http://mirrors.tuna.tsinghua.edu.cn/mariadb/repo/10.1/debian jessie main"  | sudo tee /etc/apt/sources.list.d/mariadb-10.1.list && \
    apt-get update && \
    apt-get install -y \
    libssl-dev \
    libmcrypt-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    mongodb-org \
    mariadb-server

RUN rm -r /var/lib/apt/lists/*

# 创建挂载的目录
RUN mkdir -p /opt && \
    mkdir -p /opt/www && \
    mkdir -p /opt/log && \
    mkdir -p /opt/log/nginx && \
    mkdir -p /opt/log/mysql && \
    mkdir -p /opt/data && \
    mkdir -p /opt/data/mysql && \
    mkdir -p /opt/data/mongodb


EXPOSE 9000

CMD ['echo', '123']