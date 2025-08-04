#!/bin/bash

DOTDIR="$HOME/.ochaya"

ln -sf "${DOTDIR}/bash/bashrc"       "$HOME/.bashrc"
ln -sf "${DOTDIR}/bash/aliases.sh"   "$HOME/.bash_aliases"
ln -sf "${DOTDIR}/bash/functions.sh" "$HOME/.bash_functions"

ln -sf "${DOTDIR}/nvim"              "$HOME/.config/nvim"

ln -sf "${DOTDIR}/vimrc"             "$HOME/.vimrc"
ln -sf "${DOTDIR}/tmux.conf"         "$HOME/.tmux.conf"

echo "Symlinks updated to point to ~/${DOTDIR}"
