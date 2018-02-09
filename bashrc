# functions
function git-folder {
	[ -d .git ] && git name-rev --name-only @
}

cdls() { 
  cd "$@" && ls;
}

bitbucket() {
    https://bitbucket.org/hafah/$1
}

github() {
    https://github.com/hafah/$1
}

refresh() {
  source ~/.bashrc
  tmux source-file ~/.tmux.conf
}

# movement
alias up="cd .."
alias down="cd -"
alias hafah="cd ~/repos/hafah/ && cd"

# config
alias refresh="refresh"
alias dockerup="docker-compose -f docker-compose-dev.yml -f docker-compose.yml up"

#tmuxodoro
killall tmuxodoro >/dev/null 2>&1
env TOMATOES=2 TOMATO_TIME=35 REST_TIME=8 nohup tmuxodoro >/dev/null 2>&1 & 

#vagrant
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"

# docker
export DOCKER_HOST=tcp://0.0.0.0:2375
PATH="$HOME/bin:$HOME/.local/bin:$HOME/.composer/vendor/bin:$PATH"
PATH="$PATH:/mnt/c/Program\ Files/Docker/Docker/resources/bin"

# terminal
PS1='\[\e[1;37m\]{ \[\e[1;37m\]\w \[\e[1;37m\]} \[\e[1;32m\]$(git-folder) \[\e[1;33m\]» '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
