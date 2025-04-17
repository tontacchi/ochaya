#---[ Global Variables ]--------------------------------------------------------
fzf_cmd="fzf --height=50% --layout=reverse --border=rounded --margin=3% --color=dark"

# used for mark() & jump()
JUMP_LIST=($HOME)
JUMP_INDEX=1
#---[ Global Variables ]--------------------------------------------------------


#---[ Vitals ]------------------------------------------------------------------
# DEPRECATED: symlink $HOME/${DOTDIR}/functions.sh -> $HOME/.bash_functions
# writes this file -> .bash_functions
# function bashfunc() {
# 	cp ~/.functions.sh ~/.bash_functions
# }

function confignvim() {
	local nvim_config_path="$HOME/.config/nvim"
	(cd "${nvim_config_path}" && nvim .)
}

#---[ Vitals ]------------------------------------------------------------------


#---[ Jump List ]---------------------------------------------------------------
function mark() {
	JUMP_LIST+=("$(pwd)")
	JUMP_INDEX=$((${#JUMP_LIST[@]} - 1))
}

function b() {
  if (( JUMP_INDEX > 0 )); then
    JUMP_INDEX=$((JUMP_INDEX - 1))
    cd "${JUMP_LIST[$JUMP_INDEX]}" || return

	echo ""
	local outputDir=$(pwd | sed "s|^$HOME|~|")
    echo -e "\e[0;36m$outputDir\033[0m"
  else
    echo "No earlier entry in jump list."
  fi
}

function f() {
  if (( JUMP_INDEX + 1 < ${#JUMP_LIST[@]} )); then
    JUMP_INDEX=$((JUMP_INDEX + 1))
    cd "${JUMP_LIST[$JUMP_INDEX]}" || return

	echo ""
	local outputDir=$(pwd | sed "s|^$HOME|~|")
    echo -e "\e[0;36m$outputDir\033[0m"
  else
    echo "No later entry in jump list."
  fi
}

function jlist() {
  for i in "${!JUMP_LIST[@]}"; do
    marker=" "
    [[ $i -eq $JUMP_INDEX ]] && marker=">"
    echo "[$i] $marker ${JUMP_LIST[$i]}"
  done
}

#---[ Jump List ]---------------------------------------------------------------


#---[ Source Code Manipulation ]------------------------------------------------
# Python 3
function py() {
	python3 "$@"
}

function mkvnv() {
	echo "python3 -m venv venv"
	python3 -m venv venv
}

function vnv() {
	source ./venv/bin/activate
}

# Kotlin
function kc() {
	"/home/andy/Downloads/kotlinc/bin/kotlinc"
}

function kcf() {
	local kc="/home/andy/Downloads/kotlinc/bin/kotlinc"

	${kc} ${1}.kt -include-runtime -d ${1}.jar
}

function jf() {
	java -jar ${1}.jar
}

#---[ Source Code Manipulation ]------------------------------------------------


#---[ File System & fzf ]-------------------------------------------------------
# cd + fzf
function sd()
{
	# save starting directory (in case of errors)
    local original_dir=$(pwd)

	# look for target from home directory
	cd ~
    # local dir=$(find * -type d -not -path '*/venv/*' | fzf)
	local target_dir="$(fdfind . --type d | ${fzf_cmd})"

	# Esc out of fzf -> return to starting directory & abort
    if [ -z "$target_dir" ]; then
        echo "No directory selected. Aborting."
        cd "$original_dir"
        return 1 
    fi

	# go to selected directory & print the path
    cd "$target_dir"
	mark

    clear
	local outputDir=$(pwd | sed "s|^$HOME|~|")
    echo -e "\e[0;36m$outputDir\033[0m"
}

function hd()
{
    local originalDir=$(pwd)
	cd ~
    # local dir=$(find . -type d -not -path '*/venv/*' | fzf)
	local dir="$(fdfind -H -t d | ${fzf_cmd})"

    if [ -z "$dir" ]; then
        echo "No directory selected. Aborting."
        cd "$originalDir"
        return 1 
    fi

    cd "$dir"
	mark

    clear
    local outputDir=$(pwd | sed "s|^$HOME|~|")
    echo -e "\e[0;36m$outputDir\033[0m"
}

# mv + fzf
function mf()
{
	local ORIGINAL_DIR=$(pwd)
	cd ~ || return 1

	# local FILE=$(find . -type f -not -path '*/venv/*' | fzf)
	local FILE="$(fdfind -t f | ${fzf_cmd})"
	if [ -z "$FILE" ]; then
        echo "No file selected. Aborting."
        cd "$ORIGINAL_DIR" || return 1
        return 1
    fi

    # local DEST=$(find . -type d -not -path '*/venv/*' | fzf)
	local DEST="$(fdfind -t d | ${fzf_cmd})"
    if [ -z "$DEST" ]; then
        echo "No destination selected. Aborting."
        cd "$ORIGINAL_DIR" || return 1
        return 1
    fi

    mv "$FILE" "$DEST"
    echo "Moved $FILE to $DEST"
    cd "$ORIGINAL_DIR" || return 1
}

function md() {
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
function cf() {
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
function rf() {
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

function rd() {
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
function ff() {
    local original_dir="$PWD"
    cd ~ || return

    # local selected_file=$(find * -type f -not -path '*/venv/*' | fzf)
	local selected_file="$(fdfind . --type f | ${fzf_cmd})"
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
function hf() {
    local original_dir="$PWD"
    cd ~ || return

    local selected_file=$(find . -type f -not -path '*/venv/*' | fzf)
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


#---[ recycle bin ]-------------------------------------------------------------
# dump .recycle/
function recycle() {
	rm -rf "/home/andy/.recycle"
	echo  "rm -rf ~/.recycle"

	mkdir "/home/andy/.recycle"
	echo  "mkdir ~/.recycle"
}

#---[ recycle bin ]-------------------------------------------------------------

# mkdir + cd into it
function mkd() {
	mkdir -pv "$@"
	cd "$@" || return 1
}

# lists previous commands using search term
function greph() {
	# Usage: greph <term> [count]	
	# - count: defaults to 10
	local count="$2"

	if [[ -z $count ]]; then
		count=10
	fi

	history | grep -vE "(gh|ghr)" | grep --color=always "$1" | tail -n "${count}"
}

# nicer output for echo $PATH
function path() {
	echo "${PATH//:/$'\n'}" | uniq -u | sort | nl
}

# clear screen & print current path
function c() {
	clear
    local outputDir=$(pwd | sed "s|^$HOME|~|")
    echo -e "\e[0;36m$outputDir\033[0m"
}

# i am a self-respecting, functional adult
function uwu_senpai_pweez() {
	local file="$1"

	if [[ -z $file ]]; then
		file="$HOME/.bashrc"
	fi

	source ${file}
	echo -e "わかった、ソースを教えてあげる\n"
}

# because <tab> is 1 keystroke too many
function uwu() {
	uwu_senpai_pweez $@
}

function clip() {
	cat $@ | xclip -selection c -r
}

