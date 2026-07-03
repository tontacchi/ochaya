#―――[ Common Directories ]――――――――――――――――――――――――――――――――――――――――――――――――――――――
dots="$HOME/.ochaya"
conf="$HOME/.config"
work="$HOME/pfiles/dev"

alias vesk="cd $HOME/.var/app/dev.vencord.Vesktop/config/vesktop/themes"
alias vault="c $HOME/vaults/Vault"

alias dots="c $dots"
alias conf="c $conf"

alias github="c $work/github"
alias tontacchi="c $work/github/tontacchi"
alias dev="c $work/local"

alias wani="c $work/github/tontacchi/wanikani"
alias port="c $work/github/tontacchi/portfolio"
alias odin="c $work/github/tontacchi/odin/"

alias res="c $work/github/tontacchi/.res"
alias monk="c $work/github.com/tontacchi/monkey"
alias engine="c $work/github.com/tontacchi/search"

alias theory="open $HOME/pfiles/books/textbooks/CS-Theory/ &"

alias i3c="c $dots/i3"
alias picomc="c $dots/picom"
alias polybarc="c $dots/polybar"
alias dunstc="c $dots/dunst"
alias rofic="c $dots/rofi"

#―――[ Common Directories ]――――――――――――――――――――――――――――――――――――――――――――――――――――――


#―――[ sudo External Prompt ]――――――――――――――――――――――――――――――――――――――――――――――――――――
alias sudo="sudo -A"

#―――[ sudo External Prompt ]――――――――――――――――――――――――――――――――――――――――――――――――――――


#―――[ Silly ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
alias sl="sl -e"

#―――[ Silly ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

alias thu="thunar . &"
alias fd="fdfind"
alias nivm="nvim"
# alias c="cd"
alias h="cd ~"
alias yt="yt-dlp --js-runtimes bun:/home/andy/.bun/bin/bun"
alias srt="transcript"

#―――[ git Shortcuts ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
alias gd="git diff"

alias gs="git status"
alias ga="git add"
alias gap="git add -p"
alias gc="git commit"

alias gf="git fetch"
alias gp="git push"
alias gpu="git pull"

alias gl="git log"
alias gb="git branch"

alias gi="git init"

# replaced with gcl() shell function in functions.sh
# alias gcl="git clone"

#―――[ git Shortcuts ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――


#―――[ ls Variations ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
alias lf="ls -F";
alias ll="ls -lh";
alias lw="ls -w 70";
alias lwf="ls -w 70 -F";
alias lwaf="lw -aFw 70";

#―――[ ls Variations ]―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

# moved to functions.sh
# alias ..="cd ..";

alias :q="quit"
alias q="quit"

alias fhere="find . -name";

# sector 0's local ip
alias localhost="ping 192.168.1.226";
alias myip="curl http://ipecho.net/plain; echo";

# ssh into username@openlab.ics.uci.edu
alias ics="ssh aatontha@circinus-60.ics.uci.edu"

# try: keep terminal color scheme for tmux
alias tmux="TERM=screen-256color-bce tmux"


alias server="py -m http.server"

