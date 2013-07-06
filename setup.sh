#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core tmux
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# git pull and install dotfiles as well
cd
command rm -rf .dotfiles
command rm -rf .emacs.d
git clone git@github.com:xircst2/dotfiles.git
ln -snf dotfiles/.vimrc .
ln -snf dotfiles/.bash_profile .
ln -snf dotfiles/.bashrc .
ln -snf dotfiles/.emacs.d .
ln -snf dotfiles/.vim
ln -snf dotfiles/.tmux.conf
ln -snf dotfiles/.gitconfig
ln -snf dotfiles/.inputrc
ln -snf dotfiles/.dir_colors
