#!/bin/bash
#ECHO COLORS
red="`tput setaf 1`"
green="`tput setaf 2`"
cyan="`tput setaf 6`"
bold="`tput bold`"
norm="`tput sgr0`"
magen="`tput setaf 5`"
# Install
clear
echo "    ░▒█▀▀▀█░▒█▀▀▀░▒█░░▒█░▒█▀▀▀"
echo "    ░░▀▀▀▄▄░▒█▀▀▀░░▒█▒█░░▒█▀▀▀"
echo "    ░▒█▄▄▄█░▒█▄▄▄░░░▀▄▀░░▒█▄▄▄ v2"
het="$(curl -s ifconfig.me)"
wget -q -O /etc/seveip https://raw.githubusercontent.com/mathew1357/seve-scripts.2/master/File/ip.txt
if ! grep -w -q $het /etc/seveip;
then 
   echo "${red}Sorry, only registered IPs can use this script! Contact Me On Facebook: りんか ちりくめい${norm}" 
   rm /etc/seveip
   exit 1
else 
   echo
   echo "${green} WELCOME USER ${norm}"
   rm /etc/seveip
fi
read -n 1 -s -r -p "[+] Press ${green}Enter Key${norm} to Install Or Press ${red}CTRL + C${norm} to stop"
wget -q https://github.com/mathew1357/seve-scripts.2/raw/master/autorecons.zip
# Unzip
function cleanup { 
rm autorecons.zip
echo
echo "EXITED"
echo
}
unzip autorecons.zip
# Run As Root
chmod 755 autorecon
# Sudoing AUTORECON
sudo mv autorecon /usr/local/bin/
# Nanoing The AUTORECON
clear
echo "Make Sure the Proxy Port & Dropbear port is Aligned to your server!"
trap cleanup EXIT
read -p "[+] Enter Your AutoRecon Port: " check1
read -p "[+] Enter Your Proxy Port: " check2
read -p "[+] Enter Your Dropbear Port: " check3
read -n 1 -s -r -p "[+] Press ${green}Enter Key${norm} to Proceed Or Press ${red}CTRL + C${norm} to stop"
cat <<EOF >>/etc/systemd/system/autorecon.service
[Unit]
Description= SeveScripts
Wants=network.target
After=network.target
[Service]
Type=simple
ExecStart=/usr/local/bin/autorecon -port $check1 -proxy 127.0.0.1:$check2 -tunnel 127.0.0.1:$check3
Restart=always
WatchdogSec=55
[Install]
WantedBy=multi-user.target
EOF
# Start OHP inline
rm autorecons.zip
sudo systemctl daemon-reload
sudo systemctl enable autorecon
sudo systemctl start autorecon
# Finishing
clear
echo
echo "Your Auto Recon Port: $check1"
echo "Don't Forget It!!"
