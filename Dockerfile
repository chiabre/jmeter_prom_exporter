# inspired by https://github.com/justb4/docker-jmeter
FROM justb4/jmeter:5.3

LABEL maintainer="luca.chiabrera@gmail.com"

ARG JMETER_VERSION="5.3"
ARG JMETER_EXPORTER_VERSION="0.6.0"

ENV	JMETER_LIB_EXT	${JMETER_HOME}/lib/ext

ENV JMETER_EXPORTER_DOWNLOAD_URL https://search.maven.org/remotecontent?filepath=com/github/johrstrom/jmeter-prometheus-plugin/${JMETER_EXPORTER_VERSION}/jmeter-prometheus-plugin-${JMETER_EXPORTER_VERSION}.jar
# ENV JMETER_EXPORTER_DOWNLOAD_URL https://jmeter-plugins.org/files/packages/jmeter-prometheus-${JMETER_EXPORTER_VERSION}.zip

RUN curl -L --silent ${JMETER_EXPORTER_DOWNLOAD_URL} > ${JMETER_LIB_EXT}/${JMETER_EXPORTER_VERSION}.jar

EXPOSE 9270
EXPOSE 4445
