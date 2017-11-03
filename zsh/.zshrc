# Path to your oh-my-zsh installation.
export ZSH=/home/markitoxs/.oh-my-zsh

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


alias new-post="sh ~/Code/postwrapper/wrapper.sh "
<<<<<<< HEAD

export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"

source ~/.zshrc_secrets
source ~/.zsh_aliases

=======
alias chimp-minimoo="ln -fs ~/.rest_connection/rest_api_config.yaml.MINIMOO ~/.rest_connection/rest_api_config.yaml"
alias chimp-stage="ln -fs ~/.rest_connection/rest_api_config.yaml.STAGE ~/.rest_connection/rest_api_config.yaml"
alias chimp-prod="ln -fs ~/.rest_connection/rest_api_config.yaml.PRODUCTION ~/.rest_connection/rest_api_config.yaml"
alias chimp-cads="ln -fs ~/.rest_connection/rest_api_config.yaml.CADS ~/.rest_connection/rest_api_config.yaml"

alias stage_namespace='STAGE_NAMESPACE=`ruby ~/src/extact_namespace_staging.rb`; echo $STAGE_NAMESPACE'
alias dynamo_stage_namespace='DYNAMO_STAGE_NAMESPACE=`ruby ~/src/dynamo_staging_namespace.rb`; echo $DYNAMO_STAGE_NAMESPACE'

alias publish_templates='chimp-stage; cd ~/src/release_automation/; bundle exec rs_templates --template-set="config/all/template_sets/production.yml" --account-groups="config/all/account_groups/accounts.json" publish'
alias import_templates='cd ~/sr/crelease_automation/; bundle exec rs_templates --template-set="config/all/template_sets/production.yml" import'

hotfix(){
  stage_namespace
  service=$1
  cd ~/src/release_automation
  bundle exec ./tip.rb --no-launch-chimpd --namespace=$STAGE_NAMESPACE stage hotfix $1
}

dynamo_hotfix(){
  dynamo_stage_namespace
  service=$1
  cd ~/src/release_automation
  bundle exec ./tip.rb --no-launch-chimpd --namespace=$DYNAMO_STAGE_NAMESPACE stage hotfix $1
}

dry_hotfix(){
  stage_namespace
  service=$1
  cd ~/src/release_automation
  bundle exec ./tip.rb --dry-run --no-launch-chimpd --namespace=$STAGE_NAMESPACE stage hotfix $1
}

play_ace(){
  id=$(echo $1 | cut -f3 -d/)
  cvlc http://127.0.0.1:8000/pid/$id/stream.mp4
}
alias play='play_ace'

# Import colorscheme from 'wal'
(/home/markitoxs/src/wal/wal -r &)

# Load up extra files
source $ZSH/oh-my-zsh.sh
source ~/.zshrc_secrets
source ~/.zshenv
>>>>>>> 6f92bb554be6e294f6bb705541fd9316ff13def3
