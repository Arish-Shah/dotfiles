#!/usr/bin/env bash

# remove vim, update system, install dependencies
sudo apt autoremove --purge vim -y
sudo apt update && sudo apt upgrade -y
sudo apt install curl tmux git unzip fzf zsh build-essential gh neovim ripgrep python3-venv --no-install-suggests --no-install-recommends -y

# make directories
mkdir -p ./{.local/{share,state/zsh},.cache/zsh,.config,Programming}

# clone dotfiles
git clone https://github.com/Arish-Shah/dotfiles ~/Programming/dotfiles

# install oh-my-zsh
export ZSH="$HOME/.local/share/oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy all my dotfiles
cp ~/Programming/dotfiles/.zsh* ~
cp ~/Programming/dotfiles/.tmux.conf ~
cp ~/Programming/dotfiles/.config/npm ~/.config -r
cp ~/Programming/dotfiles/.config/nvim ~/.config -r
cp ~/Programming/dotfiles/.local/bin ~/.local -r

# configure git
git config --global init.defaultBranch main
git config --global user.name "Arish-Shah"
git config --global user.email "arish.r.shah@gmail.com"

# install nvm
export NVM_DIR="$HOME/.local/share/nvm"
mkdir $NVM_DIR
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# install node.js
/usr/bin/zsh -i -c "nvm install --lts"

# change user shell to zsh
sudo chsh -s /usr/bin/zsh $USER

# remove garbago files
rm .bash* .motd_shown .profile .sudo_as_admin_successful .wget-hsts

echo -e "\n\nclose this tab\nopen neovim\ngh auth login\n\n"
