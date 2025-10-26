#!/usr/bin/env bash

# DEPENDENCIES

sudo apt update
sudo apt install -y software-properties-common ripgrep git make curl gcc

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME"/.fzf
"$HOME"/.fzf/install --all

# DEPENDENCIES

# Neovim
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim
