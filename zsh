PS1="[%n@%m][%1~]%# "


# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init --path)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1


# default code editor
export EDITOR=code 
