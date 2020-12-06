#!/bin/bash

JMETER_VERSION="5.3"
JMETER_EXPORTER_VERSION="0.6.0"

# Example build line
docker build  --build-arg JMETER_VERSION=${JMETER_VERSION} --build-arg JMETER_EXPORTER_VERSION=${JMETER_EXPORTER_VERSION} -t "chiabre/jmeter_prom_exporter:${JMETER_VERSION}-${JMETER_EXPORTER_VERSION}" .
