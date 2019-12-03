######################
# add to PATH
######################
# Homebrew
export PATH="/usr/local/sbin:$PATH"

# anyenv
eval "$(anyenv init -)"
export PATH="$HOME/.anyenv/bin:$PATH"

######################
# Aliases
######################

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Docker aliases
## common
alias docker_daemon='open --background -a Docker'
alias dc="docker"
alias dcm="docker-compose"

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

## remove
alias drm="docker container rm"  # rm container
alias drmi="docker image rm"  # rm image

## helper
alias dcalias="cat ~/.bashrc | grep docker"

# for AtCoder's OnlineJudgeTool
alias rmt="rm -rf test"
alias ojt="oj test -c"