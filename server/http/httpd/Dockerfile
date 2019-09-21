FROM php:7.3-apache

ADD dist/ /root/dist/

RUN a2enmod ssl

RUN a2ensite default-ssl

RUN mv /root/dist/server.key /etc/ssl/private/ssl-cert-snakeoil.key && \
    mv /root/dist/server.crt /etc/ssl/certs/ssl-cert-snakeoil.pem
