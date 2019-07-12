#!/bin/bash

tmux new-session -d 'mpsyt'
tmux new-window "mutt"
tmux attach-session -d
