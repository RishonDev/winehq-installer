#!/bin/bash
while getopts ":v:" opt; do
  case $opt in
    v)
      echo "2.1.0"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      echo "-v Displays the version"
      exit 1
      ;;
  esac
done

RELEASE=$(lsb_release -sr)
spin()
{
  spinner="/|\\-/|\\-"
  while :
  do
    for i in `seq 0 7`
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 0.1
    done
  done
}

#Creates Logs
mkdir ./logs
touch ./logs/repoLog.txt
touch ./logs/repoLog2.txt
touch ./logs/installLog.txt
touch ./logs/configLog.txt
echo "Enabling 32-bit support... "
spin &
SPIN_PID=$!
trap "kill -9 $SPIN_PID" `seq 0 15`
sudo dpkg --add-architecture i386
kill -9 $SPIN_PID


echo "Adding the repositories... " 
spin &
SPIN_PID=$!
trap "kill -9 $SPIN_PID" `seq 0 15`
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
kill -9 $SPIN_PID

read -p "Install wine? [Y/n]: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
    then
    echo
    spin &
    SPIN_PID=$!
    trap "kill -9 $SPIN_PID" `seq 0 15`
    sudo apt install winehq-stable winetricks &> ./logs/installLog.txt
    winecfg &> ./logs/configLog.txt
else 
    echo
    echo "Abort."
fi
echo "The logs can be found at" $(pwd)"/"
