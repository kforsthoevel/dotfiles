# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

DISABLE_CORRECTION="true"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(berkshelf bundler capistrano git history rbenv knife knife_ssh osx ruby thor vagrant)

export EDITOR=vi
source $ZSH/oh-my-zsh.sh

[[ -f ~/.zsh_colors.zsh ]] && source ~/.zsh_colors.zsh
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f /usr/local/share/zsh/site-functions/_aws ]] && source /usr/local/share/zsh/site-functions/_aws

export AWS_ACCESS_KEY_ID=`ruby -rinifile -e "puts IniFile.load(File.join(File.expand_path('~'), '.aws', 'config'))['default']['aws_access_key_id']"`
export AWS_SECRET_ACCESS_KEY=`ruby -rinifile -e "puts IniFile.load(File.join(File.expand_path('~'), '.aws', 'config'))['default']['aws_secret_access_key']"`
export AWS_SSH_KEY='kforsthoevel'
export AWS_SSH_KEY_FILE=${HOME}/.ssh/${AWS_SSH_KEY}.pem
export AWS_DEFAULT_REGION="`ruby -rinifile -e "puts IniFile.load(File.join(File.expand_path('~'), '.aws', 'config'))['default']['region']"`"

cb() { cd ~/projects/injixo_infrastructure/cookbooks/${1} }

# SSH Agent
ssh-add ~/.ssh/id_rsa &>/dev/null
ssh-add ~/.ssh/kforsthoevel.pem &>/dev/null

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin/packer
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

