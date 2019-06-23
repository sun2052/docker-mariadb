#!/bin/sh

# configure mirror if necessary
if [ "$CN_MIRROR" == "true" ]; then
cat << EOF > /etc/apk/repositories
https://mirrors.aliyun.com/alpine/latest-stable/main/
https://mirrors.aliyun.com/alpine/latest-stable/community/
EOF
fi

# install packages
apk add --no-cache tini mariadb mariadb-client

# enable networking
sed -i \
    -e 's|^skip-networking$|#skip-networking|i' \
    /etc/my.cnf.d/mariadb-server.cnf

# don't reverse lookup hostnames, they are usually another containers
cat << EOF > /etc/my.cnf.d/docker.cnf
[mysqld]
skip-host-cache
skip-name-resolve
EOF

# clean up
rm /install.sh
