alias .....="cd ../../../.."
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias ber="bundle exec rake"
alias buc="brew update && brew upgrade && brew cleanup"
alias dco="docker-compose"
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gcb='git checkout -b'
alias gcm='git checkout master'
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
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias localip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ls='ls -G'
alias path='echo $PATH | tr -s ":" "\n"'
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias tf="terraform"
alias vi="vim"
alias week='date +%V'

[[ -f ~/.aliases.local.zsh ]] && source ~/.aliases.local.zsh
