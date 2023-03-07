#!/bin/bash
RELEASE=$(lsb_release -sr)
#Creates Logs
mkdir ./logs
touch ./logs/repoLog.txt
touch ./logs/repoLog2.txt
touch ./logs/installLog.txt
touch ./logs/configLog.txt
echo "Enabling 32-bit support..."
sudo dpkg --add-architecture i386
echo "Adding the repositories..." 
sudo add-apt-repository universe -y &>> ./logs/repoLog2.txt
{   
if [ "$RELEASE" = "20.04" ]; then
    sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources
    sudo apt update
fi    

if [ "$RELEASE" = "22.04" ]; then
    sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources 
    sudo apt update 
fi

if [ "$RELEASE" = "22.10" ]; then
    sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/kinetic/winehq-kinetic.sources 
    sudo apt update 
else 
    echo "Unsupported release"
fi
    sudo mkdir -pm755 /etc/apt/keyrings
    sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key 
    sudo apt update
} &> ./logs/repoLog.txt

read -p "Install wine? [Y/n]:" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
    then
    sudo apt install winehq-stable winetricks &> ./logs/installLog.txt
    winecfg &> ./logs/configLog.txt
else 
    echo
    echo "Abort."
fi
echo "The logs can be found at" $(pwd)"/"