#!/data/data/com.termux/files/usr/bin/bash

#colors
red="\033[1;91m"
cyan="\033[1;96m"
white="\033[1;97m"
reset="\033[0m"

#installing required pkgs
apt update && apt upgrade -y 

pkgs=(neovim vim python lsd)

for i in ${pkgs[@]} ; do
  if ! hash ${i} > /dev/null 2>&1 ; then
    echo -e "\n${white}[ ${red}* ${white}] ${cyan}Installing ${i} ${reset}\n"
    apt install ${i} -y
  else :
    echo -e "\n${white}[ ${red}* ${white}] ${cyan} Requirements Satisfied !${reset}"
  fi
done

#configuring termux
echo "\n\033[97m\033[107m\033[90m \w\033[0m\033[97m\033[0m" > $PREFIX/etc/bash.bashrc
echo "alias \"lsd\"=ls" >> $PREFIX/etc/bash.bashrc

if [[ -d ~/.termux ]] ; then
  rm -rf ~/.termux/*
else :
  mkdir .termux
fi

if [[ -f ./files/font.ttf ]] && [[ -f ./files/colors.properties ]] && [[ -d ./files/nvim-config ]] && [[ -f ./files/termux.properties ]]; then
  mv ./files/* ~/.termux
else :
  echo "cloning"
fi


