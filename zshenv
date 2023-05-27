#!/usr/bin/env zsh

# This is where you set environment variables(non-interactinve shell).
# https://apple.stackexchange.com/questions/388622/zsh-zprofile-zshrc-zlogin-what-goes-where
echo "Hello from .zshenv"

eval "$(/opt/homebrew/bin/brew shellenv)"