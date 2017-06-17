#!/bin/bash
time=$(date +"%T")
echo "$time [INFO] Starting Leveryl installation..."
time=$(date +"%T")
echo "$time [INFO] Checking for Dependancies"
if [ -f /etc/debian_version ]; then
	time=$(date +"%T")
    command -v wget >/dev/null 2>&1 || { echo "$time [ERROR] WGET Command not Found, Installing WGET..." >&2; apt-get -y install wget;}
	time=$(date +"%T")
    command -v unzip >/dev/null 2>&1 || { echo "$time [ERROR] UNZIP Command not Found, Installing UNZIP..." >&2; apt-get -y install unzip;}
elif [ -f /etc/redhat-release ]; then
	time=$(date +"%T")
    command -v wget >/dev/null 2>&1 || { echo "$time [ERROR] WGET Command not Found, Installing WGET..." >&2; yum -y install wget;}
	time=$(date +"%T")
    command -v unzip >/dev/null 2>&1 || { echo "$time [ERROR] UNZIP Command not Found, Installing UNZIP..." >&2; yum -y install unzip;}
else
	time=$(date +"%T")
    command -v wget >/dev/null 2>&1 || { echo "$time [ERROR] WGET Command not Found, Installing WGET..." >&2; apt-get -y install wget;}
	time=$(date +"%T")
    command -v unzip >/dev/null 2>&1 || { echo "$time [ERROR] UNZIP Command not Found, Installing UNZIP..." >&2; apt-get -y install unzip;}
fi
time=$(date +"%T")
echo "$time [INFO] Downloading Latest Github Build..."
wget https://github.com/LeverylTeam/LeverylTeam/Leveryl/archive/master.zip
chmod 777 master.zip
time=$(date +"%T")
echo "$time [INFO] Un-Zipping..."
unzip -o master.zip
chmod 777 Leveryl-master
cd Leveryl-master
chmod 777 src
time=$(date +"%T")
echo "$time [INFO] Copying Files..."
cp -rf src ..
chmod +x start.sh
cp -rf start.sh ..
time=$(date +"%T")
echo "$time [INFO] Cleaning up..."
cd ..
rm -rf Leveryl-master
rm -rf master.zip
wget --no-check-certificate https://raw.githubusercontent.com/LeverylTeam/Leveryl/master/LICENSE.md
time=$(date +"%T")
echo "$time [INFO] Installing x64 PHP binary..."
wget --no-check-certificate https://bintray.com/artifact/download/pocketmine/PocketMine/PHP_7.0.2_x86-64_Linux.tar.gz
chmod 777 PHP_7.0.2_x86-64_Linux.tar.gz
tar zxvf PHP_7.0.2_x86-64_Linux.tar.gz
rm -r PHP_7.0.2_x86-64_Linux.tar.gz
time=$(date +"%T")
echo "$time [NOTICE] Installation Finished!"