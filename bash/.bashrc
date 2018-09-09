# .bashrc

# User specific aliases and functions
export PROMPT_COMMAND=__prompt_command

prompt_segment() {
    local COLOUR="\[$(tput setaf ${1})\]"
    local RESET="\[$(tput sgr0)\]"
    echo -n ${COLOUR}${2}${RESET}
}

prompt_vaulted() {
  if [[ -z $VAULTED_ENV ]]; then
    return 
  fi
  local exp=$(echo $VAULTED_ENV_EXPIRATION)
  local valid_until=$(date -d $exp +%s)
  local fg=$1
  if [[ $valid_until -lt $(date +%s) ]]; then
    fg=$2
  fi
  if [[ -n $VAULTED_ENV ]]; then
    prompt_segment $fg "🔓 ${VAULTED_ENV}"
  fi
}

prompt_last_exit() {
  local prompt=$2
  local fg=2
  if [[ $1 -ne 0 ]]; then
      fg=196
  fi
  prompt_segment $fg "$prompt"
}

prompt_virtualenv() {
  if [[ -z $VIRTUAL_ENV ]]; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV="🐍 $(basename $VIRTUAL_ENV)"
  fi
  echo -n  $PYTHON_VIRTUALENV
}

source /usr/share/git-core/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

function __prompt_command() {
    local EXIT="$?"
    PS1=""
    PS1+=$(prompt_last_exit $EXIT '\u ')
    PS1+=$(prompt_segment 6 '⎈ \w')
    PS1+=$(prompt_segment 228 '$(__git_ps1) ')
    PS1+=$(prompt_segment 172 '$(prompt_virtualenv) ')
    PS1+=$(prompt_vaulted 39 203)
    PS1+="\n"
    PS1+=$(prompt_last_exit $EXIT '└─ $ ▶ ')
}


alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vimgo='vim -u ~/.vimrc.go'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
source <(kubectl completion bash)
