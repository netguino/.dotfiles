# Path to your oh-my-zsh installation.
export ZSH=/home/markitoxs/.oh-my-zsh
export PATH="$HOME/.rbenv/bin:$PATH"

ZSH_THEME='agnoster'
DEFAULT_USER="markitoxs"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
# Add wal and perl to path
export PATH="/home/markitoxs/src/wal:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

eval "$(rbenv init -)"

# Import colorscheme from 'wal'
(/home/markitoxs/src/wal/wal -r &)

# Load up extra files
source $ZSH/oh-my-zsh.sh
source ~/.zsh_aliases
source ~/.zshrc_secrets
