#!/bin/bash
#
# ~/.xinitrc
#

# Set wallpaper
hsetroot -fill ~/usr/img/bg/lego.jpg

# default cursor
xsetroot -cursor_name left_ptr

function wm() {
    # Load X resources
    xrdb -load ~/etc/Xresources

    # set WM name
    xsetroot -name $1

    # enable RGBA module for GTK
    export GTK_MODULES=rgba

    (while :; do ~/bin/bar/status.sh -F9 -H3 -Lc -Rmb; sleep 15; done)|bar -bpf &

    xbindkeys

    # spawn window manager
    $1 &
    exec xclock
}

function run() {
    # start specified app
    exec $@
}

test -z $1 && wm 2bwm

case $1 in
    steam)          run steam;;
    defrag)         run ioquake3;;
    teeworlds)      run teeworlds;;
    sauerbraten)    run sauerbraten-client;;
    *) wm $1;;
esac
