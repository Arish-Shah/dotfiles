#!/usr/bin/env bash

# exit if command fails
set -e

# remove vim, update system, install dependencies
sudo apt autoremove --purge vim snapd -y
sudo apt update && sudo apt upgrade -y
sudo apt install build-essential curl tmux git fzf zsh gh ripgrep --no-install-suggests --no-install-recommends -y

# make xdg directories
mkdir -p "$HOME"/.local/{share,state,bin}
mkdir -p "$HOME"/.config
mkdir -p "$HOME"/Programming

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

export BUN_INSTALL="$HOME/.local/share/bun"
curl -fsSL https://bun.com/install | bash

# download and install neovim
nvim_pkg="nvim-linux-x86_64.tar.gz"
curl -L "https://github.com/neovim/neovim/releases/latest/download/$nvim_pkg" -o "/tmp/$nvim_pkg"
sudo mkdir -p /opt/nvim
sudo tar -C /opt/nvim -xzf "/tmp/$nvim_pkg" --strip-components=1
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/vi
rm /tmp/$nvim_pkg

# change user shell to zsh
sudo chsh -s "$(which zsh)" $USER

# remove garbago files
rm -rf .bash* .motd_shown .profile .sudo_as_admin_successful .wget-hsts .cache/motd.legal .landscape

echo -e "\n\nclose this tab\nopen neovim\ngh auth login\n\n"
