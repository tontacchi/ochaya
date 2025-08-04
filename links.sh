#!/bin/bash

dots="$HOME/.ochaya"
conf="$HOME/.config"

ln -sf "${dots}/bash/bashrc"       "$HOME/.bashrc"
ln -sf "${dots}/bash/aliases.sh"   "$HOME/.bash_aliases"
ln -sf "${dots}/bash/functions.sh" "$HOME/.bash_functions"

ln -sf "${dots}/nvim"      "${conf}/nvim"
ln -sf "${dots}/vimrc"     "$HOME/.vimrc"
ln -sf "${dots}/tmux.conf" "$HOME/.tmux.conf"

ln -sf "${dots}/i3"      "${conf}/i3"
ln -sf "${dots}/picom"   "${conf}/picom"
ln -sf "${dots}/polybar" "${conf}/polybar"
ln -sf "${dots}/rofi"    "${conf}/rofi"
ln -sf "${dots}/dunst"   "${conf}/dunst"

ln -sf "${dots}/neofetch/"              "${conf}/neofetch"
ln -sf "${dots}/starship/starship.toml" "${conf}/starship.toml"

echo "Symlinks updated to point to ~/${dots}"
