#!/bin/bash
#
# ~/.xinitrc
#

# load nvidia config
nvidia-settings -l --config=$HOME/.config/nvidia

# Set wallpaper
hsetroot -fill ~/usr/img/bg/sunrise.jpg

# default cursor
xsetroot -cursor_name left_ptr &

function wm() {
    # Load X resources
    xrdb -load ~/.Xresources &

    # set WM name
    xsetroot -name $1

    # Compositing
    # enable RGBA module for GTK
    export GTK_MODULES=rgba

    compton -cb -o0
    xbindkeys

    # spawn window manager
    exec $1
}

[[ -z $1 ]] && wm cwm

case $1 in
    rage)       exec wine ~/var/games/rage/Rage.exe;;
    defrag)     exec /opt/quake3/iodfengine.x86_64;;
    quakelive)  exec qlprism;;
    teeworlds)  exec teeworlds;;
    sauerbraten)  exec sauerbraten-client;;
    *) wm $1;;
esac
