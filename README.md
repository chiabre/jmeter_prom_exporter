# Docker image for Apache JMeter + Prometheus Listener for Jmeter

Docker image to run Jmeter exposing Prometheus Listener for Jmeter metrics.

* **Apache JMeter** : an application designed to load test functional behavior and measure performance - https://jmeter.apache.org

* **Prometheus Listener for Jmeter** : an independent JMeter pluign to expose JMeter metrics to Prometheuss - https://github.com/johrstrom/jmeter-prometheus-plugin

* The **version number** of this images is composed of two version numbers
  * the first is the version of the Apache JMeter 
  * the second is the version of Prometheus Listener for Jmeter embedded in this docker image

## Apache JMeter including + Prometheus Listener for Jmeter

`chiabre/kk_jmx_exporter`
* Find Images of this repo on [docker hub](https://hub.docker.com/repository/docker/chiabre/jmeter_prom_exporter)
* Find repo of this images on [github](https://github.com/chiabre/jmeter_prom_exporter)

This images provides:
* Standard JMeter execution passing all argumets provided to the Docker container to the JMeter process
* Prometheus Listener for Jmeter metrics

Additional info:
* JMeter arguments embedded in the image are `-n` (non-GUI mode) and `-Dlog_level.jmeter` (log level)
* Default log leve is `OFF`, it can be overridden using `JMETER_LOG_LEVE`L as env. variable (available log levels as per JMeter documentation are `DEBUG`, `INFO`, `WARN`, `ERROR` and `OFF`)
* Prometheus Listener argument embedded in the image is `-Jprometheus.ip=0.0.0.0` (the ip the http server will bind to, specific for container)
* JMeter jvm args can be set via `JVM_ARGS` env. varibale

### Supported tags

* Apache JMeter 5.4.1 (openjdk 11) + Prometheus Listener for Jmeter 0.60
   * `latest`, `5.4.1-0.6.0`
* Apache JMeter 5.4 (openjdk 11) + Prometheus Listener for Jmeter 0.60
   * `5.4-0.6.0`
* Apache JMeter 5.2 (openjdk 11) + Prometheus Listener for Jmeter 0.60
   * `5.3-0.6.0`

## How to use this image

### Build using

`build.sh`

### Run using

`docker run --rm --name jmeter -i -v ${PWD}:${PWD} -w ${PWD} -p 9270:9270 chiabre/jmeter_prom_exporter:5.4-1.6.0 -t [YOUR_SCRIPT].jmx`

`[YOUR_SCRIPT].jmx` as to be present in the ${PWD} directory, it will be mounted into the image working directory. Additional JMeter or Promethues listern argument can be appended to the command.

During test execution the Prometheus JMX exporter metrics are at:

http://[JMETER]:9270/metrics/

## Credits
Thanks to https://github.com/hauptmedia/docker-jmeter, https://github.com/hhcordero/docker-jmeter-server and https://github.com/justb4/docker-jmeter for providing the Dockerfiles that inspired me. 