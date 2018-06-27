ZSH=$HOME/.oh-my-zsh
DISABLE_CORRECTION="true"
ZSH_THEME="agnoster"
CASE_SENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler docker docker-compose git golang history rbenv osx ruby terraform thor tmux vagrant zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

export DEFAULT_USER="kforsthoevel"
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
export SAVEHIST=$HISTSIZE

[[ -f ~/.zsh_colors.zsh ]] && source ~/.zsh_colors.zsh
[[ -f ~/.atlas ]] && source ~/.atlas && export ATLAS_TOKEN
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f /usr/local/share/zsh/site-functions/_aws ]] && source /usr/local/share/zsh/site-functions/_aws
[[ -f $HOME/projects/warp/warp ]] && source $HOME/projects/warp/warp
[[ -f /usr/local/etc/profile.d/autojump.sh  ]] && . /usr/local/etc/profile.d/autojump.sh
[[ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ]] && . /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
[[ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ]] && . /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh  ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# fzf + rg configuration
if _has fzf && _has rg; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --glob \!.git'
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
export PATH="$HOME/Library/Python/3.6/bin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="$GOPATH/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
