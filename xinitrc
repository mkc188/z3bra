#!/bin/sh
#
# ~/.xinitrc
#

# Set wallpaper
#hsetroot -solid \#1d1d1d
hsetroot -tile ~/usr/img/bg/tile/camo.jpg

# girl just wanna have fun
#xantfarm -num 4 -air '#2c2c2c' -ant '#cdf318' -sand '#665847' &

# Set bindings
sxhkd -c ~/etc/sxhkdrc >/dev/null 2> /dev/null &

# default cursor
xsetroot -cursor_name left_ptr

run() {
    # Load X resources
    xrdb -I$HOME/etc/theme -load ~/etc/Xresources

    # set WM name
    xsetroot -name $1

    # watch mail directory for new mails
    # wendy -m 256 -f ~/var/mail/INBOX/new/ -t 500 -e beep &

    # get screen size
    #IFS='x' read w h <<< "$(xrandr | awk '/\*/ {print $1}')"

    #icon="-*-stlarch-medium-*-*--10-*-*-*-*-*-*-*"
    #font="*-gohufont-medium-*-*--11-*-*-*-*-*-iso10646-1"

    #echo | bar -p -B\#ff1d1d1d -g $((w - 20))x32+10+10 & sleep 0.1
    #echo | bar -p -B\#ff4c4c4c -g $((w - 26))x26+13+13 & sleep 0.1

    #while :; do
    #    ~/bin/mkbar
    #done | bar -f "$icon,$font" -B\#ff1d1d1d -g $((w - 30))x22+15+15 &

    gm &
    $@ &

    exec xwait
}

run swm
