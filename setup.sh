#!/bin/bash

PACKAGES=$(cat termux-packages.txt)

copy () {
  cp -r $1 ~/
}

init() {
  apt update
  apt -y upgrade
}

run_dpkg() {
    dpkg -l "$1" | grep -q ^ii && return 1
    apt-get -y install "$@"
    #pkg install $@
    return 0
}

add_pkgs() {
  for p in ${PACKAGES}
  do
    run_dpkg $p
  done
}

add_other() {
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        pip install yt-dlp
}

add_vim() {
  mkdir -p ~/.vim/bundle
  git clone git://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
}

init

copy bin
copy .termux
copy .bashrc
copy .vimrc
copy .ssh

add_pkgs
add_vim
add_other
