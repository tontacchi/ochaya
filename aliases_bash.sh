# lmao
alias please="sudo"
alias fucking="sudo"

# git shortcuts
alias gd="git diff"

alias gs="git status"
alias ga="git add"
alias gc="git commit"

alias gf="git fetch"
alias gp="git push"
alias gpu="git pull"

alias gl="git log"
alias gb="git branch"

alias gi="git init"
alias gcl="git clone"

# quick ls variations
alias lf="ls -F";
alias ll="ls -lh";
alias lw="ls -w 70";
alias lwf="ls -w 70 -F";
alias lwaf="lw -aFw 70";

alias ..="cd ..";
alias fhere="find . -name";

alias :q="exit"

# sector 0's local ip
alias knockknock="ping 192.168.1.226";

# Trick 1: list, sorted by file size
alias lfs="ls --human-readable --size -1 -S --classify";

# Trick 2: Find command in bash history
# alias gh="history | grep"

alias myip="curl http://ipecho.net/plain; echo";

# get the top 10 commands used from history
# history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10

# ssh into username@openlab.ics.uci.edu
alias ics="ssh aatontha@circinus-60.ics.uci.edu"

# print newline after any command executes
# PROMPT_COMMAND="export PROMPT_COMMAND=echo";
# alias clear="unset PROMPT_COMMAND; clear; PROMPT_COMMAND='export PROMPT_COMMAND=echo';";
# alias clear_print="unset PROMPT_COMMAND; clear; PROMPT_COMMAND='export PROMPT_COMMAND=echo';";

# try: keep terminal color scheme for tmux
alias tmux="TERM=screen-256color-bce tmux"

# yt-dlp
alias yt-dlp="~/.local/bin/yt-dlp"

