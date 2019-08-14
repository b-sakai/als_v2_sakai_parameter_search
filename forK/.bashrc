alias result='source ~/memo_dataDir'
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$PYENV_ROOT/versions/anaconda3-5.3.1/bin/:$PATH"
#export PS1='\e[0;32m\u:\$ \e[m'

eval `dircolors ~/.colorrc`
alias ls='ls --color=auto'
