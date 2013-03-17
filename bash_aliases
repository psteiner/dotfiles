# vim: set filetype=sh : 

# bash 
alias ..='cd ..'
alias cls='clear'
alias lat="ls -lat"

# vim
alias lvim="vim -c \"normal '0\""

# http://www.catonmat.net/blog/bash-vi-editing-mode-cheat-sheet/
# echos reminder of how to add a new alias from the command line
alias ald="echo \"echo 'alias name=\\\"command\\\"' >> ~/.bash_aliases && . ~/.bash_aliases\""

alias myprocs="ps -ef | grep $USERNAME"

# git 
alias gitb='git branch'
alias gitc="git config -l"
# $@ contains all command line params, $1 .. $9
alias gitd="git diff $@"
alias gitl='git log --oneline --graph'
alias gits='git status'
