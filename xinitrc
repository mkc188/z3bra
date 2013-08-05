#!/bin/bash
#
# ~/.xinitrc
#

# load nvidia config
nvidia-settings -l

# default cursor
xsetroot -cursor_name left_ptr &

function wm() {
    # Load X resources
    xrdb -load ~/.Xresources &

    # personnal bindings
    xbindkeys

    #status bar
    ~/bin/bar/status.sh &

    # Set wallpaper
    hsetroot -fill ~/usr/img/bg/shblah.png &

    # Compositing
    # enable RGBA module for GTK
    export GTK_MODULES=rgba

    # compton -cCb -t-5 -l-5 -r4.2 -o.4
    compton -cCb -r16 -t-22 -l-22 -o.8

    # spawn window manager
    case $1 in
        rat) exec ratpoison;;
        cwm) exec cwm;;
    esac
}

case $1 in
    cwm) wm cwm;;
    rat) wm rat;;
    qlp) exec ~/.quakelive/qlprism/qlprism.sh;;
    q3a) exec /opt/quake3/iodfengine.x86_64;;
    cub) exec sauerbraten-client;;
    *)   wm cwm;;
esac
