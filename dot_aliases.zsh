alias .....="cd ../../../.."
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias ber="bundle exec rake"
alias buc="brew update && brew upgrade && brew cleanup"
alias cat="bat -pp"
alias dco="docker compose"
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gcb='git checkout -b'
alias gcm='git checkout $(git_main_branch)'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias glop="git log -30 --graph --pretty=format:'%h %ad %s (%an)' --date=short"
alias gm='git merge'
alias gp='git push'
alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease'
alias gst='git status'
alias h='history'
alias hsi='hs -i'
alias k="kubectl"
alias l='eza -l --time-style long-iso --git --icons'
alias la='ls -lAh'
alias less="bat"
alias ll='eza -la --time-style long-iso --git --icons'
alias localip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ls='eza --icons'
alias mux="tmuxinator"
alias path='echo $PATH | tr -s ":" "\n"'
alias pubip="/usr/bin/dig +short myip.opendns.com @resolver1.opendns.com"
alias tf="terraform"
alias vi="nvim"
alias week='date +%V'
alias yless="jless --yaml"


[[ -f ~/.aliases.local.zsh ]] && source ~/.aliases.local.zsh
