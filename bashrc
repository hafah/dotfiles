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

#chrome in wsl
alias chrome="/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe"

#git
alias commit="git add -A; git commit -v && git push"

# movement
alias up="cd .."
alias down="cd -"
alias hafah="cd ~/repos/hafah/ && cd"

# config
alias refresh="refresh"
alias dockerup="docker-compose -f docker-compose-dev.yml -f docker-compose.yml up"

#copy_paste
export DISPLAY=localhost:0.0

#tmuxodoro
killall tmuxodoro >/dev/null 2>&1
env TOMATOES=3 TOMATO_TIME=4 REST_TIME=11 nohup tmuxodoro >/dev/null 2>&1 & 

#tmuxinator
export EDITOR="vim"
alias mux="tmuxinator"

#vagrant
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export VAGRANT_PREFER_SYSTEM_BIN=1 vagrant ssh
# docker
export DOCKER_HOST=tcp://0.0.0.0:2375
PATH="$HOME/bin:$HOME/.local/bin:$HOME/.composer/vendor/bin:$PATH"
PATH="$PATH:/mnt/c/Program\ Files/Docker/Docker/resources/bin"

# terminal
PS1='\[\e[1;37m\]{ \[\e[1;37m\]\w \[\e[1;37m\]} \[\e[1;32m\]$(git-folder) \[\e[1;33m\]» '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
