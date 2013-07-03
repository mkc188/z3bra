#!/bin/bash
#
# ~/.xinitrc
#

# enable RGBA module for GTK
export GTK_MODULES=rgba

xsetroot -cursor_name left_ptr &
# Load X resources
xrdb -load ~/.Xresources &
# personnal bindings
xbindkeys

#status bar
~/bin/bar/status.sh &

# Set wallpaper
#feh --bg-fill --no-fehbg ~/usr/img/bg/cubes.jpg &
hsetroot -fill ~/usr/img/bg/turtle.png &

# Compositing
# compton -cCb -t-5 -l-5 -r4.2 -o.4
compton -cCb -r16 -t-22 -l-22 -o.8

# Choose WM
exec cwm
