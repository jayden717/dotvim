#! /bin/bash

mkdir -p ~/vim_tools
cd ~/vim_tools

wget --no-check-certificate https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-dark
cp -r dircolors.ansi-dark ~/.dircolors
eval `dircolors ~/.dircolors`

git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./set_dark.sh
#./set_light.sh

cd ~/vim_tools
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh

cd 

#Set up Vundle:
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall


