# Ochaya (お茶屋) — a hidden teahouse for dotfiles 🍵

**ochaya** is my hidden dotfiles repository —  
a quiet, deliberate space where configuration files are kept in order and harmony.

It serves as a personal teahouse for the tools I rely on daily:  
`bash`, `tmux`, `neovim`, and more.

## 🌿 Purpose

- Maintain consistent configurations across systems
- Keep the home directory uncluttered
- Symlink-based setup for clarity and control
- Peacefully version-controlled with Git

## 🔗 Symlinks

```txt
~/.ochaya/bashrc          ->  ~/.bashrc
~/.ochaya/aliases_bash    ->  ~/.bash_aliases
~/.ochaya/functions_bash  ->  ~/.bash_functions
~/.ochaya/vimrc           ->  ~/.vimrc
~/.ochaya/tmux.conf       ->  ~/.tmux.conf
~/.ochaya/nvim/           ->  ~/.config/nvim/
```

## Usage

1. fork the directory into a hidden config directory
2. run the bash script to create symlinks

```shell
git clone https://github.com/tontacchi/ochaya ~/.ochaya
cd ~/.ochaya
./links.sh
```

