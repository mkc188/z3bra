#!/bin/bash
#
# ~/.xinitrc
#

# Set wallpaper
hsetroot -fill ~/usr/img/bg/lego.jpg

# default cursor
xsetroot -cursor_name left_ptr &

function wm() {
    # Load X resources
    xrdb -load ~/.Xresources &

    # set WM name
    xsetroot -name $1

    # enable RGBA module for GTK
    export GTK_MODULES=rgba

    (while :; do ~/bin/bar/status.sh -F9 -H3 -Lc -Rmb; sleep 15; done)|bar -bpf &

    xbindkeys

    # spawn window manager
    exec $1
}

[[ -z $1 ]] && wm 2bwm

wm $1
