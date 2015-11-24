#!/bin/sh

run() {

    xsetroot -name groaaaar
    #hsetroot -tile ~/usr/img/bg/stairs.png -tint \#888888 -contrast 3
    hsetroot -fill ~/.wall.png
    xsetroot -cursor_name left_ptr

    xrdb -load  ~/conf/xrdb.conf

    sxhkd -m 1 &

    compton -cCf -D2 -e 0.4 -o1 -r8 -l-12 -t-1 &
    mailbar     &
    #bars        &
    #beepop      &
    takeoffdir  &
    wew | yawee &
    #pulse       &

    exec xwait
}

run this shit
