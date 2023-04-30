#!/usr/bin/env bash

echo -e "removing vim...\n"
sudo apt autoremove --purge vim -y

echo -e "updating system...\n"
sudo apt update && sudo apt upgrade -y

echo -e "installing dependencies...\n"
sudo apt install fzf exa zsh build-essential gh ripgrep libfuse2 --no-install-suggests --no-install-recommends -y

echo -e "making directories...\n"
mkdir -p ./{.local/{share,state},.cache/{zsh},.config,dev}

echo -e "cloning dotfiles...\n"
cd dev
git clone https://github.com/Arish-Shah/dotfiles --depth=1
cd

echo -e "installing oh-my-zsh...\n"
export ZSH="$HOME/.local/share/oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "copying dotfiles...\n"
cp ~/dev/dotfiles/.zsh* ~
cp ~/dev/dotfiles/.tmux.conf ~
cp ~/dev/dotfiles/.config/npm ~/.config -r
cp ~/dev/dotfiles/.config/nvim ~/.config -r
cp ~/dev/dotfiles/.local/bin ~/.local -r

echo -e "configuring git...\n"
git config --global init.defaultBranch main
git config --global user.name "Arish-Shah"
git config --global user.email "arish.r.shah@gmail.com"

echo -e "installing node version manager...\n"
export NVM_DIR="$HOME/.local/share/nvm"
mkdir $NVM_DIR
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

echo -e "downloading neovim...\n"
wget -P ~/.local/bin/ https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod +x ~/.local/bin/nvim.appimage

echo -e "starting zsh and installing nvm...\n"
source ~/.bashrc
nvm install --lts

echo -e "changing user shell to zsh...\n"
sudo chsh -s /usr/bin/zsh $USER

echo -e "removing files...\n"
rm .bash* .motd_shown .profile .sudo_as_admin_successful .wget-hsts

# login to gh
# open vim once
