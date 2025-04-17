#!/bin/bash

DOTDIR="$HOME/.ochaya"

ln -sf "${DOTDIR}/bashrc"            "$HOME/.bashrc"
ln -sf "${DOTDIR}/aliases_bash.sh"   "$HOME/.bash_aliases"
ln -sf "${DOTDIR}/functions_bash.sh" "$HOME/.bash_functions"
ln -sf "${DOTDIR}/vimrc"             "$HOME/.vimrc"
ln -sf "${DOTDIR}/tmux.conf"         "$HOME/.tmux.conf"
ln -sf "${DOTDIR}/nvim"              "$HOME/.config/nvim"

echo "Symlinks updated to point to ~/${DOTDIR}"
