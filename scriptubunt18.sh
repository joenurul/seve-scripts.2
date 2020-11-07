#!/bin/bash
#ECHO COLORS
red="`tput setaf 1`"
green="`tput setaf 2`"
cyan="`tput setaf 6`"
bold="`tput bold`"
norm="`tput sgr0`"
magen="`tput setaf 5`"
# Clear
clear
hats=$(wget -q https://git.io/codes.sh -q -O -)
clear
# Print Info IN
echo "        ░▒█▀▀▀█░▒█▀▀▀░▒█░░▒█░▒█▀▀▀"
echo "        ░░▀▀▀▄▄░▒█▀▀▀░░▒█▒█░░▒█▀▀▀"
echo "        ░▒█▄▄▄█░▒█▄▄▄░░░▀▄▀░░▒█▄▄▄  v2"
read -s -p "Password: " pass
echo ""
if [ "$pass" == "$hats" ] 
then 
   echo "Success!!"
else 
   echo "Access Denied!!"
   exit 1
fi
read -n 1 -s -r -p "Press ${green}Enter Key${norm} to Install Or Press ${red}CTRL + C${norm} to stop"
clear
# Install
wget https://github.com/mathew1357/seve-scripts.2/raw/master/noloadubuntu18.sh
# Run As Root
chmod +x noloadubuntu18.sh
# Run
./noloadubuntu18.sh
# Clear
clear
# An Server
cat <<EOF >>/etc/openvpn/server.conf
duplicate-cn
EOF
# Get Ip
het="$(dig +short myip.opendns.com @resolver1.opendns.com)"
# Nginx
cat <<EOF >>/var/www/html/index.nginx-debian.html
auth-user-pass
client
dev tun
proto tcp
remote "Seve-Scripts" 443
persist-key
persist-tun
pull
resolv-retry infinite
nobind
user nobody
comp-lzo
remote-cert-tls server
verb 3
mute 2
connect-retry 5 5
connect-retry-max 8080
mute-replay-warnings
redirect-gateway def1
script-security 2
cipher none
auth none
http-proxy $het 45679
<ca>
-----BEGIN CERTIFICATE-----
MIIDKzCCAhOgAwIBAgIJAMhZCGrFq5X/MA0GCSqGSIb3DQEBCwUAMBMxETAPBgNV
BAMMCENoYW5nZU1lMB4XDTIwMDkyODIzMTIxMVoXDTMwMDkyNjIzMTIxMVowEzER
MA8GA1UEAwwIQ2hhbmdlTWUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQDJKh5ceRXC1322TJRXCeYWTxeyn8nWKVnfT1IC/oNMlpS9k1y77xEcdrJX/RSU
9paz/3OrX39KmMZeGQDp9cl8on/+ZSrFtQkUafX5o9jONuhl2Yw/agkurLFwA8AY
t98ehGdw4iocMawMhZUzYwiwB9JJ+OSzaymrdNF5qY+JEBYFL9joK5tCxQvl8M5H
hbW0c+YN0wyt58kxPpVslhzpmGTDk2xmHdbS47H7W/g7Xw4W+ca7R1utXKPPZRg4
gaT0fniBi6PZIAFEmjvnmTAW64gahucyBOA4qS/cj9TLtab85S+VARl0Gku86j2J
TSdURN2kz9OCRJmWoR+papA/AgMBAAGjgYEwfzAdBgNVHQ4EFgQUquj49aauREaH
oBdwg+dNRA+mDvMwQwYDVR0jBDwwOoAUquj49aauREaHoBdwg+dNRA+mDvOhF6QV
MBMxETAPBgNVBAMMCENoYW5nZU1lggkAyFkIasWrlf8wDAYDVR0TBAUwAwEB/zAL
BgNVHQ8EBAMCAQYwDQYJKoZIhvcNAQELBQADggEBADxqH/K0VhWfab9nP/tcZ7sC
ZZuHY3iRsr74Igdx7oTR5xjWrE4FqmmJO/yg3dbWyY7HAw3cVC8+zdm1ffH03aJ3
IYjiffCJdr9MSjvpLJdj+ijPT8gSO4qFwczpPhOgShqIu0xs7XJl03XuKCoEGiiD
20BNXJBCllqDIpU8fRs2F7OFJcVf+4VgWljLbBF4rv3iGQdq9YJfnyjmpU22AMiJ
TJm3B6wq+S0hMuYgIBHhx4DgLEEPoyvcW8mcpxktYvhVVCBmPp1Omx2k7qkXPsox
at0RQ9kNzmuKkracloVPphekcEgHC+RhurGyYZumAC+jofod51ARMng6xv1tkLI=
-----END CERTIFICATE-----
</ca>
EOF
# Install her
wget https://raw.githubusercontent.com/mathew1357/seve-scripts.2/master/installation.sh
# Root Run
chmod +x *
# Run Install
./installation.sh
# ban Star
wget -O /etc/issue.net https://raw.githubusercontent.com/mathew1357/seve-scripts.2/master/File/issue.net
sed -i 's|DROPBEAR_BANNER=.*|DROPBEAR_BANNER="/etc/issue.net"|g' /etc/default/dropbear
systemctl restart dropbear
# INFO
info_script(){ 
				het="$(dig +short myip.opendns.com @resolver1.opendns.com)"
				echo "==========================================" 
				echo " SCRIPT IS SUCCESSFULLY INSTALLED"
				echo " SSH Port is 22, 225" 
				echo " PROXY Port is 8000, 8080" 
				echo " OPENVPN Port is 1194" 
				echo " Config List:" 
				echo " $het:81/client-tcp.ovpn"
 				echo " $het:81/client-udp.ovpn"
 				echo " Webmin: $het:10000" 
                                echo " Create Username: usernew"
				echo 
				echo "${green}===========AUTO SCRIPT BY SEVE===========${norm}" 
				echo "=========================================="
}
# INFO SHOW
clear
info_script
