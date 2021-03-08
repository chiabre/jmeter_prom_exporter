# inspired by https://github.com/hauptmedia/docker-jmeter  and
# https://github.com/hhcordero/docker-jmeter-server/blob/master/Dockerfile and
# https://github.com/justb4/docker-jmeter
FROM alpine:3.12.1

LABEL maintainer="luca.chiabrera@gmail.com"

ARG JMETER_VERSION="5.4.1"

ARG OPENJDK_VERSION="11"

ARG EXPORTER_VERSION="0.6.0"

ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV	JMETER_BIN	${JMETER_HOME}/bin
ENV	JMETER_LIB_EXT	${JMETER_HOME}/lib/ext
ENV	JMETER_DOWNLOAD_URL  https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz
ENV JMETER_LOG_LEVEL="OFF"

ENV EXPORTER_DOWNLOAD_URL https://search.maven.org/remotecontent?filepath=com/github/johrstrom/jmeter-prometheus-plugin/${EXPORTER_VERSION}/jmeter-prometheus-plugin-${EXPORTER_VERSION}.jar

RUN    apk update \
	&& apk upgrade \
	&& apk add ca-certificates \
	&& update-ca-certificates \
	&& apk add --update openjdk${OPENJDK_VERSION}-jre tzdata curl unzip bash \
	&& apk add --no-cache nss \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /tmp/dependencies  \
	&& curl -L --silent ${JMETER_DOWNLOAD_URL} > /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz  \
	&& mkdir -p /opt  \
	&& tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt  \
	&& rm -rf /tmp/dependencies \
    && curl -L --silent ${EXPORTER_DOWNLOAD_URL} > ${JMETER_LIB_EXT}/jmeter-prometheus-plugin-${EXPORTER_VERSION}.jar

ENV PATH $PATH:$JMETER_BIN

COPY entrypoint.sh /

WORKDIR	${JMETER_HOME}

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9270
EXPOSE 4445
