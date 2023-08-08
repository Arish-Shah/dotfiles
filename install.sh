#!/usr/bin/env bash

# remove vim, update system, install dependencies
sudo apt autoremove --purge vim -y
sudo apt update && sudo apt upgrade -y
sudo apt install fzf exa zsh build-essential gh ripgrep libfuse2 --no-install-suggests --no-install-recommends -y

# make directories
mkdir -p ./{.local/{share,state/zsh},.cache/zsh,.config,dev}

# clone dotfiles
git clone https://github.com/Arish-Shah/dotfiles ~/dev/dotfiles

# install oh-my-zsh
export ZSH="$HOME/.local/share/oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy all my dotfiles
cp ~/dev/dotfiles/.zsh* ~
cp ~/dev/dotfiles/.tmux.conf ~
cp ~/dev/dotfiles/.config/npm ~/.config -r
cp ~/dev/dotfiles/.config/nvim ~/.config -r
cp ~/dev/dotfiles/.local/bin ~/.local -r

# configure git
git config --global init.defaultBranch main
git config --global user.name "Arish-Shah"
git config --global user.email "arish.r.shah@gmail.com"

# install fnm
curl -fsSL https://fnm.vercel.app/install | bash --install-dir ~/.local/share/fnm

# download neovim
wget -P ~/.local/bin/ https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod +x ~/.local/bin/nvim.appimage

# change user shell to zsh
sudo chsh -s /usr/bin/zsh $USER

# remove garbago files
rm .bash* .motd_shown .profile .sudo_as_admin_successful .wget-hsts

echo -e "\n\nclose this tab\nopen neovim\ngh auth login\n\n"
