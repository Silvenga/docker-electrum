#!\bin\bash 
echo "Setting Docker Electrum..."

config="./electrum.conf"

echo "[server]" > $config
echo "username = electrum" >> $config
echo "host = `/sbin/ifconfig | grep "inet addr" | awk '{ print $2 ; exit; }' | awk -F':' '{ print $2 }'`" >> $config
echo "electrum_rpc_port = 8000" >> $config
echo "stratum_tcp_port = 50001" >> $config
echo "stratum_tcp_ssl_port = 50002" >> $config
[ -n "$report_host" ] && echo "report_host = $report_host" >> $config
[ -n "$report_stratum_tcp_port" ] && echo "report_stratum_tcp_port = $report_stratum_tcp_port" >> $config
[ -n "$report_stratum_tcp_ssl_port" ] && echo "report_stratum_tcp_ssl_port = $report_stratum_tcp_ssl_port" >> $config
[ -n "$banner" ] && echo "banner = $banner" >> $config
[ -n "$banner_file" ] && echo "banner_file = $banner_file" >> $config
[ -n "$irc" ] && echo "irc = $irc" >> $config
[ -n "$irc_nick" ] && echo "irc_nick = $irc_nick" >> $config
[ -n "$ssl_certfile" ] && echo "ssl_certfile = $ssl_certfile" >> $config
[ -n "$ssl_keyfile" ] && echo "ssl_keyfile = $ssl_keyfile" >> $config
[ -n "$logfile" ] && echo "logfile = $logfile" >> $config
[ -n "$donation_address" ] && echo "donation_address = $donation_address" >> $config

echo "[leveldb]" >> $config
[ -n "$path" ] && echo "path = $path" >> $config
[ -n "$pruning_limit" ] && echo "pruning_limit = $pruning_limit" >> $config

echo "[bitcoind]" >> $config
[ -n "$bitcoind_host" ] && echo "bitcoind_host = $bitcoind_host" >> $config
[ -n "$bitcoind_port" ] && echo "bitcoind_port = $bitcoind_port" >> $config
[ -n "$bitcoind_user" ] && echo "bitcoind_user = $bitcoind_user" >> $config
[ -n "$bitcoind_password" ] && echo "bitcoind_password = $bitcoind_password" >> $config

echo "Done."

#cat /etc/hosts

#cat ./electrum.conf

#  [server]
#  # username for running the daemon
#  username = 
#  # hostname. set it to a FQDN in order to be reached from outside
#  host = localhost
#  # ports
#  electrum_rpc_port = 8000
#  stratum_tcp_port = 50001
#  #stratum_tcp_ssl_port = 50002
#  #report_host = 
#  #report_stratum_tcp_port = 50001
#  #report_stratum_tcp_ssl_port = 50002
#  banner = Welcome to Electrum!
#  banner_file = /etc/electrum.banner
#  #irc = no
#  #irc_nick = <yournickname>
#  #ssl_certfile = /path/to/electrum-server.crt
#  #ssl_keyfile = /path/to/electrum-server.key
#  logfile = /var/log/electrum.log
#  donation_address = 

#  [leveldb]
#  # path to your database
#  path = 
#  # for each address, history will be pruned if it is longer than this limit
#  pruning_limit = 100
#  
#  [bitcoind]
#  bitcoind_host = localhost
#  bitcoind_port = 8332
#  # user and password from bitcoin.conf
#  bitcoind_user = 
#  bitcoind_password = 
