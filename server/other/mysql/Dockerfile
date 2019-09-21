FROM mysql:5.7

ADD dist/ /root/dist/

RUN mv /root/dist/init.sql /docker-entrypoint-initdb.d/init.sql
