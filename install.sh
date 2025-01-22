#!/bin/bash

# generate all directories
dst=$HOME/.config
dirs=$(ls $PWD/.config)

for dir in $dirs; do
    mkdir -v $dst/$dir
done

# Generate symlinks
stow .

# Handle conflicts

# read -p "pc or laptop: " comp
#
# dotfiles=$PWD
# cd $dst/alacritty
# ln -s "$dotfiles"/conflicts/"$comp"_alacritty.toml alacritty.toml

