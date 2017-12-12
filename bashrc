# functions
cdls() { 
  cd "$@" && ls;
}

refresh() {
  source ~/.bashrc
  tmux source-file ~/.tmux.conf
}

# movement
alias cd="cdls"
alias up="cd .."
alias down="cd -"

# config
alias refresh="refresh"
