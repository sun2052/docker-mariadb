#!/bin/sh

if [ -d /var/lib/mysql/mysql ]; then
    # configure ownership
    chown -R mysql:mysql /var/lib/mysql

    # start mariadb
    exec mysqld_safe --datadir=/var/lib/mysql
else
    # config mariadb
    mysql_install_db --user=mysql --datadir=/var/lib/mysql --skip-test-db

    # start mariadb in the backgroud
    exec mysqld_safe --datadir=/var/lib/mysql &

    # wait until mariadb is ready
    while ! mysqladmin ping --silent; do
        sleep 1
    done

    # init
    cat << EOF | mysql -uroot
    GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
EOF

    # wait for mariadb
    wait
fi
