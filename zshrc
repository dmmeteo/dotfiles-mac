#!/usr/bin/env zsh

# This sets the environment for interactive shells.
# https://apple.stackexchange.com/questions/388622/zsh-zprofile-zshrc-zlogin-what-goes-where
echo "Hello from .zshrc"

brew outdated

# ----- Set Variables -----
eval "$(/opt/homebrew/bin/brew shellenv)"

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# ----- Change ZSH Options -----

# ----- Create Aliases -----
alias ls='ls -lAFh'

# ----- Customize Prompt(s) -----
PROMPT='
%~
%n@%m %L %# '
RPROMPT='%*'

# ----- Add Locations to $PATH Variable -----

# ----- Write Handy Functions -----
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# ----- Use ZSH Plugins -----