#!/bin/bash
# CREATED BY SEVE
# PARTNER WITH ATSL
#ECHO COLORS
colors(){ 
red="`tput setaf 1`"
green="`tput setaf 2`"
cyan="`tput setaf 6`"
bold="`tput bold`"
norm="`tput sgr0`"
magen="`tput setaf 5`"
}
run=$1
namescript=$0
infos(){ 
  clear
  colors
  namescript=$0
  het="$(dig +short myip.opendns.com @resolver1.opendns.com)"
  echo "==========================================" 
  echo " SCRIPT IS SUCCESSFULLY INSTALLED"
  echo " SSH Port is 22, 225" 
  echo " PROXY Port is 8000, 8080" 
  echo " AUTO RECON Port: 45678"
  echo " OPENVPN Port is 1194" 
  echo " All Configs: $het:81"
  echo " Webmin: $het:10000" 
  echo " Create Username: usernew"
  echo " Start AutoRecon: chmod +x command.sh && ./commands.sh start_ar"
  echo 
  echo "${green}===========AUTO SCRIPT BY SEVE===========${norm}" 
  echo "=========================================="
}
start_ar(){ 
  colors
  het="$(dig +short myip.opendns.com @resolver1.opendns.com)"
  sudo systemctl start ohpserver
  clear
  echo "${green}AUTO RECON HAS SUCCESSFULLY STARTED${norm}"
  echo "YOUR PORT: 45678"
}
ar_fixer(){
  # Nanoing The Ohp Service
colors
cat <<EOF >>/etc/systemd/system/ohpserver.service
[Unit]
Description= SeveScripts
Wants=network.target
After=network.target
[Service]
Type=simple
ExecStart=/usr/local/bin/ohpserver -port 45678 -proxy 127.0.0.1:8000 -tunnel 127.0.0.1:143
Restart=always
WatchdogSec=55
[Install]
WantedBy=multi-user.target
EOF
# Start OHP inline
sudo systemctl daemon-reload
sudo systemctl start ohpserver 
clear
echo "${green}The AutoReconnect Has FIXED!!${norm}"
echo "Fixed By ATSL/SEVESCRIPTS"
}
squid_fixer(){ 
 colors
sed -i '/^/d' /etc/squid/squid.conf
cat <<EOF >>/etc/squid/squid.conf
# In Partner Of ATSL
# CREATED BY SEVE
acl localhost src 127.0.0.1/32 ::1
acl to_localhost dst 127.0.0.0/8 0.0.0.0/32 ::1
acl SSL_ports port 443
acl Safe_ports port 80
acl Safe_ports port 21
acl Safe_ports port 443
acl Safe_ports port 70
acl Safe_ports port 210
acl Safe_ports port 1025-65535
acl Safe_ports port 280
acl Safe_ports port 488
acl Safe_ports port 591
acl Safe_ports port 777
acl CONNECT method CONNECT
acl SSH dst $het-$het/255.255.255.255
http_access allow manager localhost
http_access deny manager
acl all src 0.0.0.0/0
http_access allow localhost
http_access allow all
http_port 8000
http_port 8080
visible_hostname SEVE-SCRIPTS
http_access allow SSH
EOF
sudo systemctl restart squid
clear
echo "${green}The SquidPackage Has FIXED!!${norm}"
echo "Fixed By ATSL/SEVESCRIPTS"
}
# INFO SHOW
${run}
