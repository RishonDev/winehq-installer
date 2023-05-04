#!/bin/bash
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

echo "Updating script..."
spin &
SPIN_PID=$!
trap "kill -9 $SPIN_PID" `seq 0 15`
wget https://raw.githubusercontent.com/RishonDev/get-wine-latest.sh/main/wine-installer-ubuntu.sh
kill -9 $SPIN_PID
echo "Done."
