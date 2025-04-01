if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting

    source ~/.config/fish/aliases
    if test -r ~/.config/fish/aliases.local
        source ~/.config/fish/aliases.local
    end

    atuin init fish --disable-up-arrow | source

end

starship init fish | source
mise activate fish | source
zoxide init fish | source
