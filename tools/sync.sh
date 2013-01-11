#! /bin/bash

rsync -a ~/.vim/ ~/vimfiles --exclude='.*'
sleep 1
cd ~;tar -cf vimfiles.tar vimfiles
