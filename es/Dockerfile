FROM        java:openjdk-8-jre-alpine

LABEL       maintainer "etriphany.com"

ENV         OS_PACKAGES     "curl bash"
ENV         ES_VERSION      6.1.3
ENV         ES_HOME         /usr/share/elasticsearch

# Dependencies
RUN         apk add ${OS_PACKAGES} --update --no-cache && \
            rm -rf /var/cache/apk

# Group & user
RUN         addgroup -S -g 1000 elasticsearch && \
            adduser -S -u 1000 -G elasticsearch -h ${ES_HOME} elasticsearch

# Download & install
WORKDIR     ${ES_HOME}
RUN         curl -Lo elasticsearch-${ES_VERSION}.tar.gz https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ES_VERSION}.tar.gz && \
            tar -xf elasticsearch-${ES_VERSION}.tar.gz && \
            chown -R elasticsearch:elasticsearch elasticsearch-${ES_VERSION} && \
            mv elasticsearch-${ES_VERSION}/* . && \
            rm -rf elasticsearch-${ES_VERSION}*

# Configure
COPY        bin ./bin
RUN         chown -R elasticsearch:elasticsearch bin/
EXPOSE      9200 9300

# Run
USER        elasticsearch
CMD         ["/bin/bash", "bin/docker-elasticsearch"]
