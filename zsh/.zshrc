echo "Running $ZDOTDIR/.zshrc ..."
######################
# add to PATH
######################

# for Homebrew
export PATH="/usr/local/sbin:$PATH"

# for anyenv
eval "$(anyenv init -)"
export PATH="$HOME/.anyenv/bin:$PATH"

######################
# Aliases
######################

##### Filesystem #####
## ls
alias la="ls -l -a -G"  # -G is a color option on only macOS
# alias la="ls -l -a --color=auto"  # a color option on Linux

## cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cdp="cd ~/Projects"
alias cda="cd ~/Projects/MyProjects/AtCoderStream"
alias cdd="cd ~/Projects/dotfiles"
alias cdt="cd ~/Projects/Intern/UNIPRO/tag_tool"

## grep
# alias gr="grep --color"
alias -g gr="| grep --color"  # add pipe option: ex) $ la gr "py"

## exec
alias restart="exec $SHELL -l"

## utility
# general
alias path="echo $PATH"

# for AtCoder
alias rmt="rm -rf test"
alias ojt="oj test -c"  # for OnlineJudgeTool

###### Docker #####
## common
alias docker_daemon='open --background -a Docker'
alias dcr="docker"

## pull
alias dp="docker pull"

## images
alias di="docker images"
alias dia="docker images --all"  # include intermediates

## inspect
alias dins="docker inspect"

## ps
alias dps="docker ps"  # output running container
alias dpa="docker ps --all"  # output all container whether running or not

## container
alias dcnt="docker container"
alias dcl="docker container ls"
alias dcla="docker container ls --all"
## container run
alias drunit="docker container run --rm -it"  # interactive and virtual terminal
alias drund="docker container run -d"  # detouch: execute as background process
alias dstr="docker container start"
alias dstp="docker container stop"
## enter running container
# dcin($1): docker container exec -it $1 /bin/bash
dcin () {
    # $1: [CONTAINER-ID] or [CONTAINER-NAME]
    docker container exec -it $1 /bin/bash
}

## remove
alias drm="docker container rm"  # rm container
alias drmi="docker image rm"  # rm image
# When new image use an exisisting tag, old image's tag become "<none>"
alias drminone="docker rmi $(docker images -f "dangling=true" -q)"

## helper
alias dcalias="cat $ZDOTDIR/.zshrc gr docker"  # use "gr"(grep with color)

###### Docker Compose #####
## common
alias dcm="docker-compose"

## up
alias dcup="docker-compose up"  # display log
alias dcupd="docker-compose up --detach"  # run container in the background(no display log)

## build
alias dcb="docker-compose build"
alias dcbn="docker-compose build --no-cache"

##### starship(for shell customize) #####
# https://starship.rs/ja-JP/
eval "$(starship init zsh)"

##### Python #####
## jupyter notebook
alias py='ipython'
alias jn='ipython notebook --ip=127.0.0.1'
