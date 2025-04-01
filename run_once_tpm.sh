#!/bin/sh

# Install tmux plugin manager
if [ ! -f "${HOME}/.tmux/plugins/tpm/README.md" ]; then
  git clone git@github.com:tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
fi
