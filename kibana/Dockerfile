FROM        ubuntu:16.04

LABEL       maintainer "etriphany.com"

ENV         OS_PACKAGES     "curl"
ENV         KIBANA_VERSION  6.1.3
ENV         KIBANA_HOME     /usr/share/kibana

RUN         apt-get update && \
            apt-get install -y ${OS_PACKAGES} && \
            rm -rf /var/lib/apt/lists/*

# Group & user
RUN         addgroup --system --gid 2000 kibana && \
            adduser --system -uid 2000 --ingroup kibana --home ${KIBANA_HOME} kibana

# Download & install
WORKDIR     ${KIBANA_HOME}
RUN         curl -Lo kibana-${KIBANA_VERSION}.tar.gz https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz && \
            tar -xf kibana-${KIBANA_VERSION}.tar.gz && \
            chown -R kibana:kibana kibana-${KIBANA_VERSION}-linux-x86_64 && \
            mv kibana-${KIBANA_VERSION}-linux-x86_64/* . && \
            rm -rf kibana-${KIBANA_VERSION}*

# Configure
EXPOSE      5601

# Run
USER        kibana
CMD         ["/bin/bash", "bin/kibana"]
