# functions
# currently my babun crashes I need to reinstall it
# but till that time I'm commenting this.
#cdls() { 
#  cd "$@" && ls;
#}

refresh() {
  source ~/.bashrc
  tmux source-file ~/.tmux.conf
}

# movement
#alias cd="cdls"
alias up="cd .."
alias down="cd -"

# config
alias refresh="refresh"

function git-folder {
	[ -d .git ] && git name-rev --name-only @
}

# terminal
PS1='\[\e[1;34;40m\]{ \[\e[1;34;40m\]\w \[\e[1;34;40m\]} \[\e[1;32m\]$(git-folder) \[\e[33;40m\] » ' 
