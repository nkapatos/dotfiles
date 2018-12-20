#!/usr/bin/env zsh
# SSH Symbol to use
nil_ssh_st(){
  __ssh_st="`plib_ssh_st`"
  if [[ "$__ssh_st" != "" ]]
	then
    echo -n " %F{$nil_ssh_color}${AM_SSH_SYM}%f"
  else
    echo -ne "$PROMPT_START_TAG"
  fi
}