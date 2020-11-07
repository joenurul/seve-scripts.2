run=$1
namescript=$0
infos(){ 
  namescript=$0
  het="$(dig +short myip.opendns.com @resolver1.opendns.com)"
  echo "==========================================" 
  echo " SCRIPT IS SUCCESSFULLY INSTALLED"
  echo " SSH Port is 22, 225" 
  echo " PROXY Port is 8000, 8080" 
  echo " AUTO RECON Port: 45678
  echo " OPENVPN Port is 1194" 
  echo " All Configs: $het:81"
  echo " Webmin: $het:10000" 
  echo " Create Username: usernew"
  echo " Start AutoRecon: $namescript start_ar"
  echo 
  echo "${green}===========AUTO SCRIPT BY SEVE===========${norm}" 
  echo "=========================================="
}
start_ar(){ 
  het="$(dig +short myip.opendns.com @resolver1.opendns.com)"
  sudo systemctl start ohpserver
  echo "AUTO RECON HAS SUCCESSFULLY STARTED"
  echo "YOUR PORT: 45678"
}
# INFO SHOW
clear
run
