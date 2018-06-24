FROM welaika/wordmove

USER root
COPY wordmove-entrypoint.sh /tmp/
RUN chmod +x /tmp/wordmove-entrypoint.sh

ENV HOST_IP=0.0.0.0 \
    HOST_PORT=8000 \
    LOCAL_DB_NAME=wordpress \
    LOCAL_DB_USER=wordpress \
    LOCAL_DB_PASSWORD=wordpress \
    LOCAL_DB_HOST=db

VOLUME ["/var/www/html"]
WORKDIR /var/www/html
ENTRYPOINT ["/tmp/wordmove-entrypoint.sh"]
CMD ["provision"]