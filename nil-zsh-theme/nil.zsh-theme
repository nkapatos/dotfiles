#!/usr/bin/env zsh

THEME_ROOT=${0:A:h}

source "${THEME_ROOT}/modules/themes.zsh"

source "${THEME_ROOT}/libs/promptlib/activate"
source "${THEME_ROOT}/libs/zsh-async/async.zsh"

source "${THEME_ROOT}/modules/prompt_symbols.zsh"
source "${THEME_ROOT}/modules/bgjob.zsh"
source "${THEME_ROOT}/modules/git.zsh"
source "${THEME_ROOT}/modules/timer.zsh"
source "${THEME_ROOT}/modules/versions.zsh"
source "${THEME_ROOT}/modules/prompt.zsh"
source "${THEME_ROOT}/modules/ssh.zsh"
source "${THEME_ROOT}/modules/async.zsh"

# Activate the default theme
nil_default_theme

# Configure the versions info
export NIL_VERSIONS_PROMPT=(NODE)

function preexec(){
  am_preexec_executed=1
  am_timer_start
  [[ $BUFFER == "" ]] && AM_EMPTY_BUFFER=1
}

# Output additional information about paths, repos and exec time
#
function precmd() {
    autoload -U add-zsh-hook
    setopt prompt_subst
    __time="`am_get_time_prompt`"
    am_preexec_executed=0

    PROMPT='
 `am_prompt_general_long_dir`
 `nil_ssh_st`'
    RPROMPT=''

    am_async_prompt
    am_timer_start
}