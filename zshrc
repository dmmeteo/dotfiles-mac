# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
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

# ----- Change ZSH Options -----

# ----- Create Aliases -----
alias ls='ls -lAFh'

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


# ----- Work(should be moved) -----
export LDFLAGS="-I/opt/homebrew/opt/openssl@1.1/include $LDFLAGS"
export LDFLAGS="-I/opt/homebrew/opt/openssl@1.1/lib $LDFLAGS"
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"


# Created by `pipx` on 2022-12-13 14:51:52
export PATH="$PATH:/Users/me/.local/bin"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
