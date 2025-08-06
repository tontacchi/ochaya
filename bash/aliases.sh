#―――[ Common Directories ]――――――――――――――――――――――――――――――――――――――――――――――――――――――
dots="$HOME/.ochaya"
conf="$HOME/.config"
work="$HOME/pfiles/workspace"

alias dots="cd $dots"
alias conf="cd $conf"

alias res="cd $work/local/res"
alias monk="cd $work/github.com/tontacchi/monkey"
alias engine="cd $work/github.com/tontacchi/search"

alias github="cd $work/github.com"
alias theory="open $HOME/pfiles/books/textbooks/CS-Theory/ &"

alias i3c="cd $dots/i3"
alias picomc="cd $dots/picom"
alias polybarc="cd $dots/polybar"
alias dunstc="cd $dots/dunst"
alias rofic="cd $dots/rofi"

#―――[ Common Directories ]――――――――――――――――――――――――――――――――――――――――――――――――――――――

#―――[ sudo Prompt ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
alias sudo="sudo -A"

#―――[ bash Prompt ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

#―――[ Silly ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# lmao thanks reddit
alias please="sudo"
alias fucking="sudo"

#―――[ Silly ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

#―――[ git Shortcuts ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
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

#―――[ git Shortcuts ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――


#―――[ ls Variations ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
alias lf="ls -F";
alias ll="ls -lh";
alias lw="ls -w 70";
alias lwf="ls -w 70 -F";
alias lwaf="lw -aFw 70";

#―――[ ls Variations ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

alias ..="cd ..";

alias :q="exit"
alias q="exit"

alias fhere="find . -name";

# sector 0's local ip
alias localhost="ping 192.168.1.226";
alias myip="curl http://ipecho.net/plain; echo";

# ssh into username@openlab.ics.uci.edu
alias ics="ssh aatontha@circinus-60.ics.uci.edu"

# try: keep terminal color scheme for tmux
alias tmux="TERM=screen-256color-bce tmux"

# yt-dlp
alias yt-dlp="~/.local/bin/yt-dlp"

