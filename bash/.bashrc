# .bashrc

# User specific aliases and functions
prompt_segment() {
    local COLOUR="\[$(tput setaf ${1})\]"
    local RESET="\[$(tput sgr0)\]"
    echo -n ${COLOUR}${2}${RESET}
}
vaulted_prompt() {
  if [[ -z $VAULTED_ENV ]]; then
    return
  fi
  local exp=$(echo $VAULTED_ENV_EXPIRATION)
  local valid_until=$(date -d $exp +%s)
  local fg=39
  if [[ $valid_until -lt $(date +%s) ]]; then
    fg=203
  fi
  if [[ -n $VAULTED_ENV ]]; then
    prompt_segment $fg "🔒${VAULTED_ENV}"
  fi
}

prompt_symbol() {
  local prompt="$ ▶"
  local fg=2
  if [[ $1 -ne 0 ]]; then
      fg=196
  fi
  prompt_segment $fg "$prompt"
}

source /usr/share/git-core/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

export PS1="$(prompt_segment 2 '\u') $(prompt_segment 6 '⎈ \w')$(prompt_segment 228 '$(__git_ps1)') $(vaulted_prompt)\n$(prompt_segment 2 '└─') $(prompt_symbol $?) "

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
