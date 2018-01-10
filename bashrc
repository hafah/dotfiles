# functions
function git-folder {
	[ -d .git ] && git name-rev --name-only @
}

cdls() { 
  cd "$@" && ls;
}

bitbucket() {
    git clone https://bitbucket.org/hafah/$1
}

github() {
    git clone https://github.com/hafah/$1
}

refresh() {
  source ~/.bashrc
  tmux source-file ~/.tmux.conf
}

# movement
alias up="cd .."
alias down="cd -"

alias hafah="cd ~/repos/hafah/ && cd"
# how to use the hafah alias
# $ { ~ } hafah
# $ { ~/repos/hafah } hafah .
# $ { ~/repos/hafah/dotfiles } hafah dotfiles

# config
alias refresh="refresh"

function git-folder {
	[ -d .git ] && git name-rev --name-only @
}


# docker
export DOCKER_HOST=tcp://0.0.0.0:2375
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
PATH="$PATH:/mnt/c/Program\ Files/Docker/Docker/resources/bin"

# terminal
PS1='\[\e[1;37;40m\]{ \[\e[1;37;40m\]\w \[\e[1;37;40m\]} \[\e[1;32m\]$(git-folder) \[\e[33;40m\] » ' 
