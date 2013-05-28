#!/bin/bash
#
# ~/.xinitrc
#

DEFAULT_SESSION="cwm"

# load fonts
# xset +fp /usr/share/fonts/local/
# xset +fp /usr/share/fonts/misc/
# xset fp rehash

# enable RGBA module for GTK
export GTK_MODULES=rgba

xsetroot -cursor_name left_ptr &
# Load X resources
xrdb -load ~/.Xresources &
# personnal bindings
xbindkeys

#status bar
~/.config/bar/status.sh &

# Set wallpaper
# feh --bg-fill --no-fehbg ~/usr/img/bg/bear.jpg &
feh --bg-tile --no-fehbg ~/usr/img/bg/stripes.png
# launch devilspie
# devilspie -a &
# Compositing
# compton -cCb -t-5 -l-5 -r4.2 -o.4
compton -cCb -r16 -t-22 -l-22 -o.8

# Choose WM
case $1 in
    evilwm)
        exec evilwm
        ;;
    cwm)
        exec cwm
        ;;
    console)
        exec urxvtc
        ;;
    *)
        exec $DEFAULT_SESSION
        ;;
esac
