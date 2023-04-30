#!/usr/bin/env bash

# update system
sudo apt update && sudo apt upgrade -y

# remove vim
sudo apt autoremove --purge vim -y

# install packages
sudo apt install fzf exa zsh build-essential gh ripgrep libfuse2 --no-install-suggests --no-install-recommends -y

# make directories
mkdir -p ./{.local/{share,state},.cache/{zsh},.config,dev}

# clone dotfiles
cd dev
git clone https://github.com/Arish-Shah/dotfiles --depth=1
cd

# install oh-my-zsh
export ZSH="$HOME/.local/share/oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy dotfiles
cp ~/dev/dotfiles/.zsh* ~
cp ~/dev/dotfiles/.tmux.conf ~
cp ~/dev/dotfiles/.config/npm ~/.config -r
cp ~/dev/dotfiles/.config/nvim ~/.config -r
cp ~/dev/dotfiles/.local/bin ~/.local -r

# configure git
git config --global init.defaultBranch main
git config --global user.name "Arish-Shah"
git config --global user.email "arish.r.shah@gmail.com"

# install nvm
export NVM_DIR="$HOME/.local/share/nvm"
mkdir $NVM_DIR
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# install neovim
wget -P ~/.local/bin/ https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod +x ~/.local/bin/nvim.appimage

# login to gh
# open vim once
