#!/bin/sh

if [ ! -f /opt/data/mysql/ibdata1 ];
then
    # 初始化mysql数据库
    mysql_install_db --user=mysql --datadir="/opt/data/mysql"

    # 启动数据库
    /usr/bin/mysqld_safe --user=mysql --datadir="/opt/data/mysql" &
    sleep 4s

    echo '=============== Add Databases and Users ==============='
    # 多个数据库
    for DATABASE in $MYSQL_DATABASE;
    do
        echo "=============== Creating ${DATABASE} Database ==============="
        # 创建数据库
        echo "CREATE DATABASE ${DATABASE};
            GRANT ALL ON ${DATABASE}.* TO ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' WITH GRANT OPTION;
            GRANT ALL ON ${DATABASE}.* TO ${MYSQL_USER}@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}' WITH GRANT OPTION;
            FLUSH PRIVILEGES;" | mysql -u root

    done

    echo '=============== Root Password ==============='
    # 修改数据库密码，禁止通过 root 外部用户访问
    echo "UPDATE mysql.user SET Password=PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE User='root';
        DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
        DELETE FROM mysql.user WHERE User='';
        FLUSH PRIVILEGES;" | mysql -u root

    sleep 2s

    killall mysqld
    killall mysqld_safe
fi

/usr/bin/mysqld --user=mysql --datadir="/opt/data/mysql"