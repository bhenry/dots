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

alias http="python -m SimpleHTTPServer"

# usage: whatport :80
alias whatport="lsof -i"

source $DOTS/cm

export PATH=$PATH:$DOTS/python
