############################################
# init
############################################

##### starship(for shell customize) #####
# https://starship.rs/ja-JP/
eval "$(starship init zsh)"

############################################
# add to PATH
############################################

# for Homebrew
export PATH="/usr/local/sbin:$PATH"

# for Git
# 元の git は /usr/bin/git にあるから，それより早く検索されるようにする
export PATH="/usr/local/bin:$PATH"

# for anyenv
eval "$(anyenv init -)"
export PATH="$HOME/.anyenv/bin:$PATH"

# for pyenv
eval "$(pyenv init -)"
export PYENV_VERSION="3.9.5"

# for poetry
export PATH="$HOME/.poetry/bin:$PATH"

# for Java
# XX にバージョン番号を入れる
# export JAVA_HOME=`usr/libexec/java_home -v XX`

# for the Dart/Flutter SDK
export PATH="$PATH:$HOME/SDKs/flutter/bin"

# for GCP
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

############################################
# Aliases
############################################

################################
# aliases for system command
################################

# ls
alias la="ls -l -a -G"  # -G is a color option on only macOS
# alias la="ls -l -a --color=auto"  # a color option on Linux

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cdp="cd ~/Projects"
alias cdd="cd ~/Projects/dotfiles"
alias cdo="cd ~/Projects/OSS"
alias cdm="cd ~/Projects/MyProjects"
alias cda="cd ~/Projects/MyProjects/AtCoderStream"
alias cdab="cd ~/Projects/MyProjects/AtCoderStream/atcoder-stream-backend"
alias cdaf="cd ~/Projects/MyProjects/AtCoderStream/atcoder-stream-fronted"
alias cdlex="cd ~/Projects/InternProjects/JXPressCorp/task/task03_tvasahi_2020_0507_to_xxxx/tvasahi-lex"
alias cdjx="cd ~/Projects/InternProjects/JXPressCorp/"
alias cdkr="cd ~/Projects/research/Kurodalab/"
alias bk="cd ${OLDPWD}"

# grep
# alias gr="grep --color"
alias -g gr="| grep --color"  # add pipe option: ex) $ la gr "py"

# exec
# restart shell
alias rst="echo 'restart shell...'; exec $SHELL -l;"

# tar
# - unpack tar.gz
# tar zxvf [TARGET].tar.gz
# tar zxvf test.tar.gz
alias targz="tar zxvf"

# - pack files to tar.gz
# tar zcvf [OUTPUT].tar.gz [TARGET]
# tar zcvf test.tar.gz test.txt
alias targz-p="tar zcvf"

################################
# aliases for Homebrew
################################

brew-install () {
  brew install $1
  brew bundle dump --force --describe --file=$HOMEBREW_BREWFILE
  cd $DOTDIR
  git add .
  git commit -m "update: add $1 and update Brewfile"
  git push origin master
}

brew-uninstall () {
  brew uninstall $1
  brew bundle dump --force --describe --file=$HOMEBREW_BREWFILE
  cd $DOTDIR
  git add .
  git commit -m "update: remove $1 and update Brewfile"
  git push origin master
}

################################
# aliases for Git
################################

alias gb="git branch"
alias gc="git clone"
alias gcm="git commit -m"
alias gl="git log --all --decorate --graph --oneline"
alias gpo="git push origin"
alias gpom="git push origin master"
alias gpod="git push origin develop"
alias gfmms="git fetch && git merge origin/master"
alias gfmmn="git fetch && git merge origin/main"
alias gfmd="git fetch && git merge origin/develop"
alias grs="git reset --soft @^"
alias gs="git status"
alias gst="git stash"
gstpop () {
    # $1: index of an element in stack
    # "gstpop 1" = "git stash pop stash@{1}"
    git stash pop stash@{$1}
}
alias gsw="git switch"
alias gitalias="cat $ZDOTDIR/.zshrc gr git"

################################
# aliases for Docker
################################

# common
alias opendc='open --background -a Docker'
alias dcr="docker"

# pull
alias dp="docker pull"

# images
alias di="docker images"
alias dia="docker images --all"  # include intermediates

# inspect
alias dins="docker inspect"

# ps
alias dps="docker ps"  # output running container
alias dpa="docker ps --all"  # output all container whether running or not

# container
alias dcnt="docker container"
alias dcl="docker container ls"
alias dcla="docker container ls --all"
# container run
alias drunit="docker container run --rm -it"  # interactive and virtual terminal
alias drund="docker container run -d"  # detouch: execute as background process
alias dstr="docker container start"
alias dstp="docker container stop"
alias drstr="docker container restart"
# enter running container
dcin () {
    # $1: [CONTAINER-ID] or [CONTAINER-NAME]
    docker container exec -it $1 /bin/bash
}

# remove
alias drm="docker container rm"  # rm container
alias drmi="docker rmi"  # rm image
alias drminone="docker rmi $(docker images -f 'dangling=true' -q)"  # cf: https://shinkufencer.hateblo.jp/entry/2019/07/23/000000
# When new image use an exisisting tag, old image's tag become "<none>"

# helper
alias dcalias="cat $ZDOTDIR/.zshrc gr docker"  # use "gr"(grep with color)

################################
# aliases for Docker Compose
################################

# common
alias dcm="docker-compose"

# up
alias dcup="docker-compose up"  # display log
alias dcupd="docker-compose up --detach"  # run container in the background(no display log)

# build
alias dcb="docker-compose build"
alias dcbn="docker-compose build --no-cache"

################################
# language utility aliases
################################

##### Python #####
## pip
alias pip_uninstall_all='pip freeze | xargs pip uninstall -y'
alias pipu='pip install -U pip'

## jupyter notebook
alias ipy='ipython'
alias jn='ipython notebook --ip=127.0.0.1'

## jupyter lab
alias jl='jupyter lab'

## venv
alias pyv='python -m venv venv'

## start up project with venv, poetry
alias start-pyproject="source $PYDOTDIR/bootstrap-pyproject.sh"
alias clean-pyproject="rm -rf ./venv; rm ./pyproject.toml ./poetry.lock;"

## poetry
alias poetry-dev='poetry add --dev black flake8 pytest ipython jupyterlab'
alias poetry-req='poetry run pip freeze > ./requirements.txt'

## pipenv
alias penvreq='pipenv lock -r > requirements.txt'

##### TypeScript
## npx
alias ts="npx ts-node"

## yarn
alias ys="yarn start"

################################
# other utility aliases
################################

# general
alias path="echo $PATH"
alias fd="open -a Finder"

# for applications
alias cal="open /Users/pyteyon/Applications/Chrome\\ Apps.localized/Google\\ Calendar.app"
alias st="open '/Applications/Sourcetree.app'"

# for AtCoder
alias rmt="rm -rf test"
alias ojt="oj test -c"  # for OnlineJudgeTool

# for MeCab
alias mecab-neologd="mecab -d /usr/local/lib/mecab/dic/mecab-ipadic-neologd"

# for direnv
alias dinit="direnv edit ."
alias da="direnv allow"

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

############################################
# zsh command after alias settings
############################################

# direnv（MUST load `direnv` after alias settings）
export EDITOR=code
eval "$(direnv hook zsh)"

############################################
# zsh command completion
############################################

# poetry settings (not for homebrew setup)
fpath+=~/.zfunc

# enable zsh command completion(TAB completion)
# grep, git, man, cd, kill, apt-get, etc...
autoload -Uz compinit
compinit
