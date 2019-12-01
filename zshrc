ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=23"

# folder of all of your autocomplete functions
fpath=($HOME/.zsh-completions $fpath)

# enable autocomplete function
autoload -U compinit
compinit

#
# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

setopt auto_cd

export DEFAULT_USER="kforsthoevel"
export EDITOR=emacs
export KOPS_STATE_STORE="s3://kops-kubernetes-state"
export DISABLE_AUTO_TITLE=true
export GOPATH="$HOME/git/golang"
export GPG_TTY=$(tty)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Source plugins for antibody
[[ -f $HOME/.zsh_plugins.sh ]] && source $HOME/.zsh_plugins.sh

[[ -f ~/.aliases.zsh ]] && source ~/.aliases.zsh
[[ -f /usr/local/share/zsh/site-functions/_aws ]] && source /usr/local/share/zsh/site-functions/_aws
[[ -f /usr/local/etc/profile.d/autojump.sh  ]] && . /usr/local/etc/profile.d/autojump.sh
[[ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ]] && . /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
[[ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ]] && . /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
[[ -f /usr/local/share/zsh/site-functions/_awless ]] && source /usr/local/share/zsh/site-functions/_awless
[[ -f /usr/local/etc/profile.d/z.sh ]] && . /usr/local/etc/profile.d/z.sh

# Bind terminal-specific up and down keys
# Bind in both emacs and vi modes so it works in both, and is not
# sensitive to whether this is loaded before or after the vi-mode plugin
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
if [[ -n "$terminfo[kcuu1]" ]]; then
  bindkey -M emacs "$terminfo[kcuu1]" history-substring-search-up
  bindkey -M viins "$terminfo[kcuu1]" history-substring-search-up
fi
if [[ -n "$terminfo[kcud1]" ]]; then
  bindkey -M emacs "$terminfo[kcud1]" history-substring-search-down
  bindkey -M viins "$terminfo[kcud1]" history-substring-search-down
fi

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

ssh-add ~/.ssh/id_rsa &>/dev/null
ssh-add ~/.ssh/kforsthoevel.pem &>/dev/null
ssh-add ~/.ssh/devops.pem &>/dev/null
ssh-add ~/.ssh/devops-us.pem &>/dev/null
ssh-add ~/.ssh/cloud-ops-eu-12-08-2019.pem &>/dev/null

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH=$PATH:$HOME/.linkerd2/bin

source /usr/local/opt/asdf/asdf.sh
