#!/usr/bin/env bash

# Neovim
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim

# Dependencies
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo apt-get install -y ripgrep