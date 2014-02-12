#
# ~/.bashrc
#

## INIT {{{

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Fancy prompt
fg=('\[\e[0;30m\]' '\[\e[0;31m\]' '\[\e[0;32m\]' '\[\e[0;33m\]'
    '\[\e[0;34m\]' '\[\e[0;35m\]' '\[\e[0;36m\]' '\[\e[0;37m\]'
    '\[\e[1;30m\]' '\[\e[1;31m\]' '\[\e[1;32m\]' '\[\e[1;33m\]'
    '\[\e[1;34m\]' '\[\e[1;35m\]' '\[\e[1;36m\]' '\[\e[1;37m\]')
nofg='\[\e[0m\]'

case $HOSTNAME in
    'cosette')              fd=${fg[10]} ;;
    'gavroche')             fd=${fg[12]} ;;
    'javert')               fd=${fg[11]} ;;
    'triton')               fd=${fg[8]}  ;;
    'EMIS030')              fd=${fg[14]} ;;
    'ks395925.kimsufi.com') fd=${fg[13]} ;;
    *)                      fd=${fg[15]} ;;
esac

MIN=1
MAX=15
RANDOM_COLOR=$(( $MIN+(`od -An -N2 -i /dev/random` )%($MAX-$MIN+1) ))
fd=${fg[$RANDOM_COLOR]}

PS1='';[ -n "$SSH_CLIENT" ] && PS1="${fd}(${fg[8]}$(hostname|cut -b-2)${fd})"
export PS1="${fd}─${PS1}${fd}──── ${nofg}"

# command line editing
set -o vi

# use auto-completion after those words
complete -cf sudo
complete -cf man
complete -cf killall
complete -cf pkill
# }}}

## FUNCTIONS {{{

function start()    { sudo systemctl start $@;   }
function stop()     { sudo systemctl stop $@;    }
function restart()  { sudo systemctl restart $@; }
function status()   { sudo systemctl status $@;  }
function enable()   { sudo systemctl enable $@;  }
function disable()  { sudo systemctl disable $@; }

function sprunge() {
    test -z $1 && FILE='-' || FILE=$1

    curl -sF "sprunge=<${FILE}" http://sprunge.us
}

function thumbify() {
    if [ -f $1 ]; then
        cp $1 thumb-$1
        if [ $2 ]; then
            mogrify -resize $2 thumb-$1
        else
            mogrify -resize 250x250 thumb-$1
        fi
    else
        echo "$1: not a regular file"
    fi
}

function ttycolors() {
    if [ "$TERM" = "linux" ]; then
        echo -en "\e]P0222222" #black    -> also the background
        echo -en "\e]P18b3e2f" #darkred
        echo -en "\e]P2526f33" #darkgreen
        echo -en "\e]P38b814c" #brown
        echo -en "\e]P44a708b" #darkblue
        echo -en "\e]P57a378b" #darkmagenta
        echo -en "\e]P6528b8b" #darkcyan
        echo -en "\e]P7e8e9ca" #lightgray
        echo -en "\e]P8666666" #darkgray
        echo -en "\e]P9d75f00" #red
        echo -en "\e]PA8ea433" #green
        echo -en "\e]PBeee685" #yellow
        echo -en "\e]PC9ac0cd" #blue
        echo -en "\e]PD9f79ee" #magenta
        echo -en "\e]PE79cdcd" #cyan
        echo -en "\e]PFffffff" #white   -> also the foreground
        clear #for background artifacting
    fi
}

:h () {
    vim +"h $1" +only +'map q ZQ'
}

# auto-cd into a created directory
mcd () {
    mkdir $@ && cd $_
}

# perform 'ls' right after entering a directory
function cd() {
    builtin cd "$@" && ls -CF --color
}

function build() {
    test -d ~/usr/ports/$1 || prtmk
    cd ~/usr/ports/$1
    pkgmk -d
}

function ddg() {
    elinks "http://duckduckgo.com/lite?q=${*// /+}"
}
## }}}

## ALIASES {{{

## Terminal
alias quit="exit"
alias c="clear"
alias so="source ~/.bashrc"

# Add a 'proctection' on rm | mv | cp
alias cp="cp -rvi"
alias mv="mv -i"

# Alias to avoid some "RAAAAAAAAAH !!"
alias :q="quit"
alias cd..="cd .."
alias fu="sudo $(fc -n -l -1)"
alias fuck="sudo $(fc -n -l -1)"

# Make some output colorfull
alias ls="ls --color=auto"

alias grep="grep --color=auto"

# some more ls aliases
alias ll="ls -alhF --color=auto"
alias l="ls -CF --color=auto"

## Applications
alias v="vim"
alias sv="EDITOR=vim sudo -e"

alias vol="alsamixer"

# TMUX / DTACH
alias t='tmux'
alias d='dtach -A ~/tmp/irssi.sk /usr/bin/irssi'

# BTPD
alias btc="btcli -d ~/var/btp"

# crux specific
alias deptree='prt-get deptree'
alias install='prt-get depinst'
alias update='prt-get update'
alias pkgup='pkgadd -u'

# desktop stuff
if test -n "$DISPLAY"; then
    alias rec="ffmpeg -f x11grab -s 1440x900 -r 25 -i :0.0 output.mkv"
    alias wmg="echo 'group'`xprop -root _NET_CURRENT_DESKTOP|cut -d= -f2`|toilet -ffuture --gay"
fi

# HANDY RICKY SCRIPT
alias rick="echo 'curl -L \'http://bit.ly/10hA8iC\' | bash'"
alias rcommit="curl -s 'http://whatthecommit.com/index.txt'"
# }}}

## TWEAKS {{{
# change tty colors
ttycolors
# }}}

# vim: fdm=marker:
