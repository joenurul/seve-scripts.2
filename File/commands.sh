#!/bin/bash
# CREATED BY SEVE
# PARTNER WITH ATSL
# Colors Section
colors(){ 
red="`tput setaf 1`"
green="`tput setaf 2`"
cyan="`tput setaf 6`"
bold="`tput bold`"
norm="`tput sgr0`"
magen="`tput setaf 5`"
}
poarts(){
poart="$(grep ExecStart /etc/systemd/system/autorecon.service | awk '{print $3}')"
}
namescript=$0
# Info Section
infos(){ 
  clear
  colors
  poarts
  namescript=$0
  het="$(dig +short myip.opendns.com @resolver1.opendns.com)"
  echo "   ░▒█▀▀▀█░▒█▀▀▀░▒█░░▒█░▒█▀▀▀"
echo "   ░░▀▀▀▄▄░▒█▀▀▀░░▒█▒█░░▒█▀▀▀"
echo "   ░▒█▄▄▄█░▒█▄▄▄░░░▀▄▀░░▒█▄▄▄ v2"
echo
echo "==========================================" 
  echo " SCRIPT IS SUCCESSFULLY INSTALLED"
  echo " SSH Port is 22, 225" 
  echo " PROXY Port is 8000, 8080" 
  echo " AUTO RECON Port: $poart"
  echo " OPENVPN Port is 1194" 
  echo " All Configs: $het:81"
  echo " Webmin: $het:10000" 
  echo " Create Username: usernew"
  echo " Options: commands [infos|start_ar|ar_fixer|squid_fixer|changeport_ar|showconnected|showtotalconnected]"
  echo 
  echo "${green}===========AUTO SCRIPT BY SEVE===========${norm}" 
  echo "=========================================="
}
infoso(){ 
  clear
  colors
  poarts
  namescript=$0
  echo "clear" >> .bashrc
  het="$(dig +short myip.opendns.com @resolver1.opendns.com)" >> .bashrc
  echo "   ░▒█▀▀▀█░▒█▀▀▀░▒█░░▒█░▒█▀▀▀" >> .bashrc
echo "   ░░▀▀▀▄▄░▒█▀▀▀░░▒█▒█░░▒█▀▀▀" >> .bashrc
echo "   ░▒█▄▄▄█░▒█▄▄▄░░░▀▄▀░░▒█▄▄▄ v2" >> .bashrc
echo "" >> .bashrc
echo "==========================================" >> .bashrc
  echo "           SeveScripts v2" >> .bashrc
  echo " SSH Port is 22, 225" >> .bashrc
  echo " PROXY Port is 8000, 8080" >> .bashrc
  echo " AUTO RECON Port: $poart" >> .bashrc
  echo " OPENVPN Port is 1194" >> .bashrc
  echo " All Configs: $het:81" >> .bashrc
  echo " Webmin: $het:10000" >> .bashrc
  echo " Create Account: usernew" >> .bashrc
  echo " Create Trial Account: trial" >> .bashrc
  echo " See Your Created Accounts: member" >> .bashrc
  echo " Delete Accounts: hapus" >> .bashrc
  echo " Options: commands [infos|start_ar|changeport_ar|showconnected|showtotalconnected]" >> .bashrc
  echo " If The Script Has a problem Run this: scriptfixer " >> .bashrc
  echo "" >> .bashrc
  echo "${green}===========AUTO SCRIPT BY SEVE===========${norm}" >> .bashrc
  echo "==========================================" >> .bashrc
}
# Start Auto Recon
start_ar(){ 
poarts
clear
echo "   ░▒█▀▀▀█░▒█▀▀▀░▒█░░▒█░▒█▀▀▀"
echo "   ░░▀▀▀▄▄░▒█▀▀▀░░▒█▒█░░▒█▀▀▀"
echo "   ░▒█▄▄▄█░▒█▄▄▄░░░▀▄▀░░▒█▄▄▄ v2"
echo
read -n 1 -s -r -p "Press ${green}Enter Key${norm} to Proceed Or Press ${red}CTRL + C${norm} to stop"
clear
colors
  het="$(dig +short myip.opendns.com @resolver1.opendns.com)"
  sudo systemctl daemon-reload
  sudo systemctl start autorecon
  clear
  echo "${green}AUTO RECON HAS SUCCESSFULLY STARTED${norm}"
  echo "Port: $poart"
}
# Port Changer AutoRecon
changeport_ar(){ 
colors
poarts
clear
echo "   ░▒█▀▀▀█░▒█▀▀▀░▒█░░▒█░▒█▀▀▀"
echo "   ░░▀▀▀▄▄░▒█▀▀▀░░▒█▒█░░▒█▀▀▀"
echo "   ░▒█▄▄▄█░▒█▄▄▄░░░▀▄▀░░▒█▄▄▄ v2"
echo
echo "${magen} CHANGE THE PORT OF AUTO RECON ${norm}"
echo
# Reading The Desired Port
ok=0
while [ $ok = 0 ]
do
  read -p "Enter Your Desired Port: " pot
  if [ ${#pot} -gt 5 ]
  then
    echo Too long - 5 characters max
  else
    ok=1
  fi
done


# Sending The Request
echo "${cyan}Are you sure you want to Change the port?${norm}"
read -n 1 -s -r -p "Press ${green}Enter Key${norm} to Proceed Or Press ${red}CTRL + C${norm} to stop"
clear
echo "${green}Please Wait.${norm}"
sleep 1
clear
echo "${green}Please Wait..${norm}"
sleep 1
clear
echo "${green}Please Wait...${norm}"
sleep 1
# Sedding The Dir
sed -i '/^/d' /etc/systemd/system/autorecon.service
# Catting The Dir
cat <<EOF >>/etc/systemd/system/autorecon.service
[Unit]
Description=SeveScripts
Wants=network.target
After=network.target
[Service]
Type=simple
ExecStart=/usr/local/bin/ohpserver -port $pot -proxy 127.0.0.1:8000 -tunnel 127.0.0.1:143
Restart=always
WatchdogSec=55
[Install]
WantedBy=multi-user.target
EOF
# Start OHP inline
sudo systemctl daemon-reload
sudo systemctl start autorecon 
clear
echo 
echo "${green} CHANGING SUCCESS ${norm}"
echo "${cyan} Created By ATSL/SEVE SCRIPT${norm}"
echo 
echo " Your Port: $poart"
}
showconnected(){ 
poarts
echo "${green} ●CONNECTED USERS IP TO AUTO RECON● ${norm}"
netstat -tn 2>/dev/null | grep :$poart | grep 110 | awk '{print $5}' | cut -d: -f1| awk '!x[$0]++'
}
showtotalconnected(){ 
echo "${green} ●TOTAL CONNECTED USERS TO AUTO RECON● ${norm}"
echo "${green}$(netstat -tn 2>/dev/null | grep :$poart | uniq -u | grep 110 | awk '{print $5}' | cut -d: -f1 | awk '!x[$0]++' | wc -l )${norm}"
}
# INFO SHOW
colors
action=$1
[ -z $1 ] && action=infos
case "$action" in 
infos|start_ar|changeport_ar|showconnected|showtotalconnected) 
${action}
;; 
*) 
echo "${red}Arguments error! [ ${action} ]${norm}" 
echo "Usage: $0 [infos|start_ar|changeport_ar|showconnected|showtotalconnected]" 
;;
esac
