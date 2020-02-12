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
alias cdd="cd ~/Projects/dotfiles"
alias cdt="cd ~/Projects/Intern/UNIPRO/tag_tool"
alias cda="cd ~/Projects/MyProjects/AtCoderStream"
alias cdab="cd ~/Projects/MyProjects/AtCoderStream/atcoder-stream-backend && pipenv shell"
alias cdablib="cd ~/Projects/MyProjects/AtCoderStream/atcoder-stream-backend/libraries/lib/lib"
alias cdaf="cd ~/Projects/MyProjects/AtCoderStream/atcoder-stream-frontedn"

## grep
# alias gr="grep --color"
alias -g gr="| grep --color"  # add pipe option: ex) $ la gr "py"

## exec
alias rst="exec $SHELL -l"

## utility
### general
alias path="echo $PATH"

### for applications
alias cal="open /Users/pyteyon/Applications/Chrome\\ Apps.localized/Google\\ Calendar.app"
alias st="open '/Applications/Sourcetree.app'"

### for AtCoder
alias rmt="rm -rf test"
alias ojt="oj test -c"  # for OnlineJudgeTool

### for MeCab
alias mecab-neologd="mecab -d /usr/local/lib/mecab/dic/mecab-ipadic-neologd"

###### Git Command #####
alias gpom="git push origin master"
alias gst="git status"

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
dcin () {
    # $1: [CONTAINER-ID] or [CONTAINER-NAME]
    docker container exec -it $1 /bin/bash
}

## remove
alias drm="docker container rm"  # rm container
alias drmi="docker image rm"  # rm image
# When new image use an exisisting tag, old image's tag become "<none>"
alias drmia="docker system prune"  # clean <none>:<none>

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

## pipenv
alias penvreq='pipenv lock -r > requirements.txt'

##### AtCoder #####
alias rmt='rm -rf test'

##### Others #####

## for xmas
alias xmas-dcr="docker run -it --rm lukaszlach/merry-christmas"
xmas() {
    echo "                    ____________________________________"
    echo "               I___|___|___|___|___|__|____|___|__|_I"
    echo "               I_|___|___|               |___|___|__I"
    echo "         )\    I___|__ | ..,a@@@a,a@@@a,.. |___|____I      /("
    echo "        ( ))   I_|__  .,;*;;@@@@@a@@@@@;;;;,. ___|__I     (( )"
    echo "         :     I__|  ;;;;;;;;;a@@^@@a;;;*;;;;;  __|_I       :"
    echo "        ,uU    I_|  ;;;;*;;;a@@@   @@@a;;;;*;;;  |__I      Uu."
    echo "        :Uu    I__|;;;;;;;a@@@@   .@@@@@;;;;;;;; __|I      uU:"
    echo "        | |    I_| ;;*;;;a@@@@@   @@\'\`@@@;;;;;*; _|_I      | |"
    echo "        |_|    I__ ;;;;;;@@;;@@   \`@  \`@;;;*;;;; ___I      |_|"
    echo "     _ (___) _ I_|_ ;;;*;;@;;;;@;;;;;*;;;;;;;;; _|__I___  (___)"
    echo "   ,-\' )   (   ~~~~~ \`;;;;;;*;;;;;;;;;;;*;;;;\'  ~~~~~     )   (\`-."
    echo " ,-____=====_____________\`;;;;;;;;*;;;;;;;\'_______________=====___\`."
    echo " |~~|  _________________________________________________/o\___   |~~|"
    echo " |_||  ||____|____|____|____|____|____|____|____|____|_/ /,\__|  ||_|"
    echo " |__|  |___|____|____|____|____|____|____|____|____|__/ /,,,\||  ||_|"
    echo " |_||__||____|____|____|____|____|____|____|____|____|\/,,,,,\|__|__|"
    echo " |____|____|____|____|____|____|____|____|____|____|___\,,,,,,\___|_|"
    echo " |_|____|__I####I..........  /%%%%%%%%%%%\ ..........I##\,,,,( )|___|"
    echo " |____|____I####I.......... .%%%%%( )%%%%%. .........I###\,,,,\/__|_|"
    echo " |_|____|__I####I.......... @@%%%%0%0%%%%@@  ........I## /,,,,/_|___|"
    echo " |____|____I####I.......... \`@@@@@@@@@@@@@@\' ........I# /,,,,/____|_|"
    echo " |_|____|__I####I............ \\\\\\\\\\\\\) ........I ( \,,/___|___|"
    echo " |____|____I####I.............  \`\\\\\\\\\\) ........I  \_)/_|____|_|"
    echo " |_|____|__I####I............  A   \`\\\\\\\\' ..   .. I#  :_|____|___|"
    echo " |____|____I####I.........    AAA  .. \`\\\\' ..  A.  .I###I___|____|_|"
    echo " |_|____|__I####I......   .A  \`AAA ....  *  ..  AAA. I ##I_|____|___|"
    echo " |____|____I####I....    AAA  AA;AA  ...   ...  \`AAA.I ##I___|____|_|"
    echo " |_|____|__I####/~~~,-.A;;A\'-A;;;;;A-----A-----,A;;;A  ##I_|____|___|"
    echo " |____|____I###/    I.;;;;;  ;;;;;;;   AAA     I;;;A\'\###I___|____|_|"
    echo " |_|____|__I##/     I;;;;;; ;;;;;;;   A;;;A    I;;;;  \##I_|____|___|"
    echo " |____|____I#/     !~;;;;;;~~~~~~~~~~~;;;;;;~~~~~!;\'   \#I___|____|_|"
    echo " |_|____|__I/______!  ::::;;           ;;;;;;    !______\I_|____|___|"
    echo " ~~~~~~~~~/       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~       \~~~~~~~~~~"
    echo "         /_______________________________________________\""
    echo "                        /\____/\    __"
    echo "                      .\'  \"\"\"\"  \`,-\'  \`--.__"
    echo "                 __,- :   -  -  ;  \" ::     \`-. -.__"
    echo "              ,-sssss \`._  \`\' _,\'\"     ,\'~~~::\`.sssss-."
    echo "             |ssssss ,\' ,_\`--\'_    __,\' ::  \`  \`.ssssss|"
    echo "            |sssssss \`-._____~ \`,,\'_______,---_;; ssssss|"
    echo "             |ssssssssss     \`--\'~{__   ____   ,\'ssssss|"
    echo "              \`-ssssssssssssssssss ~~~~~~~~~~~~ ssss.-\'"
    echo "                   \`---.sssssssssssssssssssss.---\'"
    echo ""
    echo "------------------------------------------------"
}
