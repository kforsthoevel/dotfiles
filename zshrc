
# folder of all of your autocomplete functions
# fpath=($HOME/.zsh-completions $fpath)
# fpath=(/opt/homebrew/share/zsh/site-functions/_eza $fpath)

# enable autocomplete function
# Speed up completion init, see: https://gist.github.com/ctechols
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

setopt auto_cd

export EDITOR=nvim
export DISABLE_AUTO_TITLE=true
export GOPATH="$HOME/git/golang"
export GPG_TTY=$(tty)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=23"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export DFT_BACKGROUND=light

eval "$(/opt/homebrew/bin/sheldon source)"

[[ -f ~/.aliases.zsh ]] && source ~/.aliases.zsh
[[ -f /opt/homebrew/share/zsh/site-functions/_aws ]] && source /opt/homebrew/share/zsh/site-functions/_aws

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
if [ -e /opt/homebrew/opt/fzf/shell/completion.zsh  ]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# fzf + rg configuration
if _has fzf && _has rg; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --glob \!.git'
  # export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  # export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --border --preview 'bat --color "always" {}'"
fi

# Podman
# export DOCKER_HOST='unix:///tmp/podman.sock'

# Colima
export DOCKER_HOST="unix://$HOME/.colima/docker.sock"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Try out atuin
if type atuin &> /dev/null; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

export PATH=/Users/kai/.cargo/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="$GOPATH/bin:$PATH"

source /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH=$HOME/.bin:$PATH

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
