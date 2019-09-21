FROM tvial/docker-mailserver:latest

ADD dist/ /root/dist/

RUN mv /root/dist/postfix-policyd-spf.conf /etc/postfix-policyd-spf-python/policyd-spf.conf
