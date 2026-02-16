#―――[ Common Directories ]――――――――――――――――――――――――――――――――――――――――――――――――――――――
dots="$HOME/.ochaya"
conf="$HOME/.config"
work="$HOME/pfiles/dev"

alias vault="cd $HOME/vaults/Vault"

alias dots="cd $dots"
alias conf="cd $conf"
alias pf="cd $HOME/pfiles"

alias github="cd $work/github"
alias tontacchi="cd $work/github/tontacchi"
alias dev="cd $work/local"

alias wani="cd $work/github/tontacchi/wanikani"
alias port="cd $work/github/tontacchi/portfolio"
alias odin="cd $work/github/tontacchi/odin/"

alias res="cd $work/local/res"
alias monk="cd $work/github.com/tontacchi/monkey"
alias engine="cd $work/github.com/tontacchi/search"

alias theory="open $HOME/pfiles/books/textbooks/CS-Theory/ &"

alias i3c="cd $dots/i3"
alias picomc="cd $dots/picom"
alias polybarc="cd $dots/polybar"
alias dunstc="cd $dots/dunst"
alias rofic="cd $dots/rofi"

#―――[ Common Directories ]――――――――――――――――――――――――――――――――――――――――――――――――――――――


#―――[ sudo External Prompt ]――――――――――――――――――――――――――――――――――――――――――――――――――――
alias sudo="sudo -A"

#―――[ sudo External Prompt ]――――――――――――――――――――――――――――――――――――――――――――――――――――


#―――[ Silly ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
alias sl="sl -e"

#―――[ Silly ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

alias fd="fdfind"
alias nivm="nvim"
alias c="cd"
alias h="cd ~"
alias yt="yt-dlp --js-runtimes bun:/home/andy/.bun/bin/bun"
alias srt="transcript"

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

