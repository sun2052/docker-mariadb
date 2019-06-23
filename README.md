# Docker MariaDB Server

## Usage

```bash
mkdir -p /var/lib/mysql
docker run -d --restart=always \
    -p 127.0.0.1:3306:3306 \
    -v /var/lib/mysql:/var/lib/mysql \
    mariadb
```

```
    host: 127.0.0.1:3306
username: root  
password: root
```


## Build

```bash
docker build --build-arg CN_MIRROR=true -t mariadb .
```
