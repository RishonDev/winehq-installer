RELEASE=$(lsb_release -sr)
while getopts ":v:" opt; do
  case $opt in
    v)
      echo "4.0.0"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      echo "-v Displays the version"
      exit 1
      ;;
  esac
done

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
sudo dpkg --add-architecture i386 || { echo 'ERROR: Unable to enable 32-bit support.' ; exit 1; }
kill -9 $SPIN_PID


echo "Adding the repositories... "
spin &
SPIN_PID=$!
trap "kill -9 $SPIN_PID" `seq 0 15`
{
if [ "$RELEASE" = "41" ]; then
    dnf5 config-manager addrepo --from-repofile=https://dl.winehq.org/wine-builds/fedora/41/winehq.repo
    sudo dnf update
fi

if [ "$RELEASE" = "40" ]; then
    dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/40/winehq.repo
    sudo apt update
fi

} &> ./logs/repoLog.txt || &> /dev/null
kill -9 $SPIN_PID
clear
echo "1)Stable build (Recommended)"
echo "2)Development build (Recommended for testing use only)"
echo "3)Staging build (Recommended for testing use only)"
read -p "Select build channel:" build -n 1 -r
if ["$build" = "1"]
  build = "stable"
fi
if ["$build" = "2"]
  build = "devel"
fi
if ["$build" = "3"]
  build = "staging"
fi
read -p "Ready? [Y/n]: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
    then
    echo
    spin &
    SPIN_PID=$!
    trap "kill -9 $SPIN_PID" `seq 0 15`
    sudo dnf install winehq-"$build" winetricks &> ./logs/installLog.txt
    winecfg &> ./logs/configLog.txt
else
    echo
    echo "Abort."
fi
echo "The logs can be found at" $(pwd)"/logs/"
