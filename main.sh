#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'

NC='\033[0m'

echo -e "Created by ${BLUE}Kevin Zhang${NC}"
echo -e "Works only with ${RED}HP Envy m7-u009dx${NC}"

echo -e -n "Continue? (${GREEN}y${NC}|${RED}n${NC})  "
read proceed

if [[( $proceed == "Y" || $proceed == "y" )]]; then
  sudo apt-get update

  echo -e "\n${YELLOW}Installing NVIDIA Driver${NC}"

  sudo apt-get -y --assume-yes install nvidia-driver
  #sudo cp /etc/X11/xorg.conf /etc/X11/xorg.conf_backup
  #sudo nvidia-glx-config enable

  #echo -e "[Desktop Entry] \nName=NVIDIA Settings \nComment=NVIDIA Settings \nExec=nvidia-settings \nIcon= \nTerminal=false \nType=Application \nCategories=Application;System">> /usr/share/applications/NVIDIA-Settings.desktop

  #sh NVIDIA-Linux-x86_64-460.56.run -a -q

  echo ""
  echo -e  "${YELLOW}Installing wifi firmware${NC}"
  apt-get -y install firmware-iwlwifi
  sudo modprobe -r iwlwifi
  sudo modprobe iwlwifi

  echo ""
  echo -e "${YELLOW}Installing non-free firmware${NC}"
  sudo apt-get -y install firmware-misc-nonfree
  sudo apt -y install firmware-linux firmware-linux-nonfree firmware-realtek

  echo -e -n "${RED}REBOOTING IN 10 SECONDS"
  for (( counter=0; counter<10; counter ++))
  do
  sleep 1
  echo -n "."
  done
  echo -e "${NC}"
  sudo reboot
else
  echo 'Aborting execution...'
fi
