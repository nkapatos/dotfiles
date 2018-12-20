#!/usr/bin/env zsh

am_ruby_version(){
  echo -ne "%F{$nil_ruby_color}${AM_RB_SYM}`plib_ruby_short_version`%f"
}

am_venv(){
  __venv="`plib_venv`"
  if [[ "$__venv" != "" ]]
	then
    echo -ne " %F{$nil_venv_color}`plib_venv`%f"
  else
    echo -ne ""
  fi
}

am_python_version(){
  echo -ne "%F{$nil_python_color}${AM_PY_SYM}`plib_python_major_minor_version`%f"
}

am_java_version(){
  echo -ne "%F{$nil_java_color}${AM_JAVA_SYM}`plib_java_major_version`%f"
}

am_go_version(){
  echo -ne "%F{$nil_go_color}${AM_GO_SYM}`plib_go_version`%f"
}

am_crystal_version(){
  echo -ne "%F{$nil_crystal_color}${AM_CRYSTAL_SYM}`plib_crystal_version`%f"
}

am_node_version(){
  echo -ne "%F{$nil_node_color}${AM_NODE_SYM}`plib_node_version``nil_nvm_version`%f"
}

nil_nvm_version() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      echo -ne "|%F{$nil_error_color}↓ $(cat "${nvmrc_path}")%f"
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      echo -ne "|%F{$nil_rev_color}↻ $(cat "${nvmrc_path}")%f"
    fi
  # elif [ "$node_version" != "$(nvm version default)" ]; then
  #   echo "Reverting to nvm default version"
  #   nvm use default
  fi
}

am_php_version(){
  echo -ne "%F{$nil_php_color}${AM_PHP_SYM}`plib_php_major_version`%f"
}