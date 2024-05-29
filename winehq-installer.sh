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
  echo "-fedora       Installs ubuntu version of wine"
  echo "-debian       Installs debian version of wine"
  echo "-version      Prints app information"

  echo "-verbose"
  echo "-silent"
  echo "-log"

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