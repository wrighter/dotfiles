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

for c in gitconfig vimrc tmux.conf editrc inputrc flake8
do
  ln -sf ~/projects/dotfiles/${c} ~/.${c}
done

[[ -e ~/.vim/bundle/Vundle.vim ]] ||  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


