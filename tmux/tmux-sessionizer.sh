#!/usr/bin/env bash

# directories
dev="$HOME/pfiles/dev/local"
ton="$HOME/pfiles/dev/github/tontacchi"
academic="$HOME/pfiles/dev/academic"


# choosing project to work on
project=""

select_project() {
	project=$(
		printf '%s\n' \
			chimp \
			goflix \
			markview \
			requestly \
			sudoku |
			fzf
		)
	}

select_project

[ -z "${project:-}" ] && exit 0


# session launchers
session="$project"

create_session() {
	local name="$1"
	local dir="$2"

	notify-send "tmux" "launched session $name from $dir" -t 1
	tmux new-session -ds "$name" -c "$dir"
}

first_window() {
	local name="$1"
	local dir="$2"
	local command="${3:-}"

	tmux rename-window -t "$session:1" "$name"

	# 1st window inherits session directory
	# allows explicitly changing when needed
	tmux send-keys -t "$session:$name" "cd \"$dir\"" C-m

	if [[ -n "$command" ]]; then
		tmux send-keys -t "$session:$name" "$command" C-m
	fi
}

add_window() {
	local name="$1"
	local dir="$2"
	local command="${3:-}"

	tmux new-window \
		-t "$session" \
		-n "$name" \
		-c "$dir"

	if [[ -n "$command" ]]; then
		tmux send-keys -t "$session:$name" "$command" C-m
	fi
}

send_keys() {
	local name="$1"
	local commands="${2:-}"

	if [[ -n "$commands" ]]; then
		tmux send-keys -t "$session:$name" "$commands" C-m
	fi
}


# project launchers
launch_goflix() {
	local dir="$academic/$project"
	create_session "$session" "$dir"

	local win_1="backend"
	local win_2="frontend"
	local win_3="server"

	first_window "$win_1" "$dir"
	send_keys "$win_1" "clear"
	send_keys "$win_1" "n"

	add_window "$win_2" "$dir/frontend"
	send_keys "$win_2" "clear"
	send_keys "$win_2" "n"

	add_window "$win_3" "$dir"
	send_keys "$win_3" "set -a"
	send_keys "$win_3" "source .env"
	send_keys "$win_3" "set +a"
	send_keys "$win_3" "clear"
	send_keys "$win_3" "go run cmd/goflix/main.go"
}

launch_chimp() {
	dir="$academic/$project/"
	create_session "$session" "$dir"

	# [1:nvim] [2:test] [3:git]
	local win_1="nvim"
	local win_2="test"
	local win_3="git"

	first_window "$win_1" "$dir"
	send_keys "$win_1" "clear"
	send_keys "$win_1" "n"

	add_window "$win_2" "$dir"
	send_keys "$win_2" "clear"
	send_keys "$win_2" "go test ./..."

	add_window "$win_3" "$dir"
	send_keys "$win_3" "clear"
	send_keys "$win_3" "gf"
	send_keys "$win_3" "gs"
}

launch_markview() {
	local vault="$HOME/vaults/Vault/"

	# [backend:1] [frontend:2] [wails:3] [vault:4]
	dir="$dev/$project/"

	create_session "$session" "$dir"

	# [backend:1]
	tmux rename-window -t "$session:1" "backend"
	tmux send-keys -t "$session:backend" "n" C-m

	# [frontend:2]
	tmux new-window -t "$session" -n "frontend" -c "${dir}frontend"
	tmux send-keys -t "$session:frontend" "n" C-m

	# [wails:3]
	tmux new-window -t "$session" -n "wails" -c "$dir"
	tmux send-keys -t "$session:wails" "npm" C-m
	tmux send-keys -t "$session:wails" "wails dev -tags webkit2_41" C-m

	# [vault:4]
	tmux new-window -t "$session" -n "vault" -c "$vault"
	tmux send-keys -t "$session:vault" "n" C-m
}

launch_requestly() {
	# [backend:1] [frontend:2] [wails:3]
	dir="$ton/$project/"

	create_session "$session" "$dir"

	# [backend:1]
	tmux rename-window -t "$session:1" "backend"
	tmux send-keys -t "$session:backend" "n" C-m

	# [frontend:2]
	tmux new-window -t "$session" -n "frontend" -c "${dir}frontend"
	tmux send-keys -t "$session:frontend" "n" C-m

	# [wails:3]
	tmux new-window -t "$session" -n "wails" -c "$dir"
	tmux send-keys -t "$session:wails" "npm" C-m
	tmux send-keys -t "$session:wails" "wails dev -tags webkit2_41" C-m
}

launch_sudoku() {
	notify-send "sudoku" "not initalized yet" -t 1
}


# launch session based on project name
case "$project" in 
	markview)
		launch_markview
		;;

	requestly)
		launch_requestly
		;;

	chimp)
		launch_chimp
		;;

	sudoku)
		launch_sudoku
		;;
	goflix)
		launch_goflix
		;;
	*)
		echo "Error: unimplemented project launcher for: $project"
		exit 1
		;;
esac


# attach to created session
tmux select-window -t "$session:1"
tmux attach -t "$session"

