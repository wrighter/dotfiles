#!/bin/bash

cd

umask 0002

mkdir -p projects
mkdir -p bin

[[ -e projects/dotfiles ]] || git clone https://github.com/wrighter/dotfiles.git projects/dotfiles

[[ -e ~/bin/sensible.bash ]] || (curl https://raw.githubusercontent.com/mrzool/bash-sensible/master/sensible.bash  > ~/bin/sensible.bash && echo "

if [ -f ~/bin/sensible.bash ]; then
   source ~/bin/sensible.bash
fi

set -o vi 

" >> ~/.bashrc)

ln -sfT ~/projects/dotfiles/gitconfig ~/.gitconfig
ln -sfT ~/projects/dotfiles/vimrc ~/.vimrc
ln -sfT ~/projects/dotfiles/tmux.conf  ~/.tmux.conf
