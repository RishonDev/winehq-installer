#!/bin/bash
version="4.0"
flags=""
printversion(){
  echo "WineHQ installer version $version"
  echo "Wine "
}
ubuntu(){
  ./core/winhq-installer-ubuntu.sh
}
debian(){
  ./core/winhq-installer-debain.sh
}
fedora(){
  ./core/winhq-installer-fedora.sh
}
print_usage() {
  echo "Options:"
  echo "-ubuntu       Enters the Ubuntu installer of wine"
  echo "-fedora       Enters the Fedora installer of wine"
  echo "-debian       Enters the Debian installer of wine"
  echo "-version      Prints app information"
  echo "-upgrade      Upgrades your Wine. Ubuntu updates may be applied for the smooth experience for wine."
  echo "-verbose      Displays all the logs on screen."
  echo "-silent       Finishes All the processes with no output. Useful for using it in the background.."
  echo "-log          Adds debug logs to process any errors."

}
while getopts 'abf:v' flag; do
  case "${flag}" in
    ubuntu) ubuntu ;;
    fedora) fedora ;;
    debian) debian ;;
    version) printversion ;;
    verbose) flags="$flags -v" ;;
    *) print_usage
       exit 1 ;;
  esac
done
echo