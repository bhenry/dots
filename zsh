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
alias http="python -m SimpleHTTPServer"

# usage: whatport :80
alias whatport="lsof -i"

source $DOTS/cm
alias editdots="vim $DOTS"
export PATH=$PATH:$DOTS/python

export AOCTOKEN="53616c7465645f5f3c2bfb57fa202c2ec29d3e801519b77dfce767782f7f95e08eac7ad7696d3f2ab26bebdc178bbae71c475611c409af93a840e53f11f871bc"


## advent of code
alias aoc="cd ~/scratch/adventofcode && make up && code ."

eul() {
    make prob PROB=$1
}
