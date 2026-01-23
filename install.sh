#!/usr/bin/env bash

# exit if command fails
set -e

# remove vim, update system, install dependencies
sudo apt autoremove --purge vim snapd -y
sudo apt update && sudo apt upgrade -y
sudo apt install build-essential curl fzf git gh ripgrep tmux unzip zsh --no-install-suggests --no-install-recommends -y
sudo apt autoremove --purge vim-tiny -y

# make xdg directories
mkdir -p "$HOME/.local/"{share,state,bin} \
    "$HOME/.config" \
    "$HOME/Programming"

# clone dotfiles
if [ ! -d "$HOME/Programming/dotfiles" ]; then
    git clone https://github.com/Arish-Shah/dotfiles "$HOME/Programming/dotfiles"
fi

# install oh-my-zsh
export ZSH="$HOME/.local/share/oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy all my dotfiles
cp "$HOME/Programming/dotfiles/.zsh"* "$HOME/"
cp -r "$HOME/Programming/dotfiles/.config/"* "$HOME/.config/"
cp -r "$HOME/Programming/dotfiles/.local/bin/"* "$HOME/.local/bin/"

# install bun and setup symlinks
export BUN_INSTALL="$HOME/.local/share/bun"
curl -fsSL https://bun.com/install | bash
ln -sf "$HOME/.local/share/bun/bin/bun" "$HOME/.local/bin/node"
ln -sf "$HOME/.local/share/bun/bin/bun" "$HOME/.local/bin/npm"
ln -sf "$HOME/.local/share/bun/bin/bun" "$HOME/.local/bin/bun"

# download and install neovim
nvim_pkg="nvim-linux-x86_64.tar.gz"
curl -L "https://github.com/neovim/neovim/releases/latest/download/$nvim_pkg" -o "/tmp/$nvim_pkg"
mkdir -p "$HOME/.local/share/nvim"
tar -xzf "/tmp/$nvim_pkg" -C "$HOME/.local/share/nvim" --strip-components=1
ln -sf "$HOME/.local/share/nvim/bin/nvim" "$HOME/.local/bin/vi"
rm "/tmp/$nvim_pkg"

# change user shell to zsh
sudo chsh -s "$(which zsh)" $USER

# remove garbago files
rm -rf "$HOME/.bash"* \
    "$HOME/.motd_shown" \
    "$HOME/.profile" \
    "$HOME/.wget-hsts" \
    "$HOME/.landscape"

echo -e "\n\nclose this tab\nopen neovim\ngh auth login\n\n"
