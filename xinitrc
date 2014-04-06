#!/bin/sh
#
# ~/.xinitrc
#

# Set wallpaper
#hsetroot -solid \#333333
hsetroot -tile ~/usr/img/bg/default.jpg

# girl just wanna have fun
#xantfarm -num 4 -air '#2c2c2c' -ant '#cdf318' -sand '#665847' &

# Set bindings
xbindkeys

# default cursor
xsetroot -cursor_name left_ptr

function wm() {
    # Load X resources
    xrdb -load ~/etc/Xresources

    # set WM name
    xsetroot -name $1

    # watch mail directory for new mails
    # wendy -m 256 -f ~/var/mail/INBOX/new/ -t 500 -e beep &

    # Compositing
    xcompmgr || compton &

    # enable RGBA module for GTK
    # export GTK_MODULES=rgba

    font='-*-gohufont-medium-*-*--11-*-*-*-*-*-iso10646-1'

    while :; do date '+%H:%M'; sleep 60; done | 
        bar -f $font -B\#00000000 -b -g 30x10+1406+4 &

    exec $1
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
