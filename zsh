# PS1="[%n@%m][%1~]%# "
parse_pyenv() {
    p=$(pyenv version | awk '{print $1;}')
    [[ $p == "system" ]] && echo "" || echo "($p)"
}
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
COLOR_DEF='%f'
COLOR_USR='%F{243}'
COLOR_DIR='%F{197}'
COLOR_GIT='%F{39}'
COLOR_PYENV='%F{148}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='${COLOR_PYENV}$(parse_pyenv)${COLOR_USR}%n@%M${COLOR_DIR}[%1~]${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%# '

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init --path)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# default code editor
export EDITOR=code

# git
source $DOTS/git

