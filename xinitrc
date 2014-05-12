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
#xbindkeys
sxhkd -c ~/.sxhkdrc >/dev/null 2> ~/var/log/sxhkd.log &

# default cursor
xsetroot -cursor_name left_ptr

wm() {
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

    # get screen size
    IFS='x' read w h <<< "$(xrandr | awk '/\*/ {print $1}')"

    font='-*-stlarch-medium-*-*--10-*-*-*-*-*-*-*'
    font="${font},-*-gohufont-medium-*-*--11-*-*-*-*-*-iso10646-1"
    while :; do
        ~/bin/mkbar
    done | bar -f "$font" -B\#00000000 -b -g $((w - 20))x20+10+2 &

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
