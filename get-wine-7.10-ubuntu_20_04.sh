echo "Setting up dependencies..."
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources
sudo mv winehq-focal.sources /etc/apt/sources.list.d/
sudo apt update
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo mv winehq.key /usr/share/keyrings/winehq-archive.key
sudo apt update
echo "\nInstalling wine 7.11 ...."
sudo apt install winehq-stable winetricks

echo "\nSetting up wine..."
winecfg
echo "\nDone!"

