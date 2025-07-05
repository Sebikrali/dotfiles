#!/bin/bash

######## DOTFILES ########

# generate all directories
dst=$HOME/.config
config_dirs=$(ls $PWD/.config)
for dir in $config_dirs; do
    mkdir -v $dst/$dir
done

# data_dirs=$(ls $PWD/.local/share)
# for dir in $data_dirs; do
#     mkdir -v $dst/$dir
# done

# Generate symlinks
stow .config
stow .local
stow bash
stow zsh
stow ideavim

# Handle different hosts
read -p "pc[1] or laptop[2]: " selection
if [[ "$selection" == "1" || "$selection" == "pc" ]]; then
    host="pc"
elif [[ "$selection" == "2" || "$selection" == "laptop" ]]; then
    host="laptop"
else
    echo "invalid host name. Terminating."
    exit 1
fi

host_dirs=$(ls $PWD/_$host)
for dir in $host_dirs; do
    files=$(ls $PWD/_$host/$dir)
    for file in $files; do
        mkdir -p $dst/$dir
        ln -s -v $PWD/_$host/$dir/$file $dst/$dir/$file
    done
done


######## PACKAGES ########

# Source the os-release file
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    echo "Cannot determine the distribution."
    exit 1
fi

case "$DISTRO" in
    "arch")
        sudo pacman -S --noconfirm  bat btop eza fastfetch fzf git-delta jq just lazygit mpd ncdu neovim nmon nvtop onefetch tokei ranger ripgrep rmpc starship stow syncthing sd tldr tmux trash-cli ufw wireguard-tools yazi zathura zip unzip zoxide zsh zsh-autosuggestions zsh-syntax-highlighting networkmanager flatpak gimp evince typst firefox go gparted mangohud obsidian rustup timeshift haruna wezterm
        if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
            sudo pacman -S --noconfirm wl-clipboard
        elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
            sudo pacman -S --noconfirm xclip xsel
        fi
        ;;
    *)
        ;;
esac

