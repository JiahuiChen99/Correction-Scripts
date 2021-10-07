#!/bin/bash

unzip_install="Installing unzip for"

# Checks OS and install Unzip
check_distribution () {
  # Gets OS Distribution
  # Example: DISTRIB_ID=Ubuntu
  version=`head -n 1 /etc/lsb-release | awk -F "=" '{print $2}'`

  case $version in
    "Ubuntu" | "Debian" | "Mint")
      echo $unzip_install $version
      #sudo apt install unzip
      ;;
    "RedHat" | "CentOS" | "Fedora")
      echo $unzip_install $version
      #sudo dnf install unzip
    ;;
    "Arch" | "Manjaro")
      echo $unzip_install $version
      #sudo pacman -S unzip
    ;;
    *)
      echo "Not supported Linux Distribution, install unzip manually!"
      exit
    ;;
  esac
}

# Check if unzip is installed
if ! command -v unzip &> /dev/null
then
    check_distribution
fi

# Decompress zip
zipname=$1
unzip $zipname