ARG SOLR_VERSION=5-alpine

FROM solr:${SOLR_VERSION}

LABEL maintainer="Angel Aviel Domaoan <dev.tenshiamd@gmail.com>"

ENV SOLR_HOME /opt/solr/server/solr
ENV SOLR_PORT 8983
ENV SOLR_USER root

USER $SOLR_USER

RUN apk add curl

COPY ./bin/docker-healthcheck.sh /usr/local/bin/docker-healthcheck.sh
RUN cd /usr/local/bin && chmod 750 docker-healthcheck.sh
RUN chown solr /usr/local/bin/docker-healthcheck.sh

COPY ./core $SOLR_HOME
COPY ./configsets $SOLR_HOME/configsets
RUN chown -R $SOLR_USER:$SOLR_USER $SOLR_HOME

HEALTHCHECK --start-period=30s CMD ["docker-healthcheck.sh"]

EXPOSE $SOLR_PORT
