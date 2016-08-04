#!/bin/bash

# Starts SSH with TMUX.
# To finish a session: ^A^A^D
# To detach: ^A^A D
# List sessions: ^A^A S

addr=$(echo "$1" | tr "@" " ")
user=$(echo "$addr" | cut -d " " -f 1)
host=$(echo "$addr" | cut -d " " -f 2)

ssh $user@$host -t "tmux new-session -s $user || tmux attach-session -t $user"
