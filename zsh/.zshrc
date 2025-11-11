# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

############################################
# init
############################################

# variables
export DOTDIR="$HOME/Projects/dotfiles"
export HOMEBREW_BREWFILE="$HOME/Projects/dotfiles/homebrew/Brewfile"

# load shell keybind
source $ZDOTDIR/.zshrc.keybind

############################################
# add to PATH
############################################

# for Homebrew
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# for Wireshark
export SSLKEYLOGFILE=$HOME/Desktop/tls_key.log
# "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

# for Git
# 元の git は /usr/bin/git にあるから，それより早く検索されるようにする
export PATH="/usr/local/bin:$PATH"

# for Docker
export PATH="$HOME/.docker/bin:$PATH"

# for Rust
. "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$PATH"

# for Starship (for shell customize)
# https://starship.rs/ja-JP/
eval "$(starship init zsh)"

# for Golang
export GOPATH=$(go env GOPATH)
export PATH=$(go env GOPATH)/bin:$PATH
export GO111MODULE=on

# for Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# for nvm (Node.js)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# for pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# for Java
# XX にバージョン番号を入れる
# export JAVA_HOME=`usr/libexec/java_home -v XX`
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

# for the Dart/Flutter SDK
export PATH="$HOME/SDKs/flutter/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"

# for Python
# for uv
export PATH="$HOME/.local/bin:$PATH"

# for Ruby installed by Homebrew
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"

# for rbenv (priority is higher than Homebrew's Ruby)
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(/opt/homebrew/bin/rbenv init - zsh)"

# for GCP
if [[ $(uname -m) == "x86_64" ]]; then
    # Intel Mac 用の処理
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
elif [[ $(uname -m) == "arm64" ]]; then
    # M1 Mac 用の処理
    source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
else
    echo "Unknown architecture"
fi

# for JetBrains
export PATH="$HOME/Library/Application Support/JetBrains/Toolbox/bin:$PATH"

############################################
# Aliases
############################################

################################
# aliases for system command
################################

# ls
alias ls="eza"  # https://github.com/ogham/exa
alias la="ls -l -a -h"  # -G is a color option on only macOS
# alias la="ls -l -a --color=auto"  # a color option on Linux

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias "cd-"="cd -"
alias cdp="cd ~/Projects"
alias cdd="cd ~/Projects/dotfiles"
alias cdz="cd $ZDOTDIR"
alias cdrdev="cd ~/Projects/Job/Firms/RICOH/RICOH_PRISM"
# alias cdr="cd ..."

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
  git commit -m "chore: add $1 and update Brewfile"
  git push origin master
}

brew-uninstall () {
  brew uninstall $1
  brew bundle dump --force --describe --file=$HOMEBREW_BREWFILE
  cd $DOTDIR
  git add .
  git commit -m "chore: remove $1 and update Brewfile"
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
alias gpom='git push origin $((git show-ref --verify --quiet refs/heads/main && echo "main") || (git show-ref --verify --quiet refs/heads/master && echo "master"))'
alias gpod="git push origin develop"
alias gfmms="git fetch && git merge origin/master"
alias gfmmn="git fetch && git merge origin/main"
alias gfmd="git fetch && git merge origin/develop"
alias grs="git reset --soft @\^"
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
alias drmin="docker image prune"  # rm all intermediate images
# When new image use an existing tag, old image's tag become "<none>"

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

##### TypeScript #####
## npx
alias ts="npx ts-node"

## yarn
alias ys="yarn start"

##### Rust #####
alias rm-rust-pkg-cache="rm -rf ~/.cargo/.package-cache"

################################
# alias for coding agents
################################

# for Codex
alias codd="codex --dangerously-bypass-approvals-and-sandbox"
alias coddr="codex --dangerously-bypass-approvals-and-sandbox -- --resume"

# for Claude
alias cldd="claude --mcp-config=$HOME/.claude/mcp.json --allow-dangerously-skip-permissions"
alias clddr="claude --mcp-config=$HOME/.claude/mcp.json --allow-dangerously-skip-permissions --resume"

################################
# other utility aliases
################################

# general
alias path="echo $PATH | tr ':' '\n'"

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

# GitHub CLI
eval "$(gh completion -s zsh)"

# for mise
eval "$(mise activate zsh)"

############################################
# zsh command completion
############################################

# 補完系
setopt always_last_prompt # 補完でプロンプト位置を保持
setopt auto_list # 曖昧補完
setopt auto_menu # 補完キー（Tab）連打で補完を順に表示
setopt auto_cd # cdコマンドの保管
setopt auto_param_keys # カッコなどを補完
setopt correct # コマンドの typo を検出
setopt extended_glob # globを使用
setopt list_types # 候補にファイルの種別を表示

# 色つきの補完
zstyle ':completion:*' list-colors 'di=36' 'ex=31' 'ln=35'

# 補完候補をカーソルで選択できる
zstyle ':completion:*:default' menu select=1

# Makefile の補完
zstyle ':completion:*:*:make:*' tag-order 'targets'

# 区切り文字以外として扱う文字のリスト
export WORDCHARS='*?_.[];!#$%^{}<>'

# poetry settings (not for homebrew setup)
fpath+=~/.zfunc

# for Deno
fpath=(~/.zsh $fpath)

# enable zsh command completion(TAB completion)
# grep, git, man, cd, kill, apt-get, etc...
autoload -Uz compinit
ADMIN_USER="nukopy"
if [ "$USER" = "$ADMIN_USER" ]; then
    compinit -i
else
    compinit
fi

# for Python (uv / uvx)
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# for Kiro
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
