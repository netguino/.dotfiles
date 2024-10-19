autoload -Uz compinit
compinit

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export GPG_TTY=$(tty)

ZSH_THEME="sunaku"
ZSH_THEME="bira"
export DEFAULT_USER=netguino
precmd() {
  precmd() {
    echo ""
    echo ""
  }
}

plugins=(git zsh-autosuggestions)

# Load up asdf
. "$HOME/.asdf/asdf.sh"

# Add tfenv to path
export PATH="$HOME/src/tfenv/bin:$PATH"

source $ZSH/oh-my-zsh.sh
source ~/.zsh_secrets
source ~/.zsh_aliases

# Created by `pipx` on 2024-03-28 20:00:03
export PATH="/home/netguino/.local/bin:$PATH"

source <(kubectl completion zsh)
