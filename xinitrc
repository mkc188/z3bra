#!/bin/sh

run() {
    xsetroot -name groaaaar
    xsetroot -solid \#281616
    xsetroot -cursor_name left_ptr

    xrdb -load  ~/etc/Xresources
    xrdb -merge ~/etc/theme/smear

    sxhkd -c ~/etc/sxhkdrc >/dev/null 2>&1 &

    wew -a | yawee &
    pulse &

    exec xwait
}

run this shit
