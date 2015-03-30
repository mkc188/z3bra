## INIT {{{

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

test -n "$SSH_CLIENT" && PS1="${fg[8]}$(hostname|cut -b 1-3)" || PS1=

fd='\[\e[0m\]'
ff='\[\e[1;37m\]'
export PS1="${PS1}${ff}% ${fd}"

# use auto-completion after those words
complete -cf sup
complete -cf man
complete -cf killall
complete -cf pkill
complete -cf fakeroot
complete -cf respawn
complete -cf pgrep
# }}}
## FUNCTIONS {{{

:h () { vim +"h $1" +only +'map q ZQ'; }
mcd () { mkdir $@ && cd $_; }

up() {
    test -z "$1" && cd .. && return 1
    for i in $(seq 1 $1); do builtin cd ..; done
    pwd
}

sprunge() {
    test -z $1 && FILE='-' || FILE=$1
    curl -sF "sprunge=<${FILE}" http://sprunge.us
}

# my computer is talking
#say () {
#    TL=${TL:-en}
#    uri="http://translate.google.com/translate_tts?tl=${TL}&q="
#    mplayer -really-quiet "${uri}$*"
#}

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
alias fu='sup `fc -n -l -1`'
alias fuck='sup `fc -n -l -1`'
alias sv="sup vim"

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
alias xreload="xrdb -load ~/etc/Xresources; xrdb -merge ~/etc/theme/wine"
alias rec="ffmpeg -f x11grab -s 1440x900 -an -r 16 -loglevel quiet -i :0.0 -b:v 5M -y"
alias cam="mplayer -tv driver=v4l2:width=320:height=240: -vo xv tv:// -geometry '99%:90%' -ontop"

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
