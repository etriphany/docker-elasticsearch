FROM 		java:openjdk-8-jre-alpine

LABEL		maintainer "etriphany.com"

ENV		ES_VERSION		5.4.0
ENV 		ES_HOME 		/usr/share/elasticsearch

# OS depencencies
RUN		apk add curl bash --update --no-cache && \
		rm -rf /var/cache/apk

# Group & user
RUN 		addgroup -S elasticsearch && \
		adduser -S -G elasticsearch -h $ES_HOME elasticsearch

# Download & install 
WORKDIR 	/usr/share/elasticsearch/

RUN 		curl -Lo elasticsearch-$ES_VERSION.tar.gz https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ES_VERSION.tar.gz && \
                tar -xf elasticsearch-$ES_VERSION.tar.gz && \
                chown -R elasticsearch:elasticsearch elasticsearch-$ES_VERSION && \
		mv elasticsearch-$ES_VERSION/* . && \
                rm -rf elasticsearch-$ES_VERSION*

# Configure
COPY 		config ./config

EXPOSE  	9200 9300

# Run
USER 		elasticsearch

CMD		["/bin/bash", "bin/elasticsearch"]
