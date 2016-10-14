FROM alpine:latest

RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main" > /etc/apk/repositories && \
    echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/community" >> /etc/apk/repositories && \
    apk --update --no-cache add \
    mariadb \
    mariadb-client \
    pwgen && \
    rm -f /var/cache/apk/*

ADD my.cnf /etc/mysql/my.cnf
RUN chmod 755 /etc/mysql/my.cnf

# 创建数据库存放目录
RUN mkdir -p /opt /opt/data/mysql /opt/log/mysql /var/run/mysqld && \
    chown -R mysql /opt /var/run/mysqld

ADD ./entrypoint.sh /entrypoint.sh

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["/entrypoint.sh"]
