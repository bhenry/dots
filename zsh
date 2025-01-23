# PROMPT
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
COLOR_DEF='%f'
COLOR_USR='%F{243}'
COLOR_DIR='%F{197}'
COLOR_GIT='%F{39}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
PROMPTTIME='[%D{%H:%M:%S}] '
export PROMPT='${COLOR_USR}%B%n@%m%b${COLOR_DIR}[%1~]${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}${PROMPTTIME}%# '

# TMOUT=1
# TRAPALRM() {
#     zle reset-prompt
# }

# Homebrew
if [ ! -f /opt/homebrew/bin/brew ]; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    eval "$(/opt/homebrew/bin/brew shellenv)"
    # brew update > /dev/null 2>&1
fi

# pyenv
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# eval "$(pyenv init --path)"
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# default code editor
if [ ! /opt/homebrew/bin/emacs ]; then
    brew install emacs
fi
export EDITOR=emacs

# source private exports (not to be committed)
source $DOTS/exports/private

# git
source $DOTS/git

# dev aliases
alias dev="cd ~/dev"
alias la="ls -al"
alias blk="black --config pyproject.toml --check ."
alias lint="flake8 && blk"
alias pt="pytest && lint"
alias nt="nosetests && lint"
alias idea='open -na "IntelliJ IDEA.app"'
alias http="python3 -m http.server"

# usage: whatport :80
alias whatport="lsof -i"

# cm
source $DOTS/cm

# python stuff
source $DOTS/py

export PATH=$PATH:$DOTS/python:$DOTS/dicker

export AOCTOKEN="53616c7465645f5fc5556ef39fc0a8c354de0df6870d6e42c53424300a50e0d523480aeda09a443856c01b0aafe4059e7e1f960f00c73100be92cbe1c81a91b9"

## advent of code
alias aoc="cd ~/scratch/adventofcode && make up && code ."
alias euler="cd ~/scratch/euler && make up && code ."
eul() {
    make prob PROB=$1
}


alias wttr="curl 'https://wttr.in/searsmont?'"


### AWS STUFF
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
alias awslocal="AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} AWS_DEFAULT_REGION=${DEFAULT_REGION:-$AWS_DEFAULT_REGION} aws --endpoint-url=http://${LOCALSTACK_HOST:-localhost}:4566"

# node
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
