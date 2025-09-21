#!/bin/bash

dots="$HOME/.ochaya"
conf="$HOME/.config"

safe_link() {
	src="$1"
	dest="$2"

	if [[ -e "$dest" ]] || [[ -L "$dest" ]]; then
		rm -rf "$dest"
	fi
	
	ln -s "$src" "$dest"
}

# safe_link "${dots}/bash/bashrc"       "$HOME/.bashrc"
# safe_link "${dots}/bash/aliases.sh"   "$HOME/.bash_aliases"
# safe_link "${dots}/bash/functions.sh" "$HOME/.bash_functions"
# safe_link "${dots}/nvim"      "${conf}/nvim"
# safe_link "${dots}/vimrc"     "$HOME/.vimrc"
# safe_link "${dots}/tmux.conf" "$HOME/.tmux.conf"
# safe_link "${dots}/i3"      "${conf}/i3"
# safe_link "${dots}/picom"   "${conf}/picom"
# safe_link "${dots}/polybar" "${conf}/polybar"
# safe_link "${dots}/rofi"    "${conf}/rofi"
# safe_link "${dots}/dunst"   "${conf}/dunst"
# safe_link "${dots}/neofetch/"              "${conf}/neofetch"
# safe_link "${dots}/starship/starship.toml" "${conf}/starship.toml"
safe_link "${dots}/cava" "${conf}/cava"
safe_link "${dots}/fzf"  "${conf}/fzf"

echo "Symlinks updated to point to ~/${dots}"
