#
# ~/.bashrc
#

## INIT {{{
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# add folders to PATH
export PATH=$PATH:~/bin:.

# use auto-completion after those words
complete -cf sudo
complete -cf man
complete -cf killall
complete -cf pkill
# }}}

## FUNCTIONS {{{
function start() { sudo /etc/rc.d/$1 start; }
function stop() { sudo /etc/rc.d/$1 stop; }
function restart() { sudo /etc/rc.d/$1 restart; }

function thumbify() {
    if [ -f $1 ]; then
        cp $1 thumb-$1
        if [ $2 ]; then
            mogrify -resize $2 thumb-$1
        else
            mogrify -resize 250x250 thumb-$1
        fi
    else
        echo "Error: '$1' is not a valid file!"
    fi
}

function ttycolors() {
    if [ "$TERM" = "linux" ]; then
        echo -en "\e]P0232323" #black    -> this is the background color as well. 
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
        echo -en "\e]PFffffff" #white   -> this is the foreground color as well.
        clear #for background artifacting
    fi
}
## }}}

## ALIASES {{{

## Terminal
alias quit="exit"
alias c="clear"
alias so="source ~/.bashrc"

# Add a 'proctection' on rm | mv | cp
alias rm='rm -i'
alias cp='cp -rvi'
alias mv='mv -i'

# Alias to avoid some "RAAAAAAAAAH !!"
alias :q="quit"
alias cd..="cd .."
alias fuck='sudo $(fc -n -l -1)'

# Make some output colorfull
alias ls='ls --color=auto'

alias grep='grep --color=auto'

# some more ls aliases
alias ll='ls -alhF --color=auto'
alias l='ls -CF --color=auto'

## Applications
export EDITOR="vim"
alias v="vim"
alias sv="sudo vim"

alias vol="alsamixer"

alias t="tmux"
# }}}

## CONFIG {{{
# vim as default editor
export EDITOR='vim'

# use vi-like CLI
set -o vi

# change tty colors
ttycolors
# }}}

# vim: fdm=marker:
