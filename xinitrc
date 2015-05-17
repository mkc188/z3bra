#!/bin/sh

run() {

    exec 1>&2 2>/dev/null

    xsetroot -name groaaaar
    hsetroot -tile ~/usr/img/bg/stairs.png -tint \#888888 -contrast 3
    xsetroot -cursor_name left_ptr

    xrdb -load  ~/etc/Xresources

    sxhkd -c ~/etc/sxhkdrc &

    takeoffdir >/dev/null 2>&1 &
    wew | yawee &
    pulse &

    exec xwait
}

run this shit
