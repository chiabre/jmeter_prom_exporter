#!/bin/bash

JMETER_VERSION="5.3"
OPENJDK_VERSION="11"
EXPORTER_VERSION="0.6.0"


# Example build line
docker build  --build-arg JMETER_VERSION=${JMETER_VERSION} --build-arg OPENJDK_VERSION=${OPENJDK_VERSION} --build-arg EXPORTER_VERSION=${EXPORTER_VERSION} -t "chiabre/jmeter_prom_exporter:${JMETER_VERSION}-${EXPORTER_VERSION}" .
