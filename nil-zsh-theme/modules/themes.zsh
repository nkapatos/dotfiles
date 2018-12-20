#!/usr/bin/env zsh

nil_default_theme(){
  [[ -z $nil_vcs_color ]]                 && nil_vcs_color=248
  [[ -z $nil_ssh_color ]]                 && nil_ssh_color=143
  [[ -z $nil_normal_color ]]              && nil_normal_color=39
  [[ -z $nil_error_color ]]               && nil_error_color=208
  [[ -z $nil_rev_color ]]                 && nil_rev_color=248
  [[ -z $nil_branch_color ]]              && nil_branch_color=78
  [[ -z $nil_left_right_color ]]          && nil_left_right_color=222
  [[ -z $nil_commit_since_color ]]        && nil_commit_since_color=244
  [[ -z $nil_fade_color ]]                && nil_fade_color=242
  [[ -z $nil_venv_color ]]                && nil_venv_color=245
  [[ -z $nil_python_color ]]              && nil_python_color=40
  [[ -z $nil_ruby_color ]]                && nil_ruby_color=196
  [[ -z $nil_java_color ]]                && nil_java_color=178
  [[ -z $nil_go_color ]]                  && nil_go_color=81
  [[ -z $nil_crystal_color ]]             && nil_crystal_color=8
  [[ -z $nil_node_color ]]                && nil_node_color=2
  [[ -z $nil_php_color ]]                 && nil_php_color=5
  [[ -z $nil_timer_color ]]               && nil_timer_color=248
  [[ -z $nil_viins_color ]]               && nil_viins_color=39
  [[ -z $nil_vicmd_color ]]               && nil_vicmd_color=208

  [[ -z "${PROMPT_START_TAG_COLOR}" ]]   && PROMPT_START_TAG_COLOR=39
  [[ -z "${PROMPT_END_TAG_COLOR}" ]]     && PROMPT_END_TAG_COLOR=39

  [[ -z "${PLIB_GIT_TRACKED_COLOR}" ]]   && PLIB_GIT_TRACKED_COLOR=78
  [[ -z "${PLIB_GIT_UNTRACKED_COLOR}" ]] && PLIB_GIT_UNTRACKED_COLOR=208
}