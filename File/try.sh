#!/bin/bash
het="$(dig +short myip.opendns.com @resolver1.opendns.com)"
vps="vps";
wget -q -O seveip https://raw.githubusercontent.com/mathew1357/seve-scripts.2/master/File/ip.txt 
if ! grep -w -q $het seveip; 
then 
   echo "Sorry, only registered IPs can use this script! Contact Me On Facebook: りんか ちりくめい" 
else 
   echo " YOUR IP IS ALLOWED
   rm -f /root/seveip
fi
echo " HELLO WORLD "
