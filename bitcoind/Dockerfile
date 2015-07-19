FROM ubuntu:trusty
MAINTAINER Mark Lopez <m@silvenga.com>

RUN echo version 1

RUN \
	DEBIAN_FRONTEND=noninteractive \
	apt-get update \
	&& apt-get -y install \
		make \
		g++ \
		python-leveldb \
		libboost-all-dev \
		libssl-dev \
		libdb++-dev \
		pkg-config \
		wget \
		bsdmainutils \
	&& apt-get clean

# Build bitcoind server
RUN \
	mkdir -p /bitcoind/data \
	&& cd /bitcoind \
	&& wget https://bitcoin.org/bin/bitcoin-core-0.10.2/bitcoin-0.10.2.tar.gz \
	&& tar xfz bitcoin-0.10.2.tar.gz \
	&& rm -f bitcoin-0.10.2.tar.gz \
	&& cd /bitcoind/bitcoin-0.10.2 \
	&& ./configure --disable-wallet --without-miniupnpc \
	&& cd /bitcoind/bitcoin-0.10.2 \
	&& make -j`nproc` \
	&& strip src/bitcoind src/bitcoin-cli src/bitcoin-tx \
	&& cp -a src/bitcoind src/bitcoin-cli src/bitcoin-tx /bitcoind \
	&& cd /bitcoind \
	&& rm -f -r /bitcoind/bitcoin-0.10.2

ENV rpcuser rpcuser
ENV rpcpassword rpcpassword

EXPOSE 8332 
EXPOSE 8333 

COPY bitcoind.sh /bitcoind.sh

CMD /bin/bash /bitcoind.sh
