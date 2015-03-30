#!/bin/sh

run() {

    exec 1>&2 2>/dev/null

    xsetroot -name groaaaar
    hsetroot -fill ~/usr/img/bg/stallche.jpg
    xsetroot -cursor_name left_ptr

    xrdb -load  ~/etc/Xresources
    xrdb -merge ~/etc/theme/smear

    sxhkd -c ~/etc/sxhkdrc &

    wew | yawee &
    pulse &

    exec xwait
}

run this shit
