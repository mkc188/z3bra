#!/bin/sh

hsetroot -solid \#281616
sxhkd -c ~/etc/sxhkdrc >/dev/null 2> /dev/null &

run() {
    xsetroot -name groaaaar
    xsetroot -cursor_name left_ptr

    xrdb -load  ~/etc/Xresources
    xrdb -merge ~/etc/theme/wine

    gm &
    $@ &

    exec xwait
}

run swm
