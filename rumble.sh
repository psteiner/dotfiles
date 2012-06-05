#!/bin/sh

BASE="$HOME/sites/sample_app"
cd $BASE

tmux start-server

# new-session creates first window named 'vim'
tmux new-session -d -s sampleapp -n vim

# split window 'h'orizontally (into two vertical panes)
# 'x' is cursor in active pane
# -------------
# |     |x    |
# |  0  |  1  |
# |     |     |
# -------------
tmux split-window -t sampleapp:vim -h

# split pane 1 'v'ertically (into two horizontal panes)
# 'x' is cursor in active pane
# -------------
# |     |  1  |
# |  0  |-----|
# |     |x 2  |
# -------------
tmux split-window -t sampleapp:vim -v

# widen the vim editor pane
tmux resize-pane -R -t sampleapp:vim.0 10

# start a vim editor in pane 0 of window 1
# -------------
# |vim  |  1  | <- Guard
# |  0  |-----|
# |     |x 2  | <- Terminal
# -------------
tmux send-keys -t sampleapp:vim.0 "cd $BASE; vim" C-m

# run guard in pane 1 -c clears shell after each change
tmux send-keys -t sampleapp:vim.1 "cd $BASE; guard -c" C-m

# create a second window for rails server
tmux new-window -t sampleapp:2 -n rails

# split rails server window for logging
tmux split-window -t sampleapp:rails -v

# start rails server in pane 2
tmux send-keys -t sampleapp:rails.0 "cd $BASE; rails s" C-m

# start logging in the 'logs' window
tmux send-keys -t sampleapp:rails.1 "cd $BASE; tail -f log/*.log" C-m

# select the vim pane in the rails window
tmux select-window -t sampleapp:vim
tmux select-pane -t sampleapp:vim.0

# make the tmux session active
tmux attach-session -d -t sampleapp
