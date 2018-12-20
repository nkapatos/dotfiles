#!/usr/bin/env zsh

version_prompt(){
  if [[ ! -z "$NIL_VERSIONS_PROMPT" ]]
  then
    LOOP_INDEX=0
    for _v in $NIL_VERSIONS_PROMPT
    do
      [ "$LOOP_INDEX" != "0" ] && echo -ne "%F{$nil_fade_color}|%f"
      [ "$LOOP_INDEX" = "0" ] && LOOP_INDEX=$(($LOOP_INDEX + 1)) && echo -ne "%F{$nil_fade_color}[%f"
      [ "$_v" = "JAVA" ] && echo -ne "`am_java_version`"
      [ "$_v" = "GO" ] && echo -ne "`am_go_version`"
      [ "$_v" = "NODE" ] && echo -ne "`am_node_version`"
    done
    [ "$LOOP_INDEX" != "0" ] && echo -ne "%F{$nil_fade_color}]%f"
  fi
}

nil_vc_prompt(){
  if [[ $(am_is_git) == 1 ]]; then
    echo -ne "`am_bg_count``am_git_rebasing`%F{$nil_vcs_color}${AM_GIT_SYM}:%f`am_git_branch``am_git_commit_time` `am_git_rev``am_git_left_right``am_git_dirty`"
  else
    echo -ne "`am_bg_count`"
  fi
}

function am_prompt_general_short_dir(){
  if [[ $AM_ERROR_ON_START_TAG == 1 && $PROMPT_START_TAG != "" ]]; then
    echo -ne "%F{$nil_normal_color}%1~%f${end_tag}"
  else
    echo -ne "%(?.%F{$nil_normal_color}%1~%f${end_tag}.%F{$nil_error_color}%B%1~%b%f${end_tag})"
  fi
  [[ $AM_HIDE_EXIT_CODE -ne 1 ]] && echo -ne "%(?.. %F{$nil_fade_color}%?%f)"
}

function am_prompt_general_long_dir(){
  if [[ $AM_ERROR_ON_START_TAG == 1 && $PROMPT_START_TAG != "" ]]; then
    echo -ne "%F{$nil_normal_color}%~%f${end_tag}"
  else
    echo -ne "%(?.%F{$nil_normal_color}%~%f${end_tag}.%F{$nil_error_color}%B%~%b%f${end_tag})"
  fi
  [[ $AM_HIDE_EXIT_CODE -ne 1 ]] && echo -ne "%(?.. %F{$nil_fade_color}%?%f)"
}

function am_prompt_complete() {
#   PROMPT='
#  `am_prompt_general_long_dir`
#  `nil_ssh_st`'
  RPROMPT='`nil_vc_prompt` `version_prompt`${VIM_PROMPT}'
  zle && zle reset-prompt
  async_stop_worker prompt -n
  unset AM_EMPTY_BUFFER
}