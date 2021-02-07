#!/bin/bash

WD="$(dirname "$(readlink -f "$0")")"

setup_symlinks() {
    ln -sf $WD/vim/vimrc ~/.vimrc
    ln -sf $WD/tmux/tmux.conf ~/.tmux.conf
    ln -sf $WD/bash/bashrc ~/.bashrc
}

setup_symlinks
