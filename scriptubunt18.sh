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
# Get Commands
wget https://raw.githubusercontent.com/mathew1357/seve-scripts.2/master/File/commands.sh
chmod +x commands.sh
# Get Ip
het="$(dig +short myip.opendns.com @resolver1.opendns.com)"
# Nginx
sed -i '/^/d' /var/www/html/index.nginx-debian.html
cat <<EOF >>/var/www/html/index.nginx-debian.html
<!DOCTYPE html><html lang="en"><head> <!-- Theme Made By ATSL--> <title>SEVE CONFIGS | DOWNLOAD</title> <meta charset="utf-8"> <meta name="viewport" content="width=device-width, initial-scale=1"> <link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css"> <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css"> <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css"> <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <style> body { font: 400 15px Lato, sans-serif; line-height: 1.8; color: #818181; } h2 { font-size: 24px; text-transform: uppercase; color: #303030; font-weight: 600; margin-bottom: 30px; } h4 { font-size: 19px; line-height: 1.375em; color: #303030; font-weight: 400; margin-bottom: 30px; } .jumbotron { background-color: #f4511e; color: #fff; padding: 100px 25px; font-family: Montserrat, sans-serif; } .container-fluid { padding: 60px 50px; } .bg-grey { background-color: #f6f6f6; } .logo-small { color: #f4511e; font-size: 50px; } .logo { color: #f4511e; font-size: 200px; } .thumbnail { padding: 0 0 15px 0; border: none; border-radius: 0; } .thumbnail img { width: 100%; height: 100%; margin-bottom: 10px; } .carousel-control.right, .carousel-control.left { background-image: none; color: #f4511e; } .carousel-indicators li { border-color: #f4511e; } .carousel-indicators li.active { background-color: #f4511e; } .item h4 { font-size: 19px; line-height: 1.375em; font-weight: 400; font-style: italic; margin: 70px 0; } .item span { font-style: normal; } .panel { border: 1px solid #f4511e; border-radius:0 !important; transition: box-shadow 0.5s; } .panel:hover { box-shadow: 5px 0px 40px rgba(0,0,0, .2); } .panel-footer .btn:hover { border: 1px solid #f4511e; background-color: #fff !important; color: #f4511e; } .panel-heading { color: #fff !important; background-color: #f4511e !important; padding: 25px; border-bottom: 1px solid transparent; border-top-left-radius: 0px; border-top-right-radius: 0px; border-bottom-left-radius: 0px; border-bottom-right-radius: 0px; } .panel-footer { background-color: white !important; } .panel-footer h3 { font-size: 32px; } .panel-footer h4 { color: #aaa; font-size: 14px; } .panel-footer .btn { margin: 15px 0; background-color: #f4511e; color: #fff; } .navbar { margin-bottom: 0; background-color: #f4511e; z-index: 9999; border: 0; font-size: 12px !important; line-height: 1.42857143 !important; letter-spacing: 4px; border-radius: 0; font-family: Montserrat, sans-serif; } .navbar li a, .navbar .navbar-brand { color: #fff !important; } .navbar-nav li a:hover, .navbar-nav li.active a { color: #f4511e !important; background-color: #fff !important; } .navbar-default .navbar-toggle { border-color: transparent; color: #fff !important; } footer .glyphicon { font-size: 20px; margin-bottom: 20px; color: #f4511e; } .slideanim {visibility:hidden;} .slide { animation-name: slide; -webkit-animation-name: slide; animation-duration: 1s; -webkit-animation-duration: 1s; visibility: visible; } @keyframes slide { 0% { opacity: 0; transform: translateY(70%); } 100% { opacity: 1; transform: translateY(0%); } } @-webkit-keyframes slide { 0% { opacity: 0; -webkit-transform: translateY(70%); } 100% { opacity: 1; -webkit-transform: translateY(0%); } } @media screen and (max-width: 768px) { .col-sm-4 { text-align: center; margin: 25px 0; } .btn-lg { width: 100%; margin-bottom: 35px; } } @media screen and (max-width: 480px) { .logo { font-size: 150px; } } </style></head><body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60"><nav class="navbar navbar-default navbar-fixed-top"> <div class="container"> <div class="navbar-header"> <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button> <a class="navbar-brand" href="#myPage">SEVE CONFIGS</a> </div> <div class="collapse navbar-collapse" id="myNavbar"> <ul class="nav navbar-nav navbar-right"> <li><a href="$het/index.html">HOME</a></li> </ul> </div> </div></nav><div class="jumbotron text-center"> <h1>DOWNLOAD LINKS</h1> <p>This is the page you can Download the Config</p></div><div id="about" class="container-fluid"> <div class="row"> <div class="col-sm-4"><h2>Available Configs</h2><div class="container-fluid bg-grey"><br><h2><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT0FL6cNsFA1bHiIU2xXWJbK654fyDOwYtwdOAtpzUSlhdMJoN6" class="w3-image w3-greyscale-min" style="width:100%">OpenVpn Configs</h2><div class="dropdown"> <button class="btn btn-primary dropdown-toggle enabled" type="button" data-toggle="dropdown">Configs <span class="caret"></span></button> <ul class="dropdown-menu" class="enabled"> <li><a href="http://$het/client-tcp.ovpn">TCP Download</a></li> <li class="enabled"><a href="http://$het/client-udp.ovpn">UDP Download</a></li> </ul> </div></div><br/></br></div><style>.modal-window { position: fixed; background-color: rgba(200, 200, 200, 0.75); top: 0; right: 0; bottom: 0; left: 0; z-index: 999; opacity: 0; pointer-events: none; -webkit-transition: all 0.3s; -moz-transition: all 0.3s; transition: all 0.3s; } .modal-window:target { opacity: 1; pointer-events: auto; } .modal-window>div { width: 350px; position: relative; margin: 10% auto; padding: 2rem; background: ; color: #000; } .modal-window header { font-weight: bold; } .modal-close { color: #aaa; line-height: 50px; font-size: 80%; position: absolute; right: 0; text-align: center; top: 0; width: 70px; text-decoration: none; } .modal-close:hover { color: #000 ; } .modal-window h1 { font-size: 150%; margin: 0 0 15px; }</style><style> form { border-style: solid; border-color: coral;}iframe { border-style: solid; border-color: coral;}</style>
<center>
<b>CREATED BY SEVE SCRIPTS</b>
<!-- THE CSS -->

<style>body {background-color: lightblue;}</style><style>
table {
  border-collapse: collapse;
  width: 70%;
}
th, td {
  text-align: left;
  padding: 6px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: coral;
  color: white;
}
colorbg {
		background-color: lightblue
		color: white;
}
</style>
<style>html {
  scroll-behavior: smooth;
}</style></center>
EOF
# Securing The Squid
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
# INFO SHOW
clear
chmod +x commands.sh
./commands.sh infos
