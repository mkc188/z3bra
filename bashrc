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

#MIN=1
#MAX=15
#RANDOM_COLOR=$(( $MIN+(`od -An -N2 -i /dev/random` )%($MAX-$MIN+1) ))
#fd=${fg[$RANDOM_COLOR]}
fd=${fg[15]}

PS1=''
test -n "$SSH_CLIENT" && PS1="${fg[8]} $(hostname|cut -b-1) ${fd}"
export PS1="${fd}─$PS1──${nofg} "

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

monit() {
    test $# -lt 1 && exit 1
    ps -eo pcpu,pmem,size,vsize,pid,args | sed -n "1p;/$1/p" | grep -v 'sed -n'
}

musage() {
    mem_total=$(free -m |sed -n '2p'| awk '{print $2}')
    mem_used=$(free -m |sed -n '3p'|awk '{print $3}')

    echo "$((${mem_total} / ${mem_used}))%"
}

cusage() {
    total="0"
    perc=`ps --no-header -eo pcpu | grep -v '0.0'`

    for p in $perc; do 
        total=`echo $total + $p | bc`;
    done

    echo "$total%"
}

start()    { for s in $@; do sudo /etc/rc.d/$s start; done   }
stop()     { for s in $@; do sudo /etc/rc.d/$s stop; done    }
restart()  { for s in $@; do sudo /etc/rc.d/$s restart; done }
status()   { for s in $@; do sudo /etc/rc.d/$s status; done  }

respawn() {
    test -n "$@" && pkill "$@" && "$@"
}

sprunge() {
    test -z $1 && FILE='-' || FILE=$1

    curl -sF "sprunge=<${FILE}" http://sprunge.us
}

setwall() {
    bgdir="$HOME/usr/img/bg"

    test -z "$1" && return

    # get screen dir
    IFS='x ' read sw sh <<< `xrandr | awk '/*/ {print $1}'`

    # get image dimensions (needs two lines because of IFS, no idea why)
    IFS=' ' isize=`identify $1 | awk '{print $3}'`
    IFS='x ' read iw ih <<< `echo $isize`

    test $iw -lt $sw && mode='tile' || mode='fill'

    ln -sf $1 ${bgdir}/default
    hsetroot -${mode} ${bgdir}/default
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

ttycolors() {
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

say () {
    uri='http://translate.google.com/translate_tts?tl=en&q='
    mplayer -really-quiet "${uri}$*"
}

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
    test -d ~/usr/ports/$1 || prtmk
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
alias grep="grep --color=auto"

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
    alias rec="ffmpeg -f x11grab -s 1440x900 -r 25 -i :0.0"
    alias wmg="echo 'group'\`xprop -root _NET_CURRENT_DESKTOP|cut -d= -f2\`|toilet -ffuture --gay"
    alias cam="mpv -tv driver=v4l2:width=320:height=240: -vo xv tv:// -geometry '99%:90%' -ontop"
fi

# HANDY RICKY SCRIPT
alias rick="echo 'curl -L http://bit.ly/10hA8iC | bash'"
alias rcommit="curl -s 'http://whatthecommit.com/index.txt'"
# }}}

## TWEAKS {{{
# change tty colors
ttycolors
# }}}

# vim: fdm=marker:
