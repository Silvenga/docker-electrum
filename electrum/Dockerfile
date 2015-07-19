FROM ubuntu:trusty
MAINTAINER Mark Lopez <m@silvenga.com>

RUN echo version 8de77adc00

RUN \
	DEBIAN_FRONTEND=noninteractive apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -y install \
		git \
		python-setuptools \
		python-openssl \
		python-leveldb \
		libleveldb-dev \
		build-essential \
		autoconf \
		libtool \
		pkg-config \
		python-pyrex \
		python-dev \
		bind9-host
	
RUN \	
	adduser --disabled-login electrum
		
RUN \
	easy_install \
		jsonrpclib \
		irc \
		plyvel
	
RUN \
	mkdir /electrum \
	&& cd /electrum \
	&& git clone https://github.com/spesmilo/electrum-server
	
VOLUME /var/electrum-server

ADD setup.sh /setup.sh

#ENV report_host
#ENV report_stratum_tcp_port 
#ENV report_stratum_tcp_ssl_port 
#ENV irc
#ENV irc_nick
#ENV ssl_certfile
#ENV ssl_keyfile
#ENV bitcoind_user 
#ENV bitcoind_password 

ENV \
	PYTHON_EGG_CACHE=/tmp \
	banner="Welcome to Electrum (Docker Flavoured)!" \
	banner_file=/var/electrum-server/electrum.banner \
	logfile=/var/electrum-server/electrum.log \
	donation_address=19VPFqEeuKML8a4NdqNVJX5tUzP1WiEMaq \
	path=/var/electrum-server \
	pruning_limit=100 \
	bitcoind_host=bitcoind \
	bitcoind_port=8332

COPY electrum.sh /electrum.sh
CMD /bin/bash /electrum.sh

	
	
