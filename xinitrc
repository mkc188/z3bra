#!/bin/bash
#
# ~/.xinitrc
#

# load nvidia config
nvidia-settings -l --config=$HOME/.config/nvidia

# Set wallpaper
hsetroot -fill ~/usr/img/bg/sunrise.jpg

# Set bindings
xbindkeys

# default cursor
xsetroot -cursor_name left_ptr &

function wm() {
    # Load X resources
    xrdb -load ~/.Xresources &

    # set WM name
    xsetroot -name $1

    # watch mail directory
    wendy -C -d ~/var/mail/INBOX/new/ -t 1 -e espeak -p 30 'new mail incoming' &

    # Compositing
    # enable RGBA module for GTK
    export GTK_MODULES=rgba

    compton -cb -o0

    # spawn window manager
    exec $1
}

function run() {
    # Use a dumb WM on purpose
    ~/bin/tinywm &

    # start specified app
    exec $@
}

[[ -z $1 ]] && wm cwm

case $1 in
    rage)           run wine ~/var/games/rage/Rage.exe;;
    steam)          run steam;;
    defrag)         run /opt/quake3/iodfengine.x86_64;;
    teeworlds)      run teeworlds;;
    sauerbraten)    run sauerbraten-client;;
    *) wm $1;;
esac
