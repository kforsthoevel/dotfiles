# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

DISABLE_CORRECTION="true"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(berkshelf boot2docker bundler git history rbenv kitchen knife osx ruby terraform thor vagrant)

export EDITOR=vi
source $ZSH/oh-my-zsh.sh

export AWS_SSH_KEY='kforsthoevel'
export AWS_SSH_KEY_FILE=${HOME}/.ssh/${AWS_SSH_KEY}.pem
export AWS_ACCESS_KEY_ID=`awk -F "=" '/aws_access_key_id/ {print $2}' ${HOME}/.aws/credentials |head -1`
export AWS_SECRET_ACCESS_KEY=`awk -F "=" '/aws_secret_access_key/ {print $2}' ${HOME}/.aws/credentials |head -1`
export AWS_DEFAULT_REGION=`awk -F "=" '/region/ {print $2}' ${HOME}/.aws/credentials |head -1`

[[ -f ~/.zsh_colors.zsh ]] && source ~/.zsh_colors.zsh
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f /usr/local/share/zsh/site-functions/_aws ]] && source /usr/local/share/zsh/site-functions/_aws
[[ -f $HOME/projects/warp/warp ]] && source $HOME/projects/warp/warp

# Docker stuff
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/kforsthoevel/.boot2docker/certs/boot2docker-vm

cb() { cd ~/projects/injixo_infrastructure/cookbooks/${1} }
wo() { curl http://find/clients.txt 2>/dev/null | awk '{print $1, "\t" $3}' | grep -i "$@" | expand -t30}

# SSH Agent
ssh-add ~/.ssh/id_rsa &>/dev/null
ssh-add ~/.ssh/kforsthoevel.pem &>/dev/null

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

