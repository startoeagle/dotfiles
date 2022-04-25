#!/bin/bash
cp tmux.conf $HOME/.tmux.conf

printf "Installing plugin manager for tmux\n"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
