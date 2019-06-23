FROM alpine

ARG CN_MIRROR="false"

COPY install.sh start.sh /

RUN ["sh", "/install.sh"]

VOLUME /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["/sbin/tini", "--", "sh", "/start.sh"]
