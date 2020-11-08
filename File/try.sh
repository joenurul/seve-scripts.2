#!/bin/bash
het="$(dig +short myip.opendns.com @resolver1.opendns.com)"
vps="vps";
if [[ $vps = "vps" ]]; then 
source="https://raw.githubusercontent.com/mathew1357/seve-scripts.2/master" else 
source="https://raw.githubusercontent.com/mathew1357/seve-scripts.2/master"
fi

wget -q -O seveip https://raw.githubusercontent.com/mathew1357/seve-scripts.2/master/File/ip.txt 
if ! grep -w -q $het seveip; then 
echo "Sorry, only registered IPs can use this script! Contact Me On Facebook: りんか ちりくめい" 
if [[ $vps = "vps" ]]; then 
		echo "IP ALLOWED" 	else 
		echo "Powered by SeveScripts" 	
		fi
		rm -f /root/seveip
		exit 
		fi
echo " HELLO WORLD "
