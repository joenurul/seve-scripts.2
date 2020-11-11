#!/bin/bash
colors(){
red="`tput setaf 1`"
green="`tput setaf 2`"
cyan="`tput setaf 6`"
bold="`tput bold`"
norm="`tput sgr0`"
magen="`tput setaf 5`"
}
intro(){
clear
colors
echo "   ░▒█▀▀▀█░▒█▀▀▀░▒█░░▒█░▒█▀▀▀"
echo "   ░░▀▀▀▄▄░▒█▀▀▀░░▒█▒█░░▒█▀▀▀"
echo "   ░▒█▄▄▄█░▒█▄▄▄░░░▀▄▀░░▒█▄▄▄ v2"
echo
echo "${magen} FIXER OF SEVE SCRIPTS UBUNTU & DEBIAN ${norm}"
echo
echo " Can Fix: Dropbear, Auto Recon, Squid (OPTIONAL)"
echo " To Fix SQUID (UBUNTU ONLY): $0 ubunt"
read -n 1 -s -r -p "Press ${green}Enter Key${norm} to Proceed Or Press ${red}CTRL + C${norm} to stop"
}
fix(){ 
colors
# Fix Dropbear
sed -i '/DROPBEAR_EXTRA_ARG/d' /etc/default/dropbear | sed -i '8iDROPBEAR_EXTRA_ARGS="-p 80"' /etc/default/dropbear
sudo systemctl restart dropbear
# Fix Auto Recon
sed -i '/^/d' /etc/systemd/system/autorecon.service
cat <<EOF >>/etc/systemd/system/autorecon.service
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
sudo systemctl start autorecon 
clear
}
# Squid Proxy Fixer
ubunt(){ 
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
http_access allow manager localhost
http_access deny manager
acl all src 0.0.0.0/0
http_access allow localhost
http_access allow all
http_port 8000
http_port 8080
visible_hostname SEVE-SCRIPTS
EOF
sudo systemctl restart squid
clear
}
#FINISHING
intro
fix


action=$1
[ -z $1 ] && action="$(exit 0)"
case "$action" in 
ubunt) 
${action}
;; 
*) 
echo "${red}Arguments error! [ ${action} ]${norm}" 
echo "Usage: $0 [ubunt]" 
;;
esac
