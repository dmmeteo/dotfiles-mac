# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
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

eval "$(starship init zsh)"

# ----- Change ZSH Options -----

# ----- Create Aliases -----
alias ls='eza -lah --git --icons'

# ----- Add Locations to $PATH Variable -----

# ----- Write Handy Functions -----
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# ----- Use ZSH Plugins -----

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
