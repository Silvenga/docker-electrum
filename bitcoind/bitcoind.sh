#!/bin/bash
mkdir -p /bitcoind/data/
touch /bitcoind/data/bitcoin.conf 

/bitcoind/bitcoind \
	-datadir=/bitcoind/data \
	-daemon \
	-txindex \
	-rpcuser=$rpcuser \
	-rpcpassword=$rpcpassword \
	-rpcallowip=0.0.0.0/0 \
	-pid=/tmp/pid

tail -F /bitcoind/data/debug.log
