autoload -Uz compinit
compinit

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export GPG_TTY=$(tty)

ZSH_THEME="sunaku"
ZSH_THEME="bira"
export DEFAULT_USER=marc.goujon
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
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

source $ZSH/oh-my-zsh.sh
source ~/.zsh_secrets
source ~/.zsh_aliases

# Created by `pipx` on 2024-03-28 20:00:03
export PATH="/home/netguino/.local/bin:$PATH"

source <(kubectl completion zsh)

PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

export AWS_PAGER=""
export AWS_REGION="us-west-2"

# Created by `pipx` on 2025-08-05 21:07:18
export PATH="$PATH:/Users/marc.goujon/.local/bin"

tf_override() {
  # I know, I know, this is very... weird. But it does work for now..
  # TODO: Make single loop, and support any file name.
  for file in ./provider.tf; do
    if [[ -f "$file" ]]; then
      override_file="${file%.tf}_override.tf"
      echo "Creating override for $file at $override_file"

      awk '
      {
        if ($0 ~ /role_arn/) {
          $0="    role_arn = \"\""
        }

        print
      }
      ' "$file" > "$override_file"

      echo "Override created: $override_file"
    fi
  done
  for file in ./terraform.tf; do
    if [[ -f "$file" ]]; then
      override_file="${file%.tf}_override.tf"
      echo "Creating override for $file at $override_file"
      awk '
      {
        if (in_assume_role_block) {
          # Skip lines until closing brace found
          if ($0 ~ /}/) {
            in_assume_role_block = 0
          }
          next
        }

        if ($0 ~ /assume_role/) {
          in_assume_role_block = 1
          skip_next_line = 1
          next
        }

        if (skip_next_line) {
          skip_next_line = 0
          # Skip next line if it contains role_arn
          if ($0 ~ /role_arn/) next
        }

        print
      }
      ' "$file" > "$override_file"

      echo "Override created: $override_file"
    fi
  done
}

export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


setopt HIST_IGNORE_SPACE
