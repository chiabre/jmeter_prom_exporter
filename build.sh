#!/bin/bash

JMETER_VERSION="5.4.1"
EXPORTER_VERSION="0.6.0"
OPENJDK_VERSION="15"


# Example build line
docker build --network host --build-arg JMETER_VERSION=${JMETER_VERSION} --build-arg OPENJDK_VERSION=${OPENJDK_VERSION} --build-arg EXPORTER_VERSION=${EXPORTER_VERSION} -t "chiabre/jmeter_prom_exporter:${JMETER_VERSION}-${EXPORTER_VERSION}" .
