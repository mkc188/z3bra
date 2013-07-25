#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# add folders to PATH
export PATH=$PATH:~/bin:.

# use auto-completion after those words
complete -cf sudo
complete -cf man
complete -cf killall
complete -cf pkill

# vim as default editor
export EDITOR='vim'

# use vi-like CLI
set -o vi


## ALIASES ##

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

## Functions
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
