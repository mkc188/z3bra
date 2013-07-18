## CONFIGURATION FILE FOR Z SHELL :: ENVIRONMENT {{{

# Path for Go projects
export GOPATH=~/code/go
export PATH=$PATH:$GOPATH/bin:$HOME/bin:.
unset GOBIN # use GOPATH for install

# Remote MPD server
export MPD_HOST='mpdconf@gavroche'

## }}}

## CONFIGURATION FILE FOR Z SHELL :: MAIN {{{

# start X at login
[ -z $DISPLAY ] && startx

# enable zsh completion menu
autoload -U compinit && compinit

# enable coloring
autoload -U colors && colors

# set the prompt 
PROMPT="
%{$fg_bold[yellow]%} »  "
RPROMPT="%{$fg[black]%}%M:%{$fg_bold[yellow]%}%~%{$reset_color%}   "

# vi-like key bindings
bindkey -v

## }}}

## CONFIGURATION FILE FOR Z SHELL :: ALIASES {{{

## Terminal
alias quit='exit'
alias c='clear'
alias s='sudo'

# Add a 'proctection' on rm | mv | cp
alias rm='rm -I'
alias cp='cp -vi'
alias mv='mv -i'

# Alias to avoid some 'RAAAAAAAAAH !!'
alias :q='quit'
alias fu='sudo $(fc -n -l -1)'

# Network/System monitoring
alias netlist='lsof -i -P | grep LISTEN' # show active network listener

# Pipes & more
alias -g BG='& exit'
alias -g N='> /dev/null'
alias -g L='| less'
alias -g M='| more'
alias -g G='| grep'
alias -g V='| vim -'
alias -g S='| curl -F "sprunge=<-" http://sprunge.us'

# Make 'ls' output colorfull
alias ls='ls --color=auto'

alias grep='grep --color=auto'

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

## Edition
export EDITOR='vim'
alias v='vim'
alias sv='sudo vim'

## ALSA
alias vol='alsamixer'

# TMUX
alias t='tmux'

# BTPD
alias btc="btcli -d ~/var/btp"

# desktop recording
alias rec="ffmpeg -f x11grab -s 1440x900 -r 25 -i :0.0 output.mkv"

# HANDY RICKY SCRIPT
alias rick="echo 'curl -L \'http://bit.ly/10hA8iC\' | bash'"
alias rcommit="curl -s 'http://whatthecommit.com/index.txt\'"

## }}}

## CONFIGURATION FILE FOR Z SHELL :: FUNCTIONS {{{

# make use of systemcl more friendly
function start()   { sudo systemctl start $@;   }
function stop()    { sudo systemctl stop $@;    }
function restart() { sudo systemctl restart $@; }
function enable()  { sudo systemctl enable $@;  }
function disable() { sudo systemctl disable $@; }
function status()  { sudo systemctl status $@; }

# easier extraction
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xvjf $1;;
            *.tar.gz) tar xvzf $1;;
            *.bz2) bunzip2 $1;;
            *.rar) unrar x $1;;
            *.gz) gunzip $1;;
            *.tar) tar xvf $1;;
            *.tbz2) tar xvjf $1;;
            *.tgz) tar xvzf $1;;
            *.zip) unzip $1;;
            *.Z) uncompress $1;;
            *.7z) 7za x $1;;
            *) echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

gify() {
  if [[ -n "$1" && -n "$2" ]]; then
    ffmpeg -i $1 -pix_fmt rgb24 temp.gif
    convert -layers Optimize temp.gif $2
    rm temp.gif
  else
    echo "proper usage: gif-ify <input_movie.mov> <output_file.gif>"
    echo "You DO need to include extensions."
  fi
}

# spawn a new main tmux session or attach to it if it exists
# t () {
#     SESSION_NAME=$(hostname)
# 
#     tmux attach-session -t $SESSION_NAME
# 
#     if [ $? -eq 1 ]; then
#         tmux new-session -s $SESSION_NAME -d
#         tmux new-window -dk -c~ -n "IRC"  -t $SESSION_NAME:0 irssi
#         tmux new-window -c~ -n "MAIL" -t $SESSION_NAME:9 mutt
#         tmux attach-session -t $SESSION_NAME
#     fi
# }

# auto-cd into a created directory
mcd () {
    mkdir $@ && cd $_
}

# auto-ls after changing directory
cd () {
    builtin cd $@ && ls -CF
}

## }}}

# vim: set tw=72 cc=73 ai ft=sh fdm=marker:
