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

cd $HOME
echo "Uninstalling Wine... "
{
spin &
SPIN_PID=$!
trap "kill -9 $SPIN_PID" `seq 0 15`
rm -r .wine
rm .config/menus/applications-merged/wine*
rm -r .local/share/applications/wine
rm .local/share/desktop-directories/wine*
rm .local/share/icons/????_*.xpm
sudo apt purge --autoremove winehq-stable -y
sudo apt-get update
sudo apt-get autoclean -y
sudo apt-get clean -y
sudo apt-get autoremove -y
} &> /dev/null

kill -9 $SPIN_PID