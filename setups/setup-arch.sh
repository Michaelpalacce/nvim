#!/usr/bin/env bash

sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm base-devel git curl make gcc ripgrep fd neovim fzf