#!/bin/bash

echo "Update Ubuntu:"
sudo apt-get update -y

echo "Instalação Sophos:"
wget https://api-cloudstation-us-east-2.prod.hydra.sophos.com/api/download/3f3989c05a7db62d3c2f7327f2815c40/SophosInstall.sh
sudo chmod 777 SophosInstall.sh
sudo ./SophosInstall.sh

echo "Global Protect VPN:"
wget https://github.com/adrianomatildes/package/raw/master/GlobalProtect_deb-5.1.0.0-101.deb
sudo dpkg -i GlobalProtect_deb-5.1.0.0-101.deb

echo "Instalação Kace:"
wget https://github.com/adrianomatildes/package/raw/master/ampagent-10.2.108.ubuntu.64_hc1kace01.corp.endurance.com.deb
sudo KACE_SERVER=hc1kace01.corp.endurance.com dpkg -i ampagent-10.2.108.ubuntu.64_hc1kace01.corp.endurance.com.deb
sudo systemctl enable konea

echo "Integração AD Endurance:"
wget https://github.com/BeyondTrust/pbis-open/releases/download/8.5.7/pbis-open-8.5.7.385.linux.x86_64.deb.sh
sudo apt install openssh-server -y
sudo sh pbis-open-8.5.7.385.linux.x86_64.deb.sh
sudo /opt/pbis/bin/domainjoin-cli join CORP.ENDURANCE.COM

echo "Reiniciando"
sudo reboot

