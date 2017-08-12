#!/bin/bash
clear
time=$(date +"%T") &> /dev/null
echo "$time [INFO] Starting Leveryl installation..."
time=$(date +"%T") &> /dev/null
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
time=$(date +"%T") &> /dev/null
echo "$time [INFO] Downloading Latest Github Build..."
wget --no-check-certificate https://github.com/LeverylTeam/Leveryl/archive/master.zip &> /dev/null
chmod 777 master.zip &> /dev/null
time=$(date +"%T") &> /dev/null
echo "$time [INFO] Un-Zipping..."
unzip -o master.zip &> /dev/null
chmod 777 Leveryl-master &> /dev/null
cd Leveryl-master &> /dev/null
chmod 777 src &> /dev/null
time=$(date +"%T") &> /dev/null
echo "$time [INFO] Copying Files..."
cp -rf src .. &> /dev/null
chmod +x start.sh &> /dev/null
cp -rf start.sh .. &> /dev/null
time=$(date +"%T") &> /dev/null
echo "$time [INFO] Cleaning up..."
cd .. &> /dev/null
rm -rf Leveryl-master &> /dev/null
rm -rf master.zip &> /dev/null
time=$(date +"%T") &> /dev/null
echo "$time [INFO] Installing x64 PHP binary..."
wget --no-check-certificate https://raw.githubusercontent.com/LeverylTeam/PHP7-Binaries/master/PHP-7.0.14_Linux-x84_64.zip &> /dev/null
chmod 777 PHP-7.0.14_Linux-x84_64.zip &> /dev/null
unzip -o PHP-7.0.14_Linux-x84_64.zip &> /dev/null
rm -r PHP-7.0.14_Linux-x84_64.zip &> /dev/null
chmod +x start.sh &> /dev/null
time=$(date +"%T") &> /dev/null
echo "$time [NOTICE] Installation Finished!"
time=$(date +"%T") &> /dev/null
echo "$time [NOTICE] Type ./start.sh to start!"
