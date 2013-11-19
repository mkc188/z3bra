#!/bin/bash
#
# ~/.xinitrc
#

# load nvidia config
nvidia-settings -l

# Set wallpaper
hsetroot -tile ~/usr/img/bg/stripes.png &

# default cursor
xsetroot -cursor_name left_ptr &

function wm() {
    # Load X resources
    xrdb -load ~/.Xresources &

    # set WM name
    xsetroot -name $1

    #status bar
    ~/bin/bar/status.sh & # it acts kinda weirdly

    # Compositing
    # enable RGBA module for GTK
    export GTK_MODULES=rgba

    #compton -cCb -t-5 -l-5 -r4.2 -o.4
    #compton -cCb -r16 -t-22 -l-22 -o.8
    compton -cb -o0

    # personnal bindings
    xbindkeys

    # spawn window manager
    exec $1
}

[[ -z $1 ]] && wm cwm

wm $1
