# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export DEFAULT_USER="kforsthoevel"

DISABLE_CORRECTION="true"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(berkshelf bundler docker docker-compose git golang history rbenv kitchen knife osx ruby terraform thor tmux vagrant zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

export EDITOR=vim
export AWS_SSH_KEY='kforsthoevel'
export AWS_SSH_KEY_FILE=${HOME}/.ssh/${AWS_SSH_KEY}.pem
export AWS_ACCESS_KEY_ID=`awk -F "=" '/aws_access_key_id/ {print $2}' ${HOME}/.aws/credentials |head -1`
export AWS_SECRET_ACCESS_KEY=`awk -F "=" '/aws_secret_access_key/ {print $2}' ${HOME}/.aws/credentials |head -1`
export AWS_DEFAULT_REGION=`awk -F "=" '/region/ {print $2}' ${HOME}/.aws/credentials |head -1`
export KOPS_STATE_STORE="s3://kops-kubernetes-state"
export DISABLE_AUTO_TITLE=true
export GOPATH="$HOME/projects/golang"
export GPG_TTY=$(tty)

[[ -f ~/.zsh_colors.zsh ]] && source ~/.zsh_colors.zsh
[[ -f ~/.atlas ]] && source ~/.atlas && export ATLAS_TOKEN
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f /usr/local/share/zsh/site-functions/_aws ]] && source /usr/local/share/zsh/site-functions/_aws
[[ -f $HOME/projects/warp/warp ]] && source $HOME/projects/warp/warp

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh  ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi

source <(kubectl completion zsh)


ssh-add ~/.ssh/id_rsa &>/dev/null
ssh-add ~/.ssh/kforsthoevel.pem &>/dev/null
ssh-add ~/.ssh/devops.pem &>/dev/null
ssh-add ~/.ssh/devops-us.pem &>/dev/null

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="$GOPATH/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
