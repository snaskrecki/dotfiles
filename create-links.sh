#!/bin/bash

mkdir -p $HOME/.config
mkdir -p $HOME/.config/Code/User
mkdir -p $HOME/.config/i3

DOTFILES=$(pwd)

ln -nfs $DOTFILES/bashrc $HOME/.bashrc
ln -nfs $DOTFILES/gitconfig $HOME/.gitconfig

ln -nfs $DOTFILES/vim $HOME/.vim
ln -nfs $DOTFILES/vim/vimrc $HOME/.vimrc
ln -nfs $DOTFILES/vim/viminfo $HOME/.viminfo

ln -nfs $DOTFILES/nvim $HOME/.config
ln -nfs $DOTFILES/Code/User/settings.json $HOME/.config/Code/User/settings.json
ln -nfs $DOTFILES/i3/config $HOME/.config/i3/config

# TODO automate stuff, loop array...
