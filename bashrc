#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -r /etc/bash_completion   ] && . /etc/bash_completion

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# colors
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
bold=$(tput bold)
none=$(tput sgr0)


# set the command prompt
export PS1="\[$yellow\]\w \[$none\]\$ "

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
alias q="exit"
alias quit="exit"
alias c="clear"
alias reload="source ~/.bashrc"

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
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alhF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

## Applications
export EDITOR="vim"
alias v="vim"
alias sv="sudo vim"

alias vol="alsamixer"

alias t='tmux attach'

## Softwares
alias ssh='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_ecdsa) && ssh'

# IRC client aliases to join networks
alias irc='irssi'

## Functions
function start() { sudo systemctl start $@; }
function stop() { sudo systemctl stop $@; }
function restart() { sudo systemctl restart $@; }
function enable() { sudo systemctl enable $@; }
function disable() { sudo systemctl disable $@; }

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
