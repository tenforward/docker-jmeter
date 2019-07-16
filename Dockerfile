FROM ubuntu:bionic

MAINTAINER	KATOH Yasufumi <karma@jazz.email.ne.jp>

ARG	JMETER_VERSION="5.1.1"
ENV	JMETER_HOME	/opt/apache-jmeter-${JMETER_VERSION}
ENV	JMETER_BIN	${JMETER_HOME}/bin
ENV	JMETER_URL	https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz
ENV	PATH $PATH:$JMETER_BIN

RUN	apt-get update \
	&& apt-get -y upgrade \
	&& apt-get -y install openjdk-11-jre curl \
	&& mkdir -p /tmp/download \
	&& curl -L ${JMETER_URL} > /tmp/download/apache-jmeter-${JMETER_VERSION}.tgz \
	&& mkdir -p /opt \
	&& tar xvf /tmp/download/apache-jmeter-${JMETER_VERSION}.tgz -C /opt \
	&& rm -rf /tmp/download