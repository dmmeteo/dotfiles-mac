#!/usr/bin/env zsh

# This sets the environment for interactive shells.
# https://apple.stackexchange.com/questions/388622/zsh-zprofile-zshrc-zlogin-what-goes-where
echo "Hello from .zshrc"

brew outdated

# ----- Set Variables -----
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export PATH="/opt/homebrew/bin:$PATH"

# Created by `pipx` on 2022-12-13 14:51:52
export PATH="$PATH:/Users/me/.local/bin"

if [ -f "/Users/me/.config/fabric/fabric-bootstrap.inc" ]; then . "/Users/me/.config/fabric/fabric-bootstrap.inc"; fi

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(zoxide init --cmd cd zsh)"

source <(fzf --zsh)

# ----- Change ZSH Options -----

# ----- Create Aliases -----
alias ls='eza -lah --git --icons'

# ----- Customize Prompt(s) -----
# https://medium.com/pareture/simplest-zsh-prompt-configs-for-git-branch-name-3d01602a6f33
# https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
# Enabling and setting git info var to be used in prompt config.
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats "%s:(%b)"
precmd() {vcs_info}
# Enable substitution in the prompt.
setopt prompt_subst
# Set the prompt.
PROMPT='
%~  ${vcs_info_msg_0_}
%n@%m %L %# '
RPROMPT='%*'

# ----- Add Locations to $PATH Variable -----

# ----- Write Handy Functions -----
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# ----- Use ZSH Plugins -----
