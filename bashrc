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

PS1=''

#MIN=8
#MAX=15
#RANDOM_COLOR=$(( $MIN+(`od -An -N2 -i /dev/random` )%($MAX-$MIN+1) ))
#fd=${fg[$RANDOM_COLOR]}

test -n "$SSH_CLIENT" && PS1="${fg[8]}$(hostname|cut -b 1-3)"

fd=${fg[9]}
export PS1="${PS1}${fd}% ${nofg}"

# use auto-completion after those words
complete -cf sudo
complete -cf man
complete -cf killall
complete -cf pkill
complete -cf fakeroot
complete -cf respawn
complete -cf pgrep
# }}}

## FUNCTIONS {{{

up() {
    test -z "$1" && cd .. && return 1
    for i in $(seq 1 $1); do builtin cd ..; done
    pwd
}

monit() {
    test $# -lt 1 && return 1
    ps -eo pcpu,pmem,size,vsize,pid,args | sed -n "1p;/$1/p" | grep -v 'sed -n'
}

respawn() {
    test -n "$@" && pkill "$@" && "$@"
}

sprunge() {
    test -z $1 && FILE='-' || FILE=$1

    curl -sF "sprunge=<${FILE}" http://sprunge.us
}

thumbify() {
    if [ -f $1 ]; then
        cp $1 thumb/$1
        if [ $2 ]; then
            mogrify -resize $2 thumb/$1
        else
            mogrify -resize 250x250 thumb/$1
        fi
    else
        echo "$1: not a regular file"
    fi
}

# my computer is talking
say () {
    TL=${TL:-en}
    uri='http://translate.google.com/translate_tts?tl=${TL}&q='
    mplayer -really-quiet "${uri}$*"
}

# get a short definition from wikipedia
wiki () {
    dig +short txt "$*".wp.dg.cx
}

# consult vim's help
:h () {
    vim +"h $1" +only +'map q ZQ'
}

# auto-cd into a created directory
mcd () {
    mkdir $@ && cd $_
}

# perform 'ls' right after entering a directory
cd() {
    builtin cd "$@" && ls -CF --color
}

build() {
    test -d ~/usr/ports/$1 || prtmk $1
    cd ~/usr/ports/$1
    fakeroot pkgmk -d
}

ddg() {
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
alias fu='sudo `fc -n -l -1`'
alias fuck='sudo `fc -n -l -1`'
alias sv="EDITOR=vim sudo -e"

# Make some output colorfull
alias ls="ls --color=auto"
#alias grep="grep --color=auto"

# some more ls aliases
alias ll="ls -alhF --color=auto"
alias l="ls -CF --color=auto"

# job control
alias mtop="ps --no-header -eo pmem,size,vsize,comm | sort -nr | sed 10q"
alias ctop="ps --no-header -eo pcpu,comm | sort -nr | sed 10q"

# command shortner
alias g='grep'
alias v="vim"
alias t='tmux'
alias btc="btcli -d ~/var/btp"
alias csv='column -t -s\;'
alias vol="alsamixer"
alias yg="youtube-dl -q -x -o '%(title).%(ext)'"

# reattach IRC session
alias d='dtach -A ~/tmp/irssi.sk -e  irssi'

# crux specific
alias deptree='prt-get deptree'
alias update='prt-get update'
alias pkgup='pkgadd -u'

# desktop stuff
if test -n "$DISPLAY"; then
    alias winsize="xwininfo -id \`xprop|grep 'window id'|cut -d\  -f7\`"
    alias rec="ffmpeg -f x11grab -loglevel quiet -s 1440x900 -an -r 25 -i :0.0 -y -quality best"
    alias cam="mplayer -tv driver=v4l2:width=320:height=240: -vo xv tv:// -geometry '99%:90%' -ontop"
fi

# HANDY RICKY SCRIPT
alias rick="echo 'curl -L http://bit.ly/10hA8iC | bash'"
alias rcommit="curl -s 'http://whatthecommit.com/index.txt'"
# }}}

## TWEAKS {{{
# change tty colors
which ttycolors >/dev/null 2>&1 && ttycolors
# }}}

todo

# vim: fdm=marker:
