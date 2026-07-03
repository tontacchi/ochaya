#---[ Global Variables ]--------------------------------------------------------
FZF_CMD="fzf
--height=50%
--layout=reverse
--border=rounded
--margin=3%"

# used for mark() & jump()
JUMP_LIST=($HOME)
JUMP_INDEX=1
#---[ Global Variables ]--------------------------------------------------------

save_dir() {
	pwd > "$HOME/.ochaya/sakura-terminal/last-pwd.txt"
}

c() {
	local path=""

	if (( $# == 0 )); then
		path="$HOME/pfiles"
	else
		printf -v path '%s/' "$@"
		path=${path%/}
	fi

	cd -- "$path" || return	
	save_dir
}

_c_complete() {
	local current base candidate i

	current="${COMP_WORDS[COMP_CWORD]}"
	base="."

	# The ".." command implicitly contributes one parent directory.
	if [[ ${COMP_WORDS[0]} == ".." ]]; then
		base=".."
	fi

	# resolve completion relative to all preceding arguments
	for ((i = 1; i < COMP_CWORD; i++)); do
		base+="/${COMP_WORDS[i]}"
	done

	COMPREPLY=()

	while IFS= read -r candidate; do
		# return only the current path component, not accumulated base
		candidate=${candidate#"$base"/}
		COMPREPLY+=("$candidate")
	done < <(compgen -d -- "$base/$current")
}

complete -o filenames -o nospace -F _c_complete c

# shorthand for "$ c .."
# ▸ repeatable, with same <tab> autocomplete semantics
#   ▸ ex: $ .. .. goes up 2 directory levels
function .. {
	c .. "$@"
}

complete -o filenames -o nospace -F _c_complete ..

hist() {
	eval $(history | fzf +s | sed 's/^[ ]*[0-9]*[ ]*//')
}


# takes a username & logs them out whoops
bye() {
	sudo pkill -KILL -u $1
}

logout() {
	sudo pkill -KILL -u $USER
}

off() {
	sudo shutdown -h now
}


nvimc() {
	local nvim_config_path="$HOME/.config/nvim"
	(cd "${nvim_config_path}" && nvim .)
}

cssobsidian() {
	local obsidian_css_path="$HOME/vaults/Vault/Vault/.obsidian/snippets/"
	(cd "${obsidian_css_path}" && nvim .)
}


#---[ Jump List ]---------------------------------------------------------------
quit() {
	save_dir
	exit
}

#---[ Jump List ]---------------------------------------------------------------


#---[ Python ]------------------------------------------------------------------
py() {
	python3 "$@"
}

mkvnv() {
	echo "python3 -m venv venv"
	python3 -m venv venv
}

vnv() {
	source ./venv/bin/activate
}

dvnv() {
	deactivate
}

#---[ Python ]------------------------------------------------------------------


#---[ Kotlin ]------------------------------------------------------------------
kc() {
	"/home/andy/Downloads/kotlinc/bin/kotlinc"
}

kcf() {
	local kc="/home/andy/Downloads/kotlinc/bin/kotlinc"

	${kc} ${1}.kt -include-runtime -d ${1}.jar
}

jf() {
	java -jar ${1}.jar
}

#---[ Kotlin ]------------------------------------------------------------------


#---[ File System & fzf ]-------------------------------------------------------
sd() {
	# save starting directory (in case of errors)
    local original_dir=$(pwd)

	# look for target from home directory
	cd ~
    # local dir=$(find * -type d -not -path '*/venv/*' | fzf)
	local target_dir="$(fdfind . --type d | ${FZF_CMD[@]})"

	# Esc out of fzf -> return to starting directory & abort
    if [ -z "$target_dir" ]; then
        echo "No directory selected. Aborting."
        cd "$original_dir"
        return 1 
    fi

	# go to selected directory & print the path
    cd "$target_dir"

	# [JumpList]
	mark

    clear
}

hd() {
    local originalDir=$(pwd)
	cd ~
    # local dir=$(find . -type d -not -path '*/venv/*' | fzf)
	local dir="$(fdfind -H -t d | ${FZF_CMD[@]})"

    if [ -z "$dir" ]; then
        echo "No directory selected. Aborting."
        cd "$originalDir"
        return 1 
    fi

    cd "$dir"
    # local outputDir=$(pwd | sed "s|^$HOME|~|")
    # echo -e "\e[0;36m$outputDir\033[0m"
}

# mv + fzf
mf() {
	local ORIGINAL_DIR=$(pwd)
	cd ~ || return 1

	# local FILE=$(find . -type f -not -path '*/venv/*' | fzf)
	local FILE="$(fdfind -t f | ${FZF_CMD[@]})"
	if [ -z "$FILE" ]; then
        echo "No file selected. Aborting."
        cd "$ORIGINAL_DIR" || return 1
        return 1
    fi

    # local DEST=$(find . -type d -not -path '*/venv/*' | fzf)
	local DEST="$(fdfind -t d | ${FZF_CMD[@]})"
    if [ -z "$DEST" ]; then
        echo "No destination selected. Aborting."
        cd "$ORIGINAL_DIR" || return 1
        return 1
    fi

    mv "$FILE" "$DEST"
    echo "Moved $FILE to $DEST"
    cd "$ORIGINAL_DIR" || return 1
}

md() {
	local ORIGINAL_DIR=$(pwd)
	cd ~ || return 1

	local FILE=$(find . -type d -not -path '*/venv/*' | fzf)
	if [ -z "$FILE" ]; then
        echo "No file selected. Aborting."
        cd "$ORIGINAL_DIR" || return 1
        return 1
    fi

    local DEST=$(find . -type d -not -path '*/venv/*' | fzf)
    if [ -z "$DEST" ]; then
        echo "No destination selected. Aborting."
        cd "$ORIGINAL_DIR" || return 1
        return 1
    fi

    mv "$FILE" "$DEST"
    echo "Moved $FILE to $DEST"
    cd "$ORIGINAL_DIR" || return 1
}

# cp + fzf
cf() {
	local ORIGINAL_DIR=$(pwd)
	cd ~ || return 1

	local FILE=$(find . -type f -not -path '*/venv/*' | fzf)
	if [ -z "$FILE" ]; then
        echo "No file selected. Aborting."
        cd "$ORIGINAL_DIR" || return 1
        return 1
    fi

    local DEST=$(find . -type d -not -path '*/venv/*' | fzf)
    if [ -z "$DEST" ]; then
        echo "No destination selected. Aborting."
        cd "$ORIGINAL_DIR" || return 1
        return 1
    fi

    cp "$FILE" "$DEST"
    echo "Copied $FILE to $DEST"
    cd "$ORIGINAL_DIR" || return 1
}

# rm + fzf -> recycle bin
rf() {
	# save current working directory
	local ORIGINAL_DIR=$(pwd)
	local RECYCLE_DIR="/home/andy/.recycle"
	
	# change to the home directory
	cd ~ || return 1

	# select file using fzf
	local FILE=$(find . -type f | fzf --height=80%)
	if [ -z "$FILE" ]; then
        echo "No file selected. Aborting."
        cd "$ORIGINAL_DIR" || return 1
        return 1
    fi

	# Move the selected file to the selected directory
    mv "$FILE" "$RECYCLE_DIR"
    echo "Moved file $FILE to recycle"

	# Return to the original directory
    cd "$ORIGINAL_DIR" || return 1
}

rd() {
	# save current working directory
	local ORIGINAL_DIR=$(pwd)
	local RECYCLE_DIR="/home/andy/.recycle"
	
	# change to the home directory
	cd ~ || return 1

	# select file using fzf
	local FILE=$(find . -type d | fzf)
	if [ -z "$FILE" ]; then
        echo "No file selected. Aborting."
        cd "$ORIGINAL_DIR" || return 1
        return 1
    fi

	# Move the selected file to the selected directory
    mv "$FILE" "$RECYCLE_DIR"
    echo "Moved directory $FILE to recycle"

	# Return to the original directory
    cd "$ORIGINAL_DIR" || return 1
}

# cd into file's directory
ff() {
    local original_dir="$PWD"
    cd ~ || return

    # local selected_file=$(find * -type f -not -path '*/venv/*' | fzf)
	local selected_file="$(fdfind . --type f | ${FZF_CMD[@]})"
    if [[ -n "$selected_file" ]]; then
        local target_dir=$(dirname "$selected_file")  # Get the directory containing the selected file

		cd "$target_dir" || return
    else
        # Return to the original directory if no file was selected
        cd "$original_dir" || return
        echo "No file selected. Returned to: $PWD"

		return
    fi

    clear
    local outputDir=$(pwd | sed "s|^$HOME|~|")
    echo -e "\e[0;36m$outputDir\033[0m"
}

# cd into directory w/ file
# Function to find a file using fzf and cd to its directory
hf() {
    local original_dir="$PWD"
    cd ~ || return

    # local selected_file=$(find . -type f -not -path '*/venv/*' | fzf)
    local selected_file="$(find . -type f -not -path '*/venv/*' | ${FZF_CMD[@]})"

    if [[ -n "$selected_file" ]]; then
        local target_dir=$(dirname "$selected_file")  # Get the directory containing the selected file

		cd "$target_dir" || return
    else
        # Return to the original directory if no file was selected
        cd "$original_dir" || return
        echo "No file selected. Returned to: $PWD"

		return
    fi

    clear
    local outputDir=$(pwd | sed "s|^$HOME|~|")
    echo -e "\e[0;36m$outputDir\033[0m"
}

#---[ File System & fzf ]-------------------------------------------------------

#---[ Obsidian ]----------------------------------------------------------------
oo() {
	local vault_dir="$HOME/pfiles/vaults/Vault/01-Notes/"
	nvim "$vault_dir"
}
#---[ Obsidian ]----------------------------------------------------------------

#---[ recycle bin ]-------------------------------------------------------------
# dump .recycle/
recycle() {
	rm -rf "/home/andy/.recycle"
	echo  "rm -rf ~/.recycle"

	mkdir "/home/andy/.recycle"
	echo  "mkdir ~/.recycle"
}

#---[ recycle bin ]-------------------------------------------------------------


#---[ $PATH ]-------------------------------------------------------------------
# nicer output for echo $PATH
path() {
	echo "${PATH//:/$'\n'}" | uniq -u | sort | nl
}

#---[ $PATH ]-------------------------------------------------------------------


# mkdir + cd into it
mkd() {
	mkdir -pv "$@"
	cd "$@" || return 1
}

# lists previous commands using search term
hg() {
	# Usage: hg <term> [count]	
	# - count: defaults to 10
	local count="$2"

	if [[ -z $count ]]; then
		count=10
	fi

	history | grep -vE "(gh|ghr)" | grep --color=always "$1" | tail -n "${count}"
}

# i am a self-respecting, functional adult
uwu() {
	local file="$1"

	if [[ -z $file ]]; then
		file="$HOME/.bashrc"
	fi

	source ${file}
	echo -e "わかった、ソースを教えてあげる\n"
}

clip() {
	cat "$@" | xclip -selection c -r
	# cat "$@" | xclip -selection clipboard -loops 1
}

graph() {
	# Usage: graph [commit_count]	
	# - defaults to showing all commits
	local commit_count=$1
	if [[ -z $commit_count ]]; then
		git log --graph --oneline --all
	else
		git log --graph --oneline --all -n ${commit_count}
	fi
}



#---[ Media Player ]------------------------------------------------------------
play() {
	celluloid $1 2> /dev/null &
}

#---[ Media Player ]------------------------------------------------------------


gcl() {
	local default_user="tontacchi"

	case "$#" in
	# repo name or url only
	1)
		# url as only parameter matches pattern
		case "$1" in http://*|https://*|git@*:*|ssh://*)
			git clone "$1"
			;;
		# repo as only parameter, does not match url pattern
		*)
			git clone "https://github.com/${default_user}/$1"
			;;
		esac
		;;
	# username & repo, on github
	2)
		git clone "https://github.com/$1/$2"
		;;
	# host, username, repo
	3)
		git clone "https://$1/$2/$3"
		;;
	# default: show usage
	*)
		echo "usage:"
		echo "  gcl repo"
		echo "  gcl user repo"
		echo "  gcl host user repo"
		echo "  gcl https://host/user/repo"

		return 1
		;;
	esac

	return 0
}



# node version manager / nvm
load_nodejs() {
	# check shell session already loaded nvm
	if [[ -n "${nodejs_loaded:-}" ]]; then
		return 0
	fi

	# remove lazy wrappers
	unset -f nvm node npm npx

	# check & load nvm
	if [[ -s "$NVM_DIR/nvm.sh" ]]; then
		[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
	else
		notify-send "load_nodejs" "nvm.sh not found"
		return 1
	fi

	# cache marker for shell session
	nodejs_loaded=1

	return 0
}

nvm() {
	load_nodejs || return $?
    nvm "$@"
}

node() {
	# load_nodejs || return $?
    node "$@"
}

npm() {
	# load_nodejs || return $?
    npm "$@"
}

npx() {
	# load_nodejs || return $?
    npx "$@"
}


n() {
	# load_nodejs || return $?

	if [[ $# -eq 0 ]]; then
		nvim .
		return 0
	fi

	nvim "$@"
}


localbin() {
	cd "$HOME/.local/bin/"
}

mkgo() {
	mkd "$1"
	go mod init "$1"

	echo "package main" > main.go
	mkdir internal
}

