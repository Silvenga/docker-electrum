#!/bin/bash
cd /electrum/electrum-server
mkdir -p $path
touch $logfile
chown electrum:electrum -R $logfile $path
/bin/bash /setup.sh
sudo -u electrum PYTHON_EGG_CACHE=$PYTHON_EGG_CACHE python run_electrum_server