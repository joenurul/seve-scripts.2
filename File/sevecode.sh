# SED MO MUNA

sed -i 's|DROPBEAR_BANNER=.*|DROPBEAR_BANNER="/etc/banner"|g' /etc/default/dropbear

# Restart Mo na

systemctl restart dropbear

# CLEAR
clear

echo "To Edit The Banner run this 'nano /etc/banner' then save, then run this script again"
