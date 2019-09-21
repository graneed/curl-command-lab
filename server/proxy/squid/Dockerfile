FROM sameersbn/squid:latest

RUN sed -e 's/#acl localnet/acl localnet/' \
        -e 's/#http_access allow localnet/http_access allow localnet/' \
        -i /etc/squid/squid.conf
