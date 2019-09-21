FROM fauria/vsftpd

RUN usermod -u 1000 ftp

ADD dist/ /root/dist/

RUN mv /root/dist/vsftpd.conf /etc/vsftpd/vsftpd.conf
