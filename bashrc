text_ok="[ DONE ]"
text_fail="[ FAIL ]"
text_skip="[ SKIP ]"

bitbucket_repos=( chess notes )
github_repos=( windows10 dotfiles)

bind_mnt() {
    echo -ne "Setting up bind /mnt to /c: \t\t\t"
    echo -e $text_ok
    mkdir -p /c
    sudo mount --bind /mnt/c /c
}

check_repositories() {
    #bitbucket
    cd ~/repos/hafah
    for repo in "${bitbucket_repos[@]}"
    do
        if ! [ -d ~/repos/hafah/$repo ]; then
            git clone git@bitbucket.org:hafah/$repo.git
        fi
    done
    for repo in "${github_repos[@]}"
    do
        if ! [ -d ~/repos/hafah/$repo ]; then
            git clone git@github.com:hafah/$repo.git
        fi
    done
    echo -ne "Setting up repositories: \t\t\t"
    echo -e $text_ok
    sudo mount --bind /mnt/c /c
}

link_folder() {
    repos_folder="~/repos"
    windows_folder="/mnt/c/Users/Carbon/repos"
    echo -ne "Setting up symlink to WINDOWS:\t\t\t"

    if [ -d $repos_folder ]; then
        echo "You have a file or folder that isn't a symlink so delete ~/repos in Ubuntu"
        echo -e $text_fail
    else
        echo -e $text_ok
        if ! [ -d "/mnt/c/Users/Carbon/repos" ]; then
            mkdir /mnt/c/Users/Carbon/repos 
        fi
        ln -s /mnt/c/Users/Carbon/repos /home/hafah > /dev/null 2>&1
        cd /home/hafah
    fi
}

git_ssh() {
    echo -ne "Setting up ssh keys: \t\t\t\t"
    if [ -d ~/.ssh ] || [ -d /root/.ssh ]; then
        echo -e $text_ok
    else
        echo -en $text_fail
        echo "You have never created public ssh keys. We'll help you!"
        ssh-keygen -t rsa
    fi
}

tmux_session() {
    echo -ne "Setting up tmux enviroment:\t\t\t"
    if [ "$TERM" = "screen-256color" ] && [ -n "$TMUX" ]; then
        echo -e $text_ok
    else
        echo -e $text_fail
        echo "We really dislike for you to work without being in a tmux session"
        echo "please, run the command: sudo tmux" 
    fi
}

root_permission() {
    echo -ne "Collecting if there is permission for root:\t"
    if [[ "$EUID" = 0 ]]; then
        echo -e $text_ok
    else
        echo -e $text_fail
        echo "We can't do much without having sudo permission"
        echo "please, run the command: sudo bash (or even better detach from tmux and run: sudo tmux)" 
    fi
}


# functions
git-folder() {
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
alias cl="clear"
alias up="cd .."
alias down="cd -"
alias hafah="cd /c/Users/Carbon/repos/hafah/ && cd"

# config
alias refresh="refresh"

#tmuxodoro
killall tmuxodoro >/dev/null 2>&1
env TOMATOES=4 TOMATO_TIME=10 REST_TIME=9 nohup tmuxodoro >/dev/null 2>&1 & 

#tmuxinator
export EDITOR="vim"
alias mux="tmuxinator"

#copy paste
PATH="/c/Windows/system32:$PATH"

#vagrant
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export VAGRANT_PREFER_SYSTEM_BIN=1 vagrant ssh

# docker
export DOCKER_HOST=tcp://0.0.0.0:2375
PATH="$HOME/bin:$HOME/.local/bin:$HOME/.composer/vendor/bin:$PATH"
PATH="$PATH:/mnt/c/Program\ Files/Docker/Docker/resources/bin"

# terminal
PS1='\[\e[1;37m\]{ \[\e[1;37m\]\w \[\e[1;37m\]} \[\e[1;32m\]$(git-folder) \[\e[1;33m\]» '

# fzf
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# go
export GOPATH=$HOME/go

# ll
alias ll="ls -l"
alias tmux="sudo tmux"

run() {
    tmux_session
    root_permission
    git_ssh
    link_folder
    bind_mnt
    check_repositories
}

run
