#!/usr/bin/env bash

cd "$(dirname "$0")"

# Root of where the dotfiles and other config files are
DOTFILES_ROOT=$(pwd)

# Find all the $HOME files (everything outside of directories)
# echo $(find -H "$DOTFILES_ROOT" -name '.*' -not -name '.DS_Store' -maxdepth 1 -type f)

info () {
  printf "\r[\033[00;36mINFO\033[0m] $1\n"
}

info_action () {
  printf "\r\033[00;32m   -> \033[0m$1\n"
}

user () {
  printf "\r[\033[0;33m ?? \033[0m] $1\n"
}

success () {
  printf "\r\033[2K[\033[00;32m OK \033[0m] $1\n"
}

install_dotfiles () {
  info 'Installing Dotfiles'

  for src in $(find -H "$DOTFILES_ROOT" -name '.*' -not -name '.DS_Store' -maxdepth 1 -type f)
  do
    dst="$HOME/$(basename "${src}")"
    link_files "$src" "$dst"
  done
  success "Dotfiles installed"
}

link_files () {
  local src=$1 dst=$2
  # info_action "$1 -> $2"
  $(ln -sfn $1 "$2")
}

install_vscode_settings() {
  local vscode_settings=false;
  user "Would you like to copy the vscode user settings?\n\
       [y]es, [N]o"
  read -n 1 action

  case "$action" in
    y )
        vscode_settings=true;;
    * )
        ;;
  esac

  if [ "$vscode_settings" == "true" ]
  then
    local vscode_path=""

    case "$(uname -s)" in
      Darwin )
        vscode_path="Library/Application Support/Code/User";;
      * )
        # exit
        ;;
    esac

    # Clean up the snippets folder from vscode installation
    info 'Removing snippets folder created from vscode installation'
    $(rmdir "$HOME/$vscode_path/snippets")

    info 'Installing VSCode User settings and snippets folder'

    for src in $(find -H "${DOTFILES_ROOT}/vscode" -name '*.json' -o -name 'snippets')
    do
      dst="$HOME/$vscode_path/$(basename "${src}")"
      link_files "$src" "$dst"
    done
    success "VSCode User settings and snippets installed"
  fi
}

install_fonts() {
local install_fonts=false;
  user "Would you like to install fonts for specific use cases with your editor and terminal (Powerline & Fira)?\n\
       [y]es, [N]o"
  read -n 1 action

  case "$action" in
    y )
        install_fonts=true;;
    * )
        ;;
  esac
    
  if test "$(uname)" = "Darwin" ; then
    # MacOS
    font_dir="$HOME/Library/Fonts"
  else
    # Linux
    font_dir="$HOME/.local/share/fonts"
    mkdir -p $font_dir
  fi

  if [ "$install_fonts" == "true" ] ; then
    info 'Installing Fonts'
    find "${DOTFILES_ROOT}/fonts" \( -name "*.[ot]tf" \) -type f -print0 | xargs -0 -n1 -I % cp "%" "$font_dir/"
    success "Fonts Installed at $font_dir"
  fi
}

install_extras() {
  install_vscode_settings
  install_fonts
}

install_dotfiles
install_extras