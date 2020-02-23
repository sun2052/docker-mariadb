# Docker MariaDB Server

## Usage

```sh
# prod
mkdir -p /var/lib/mysql
docker run -d --restart=always \
    --name mariadb \
    -p 127.0.0.1:3306:3306 \
    -v /var/lib/mysql:/var/lib/mysql \
    mariadb


# test
mkdir -p /var/lib/mysql
docker run -d --restart=always \
    --name mariadb \
    -p 3306:3306 \
    -v /var/lib/mysql:/var/lib/mysql \
    mariadb
```

```
    host: 127.0.0.1:3306
username: root
password: root
```


## Build

```sh
git clone https://github.com/sun2052/docker-mariadb.git
cd docker-mariadb
docker build --build-arg CN_MIRROR=true -t mariadb .
```
