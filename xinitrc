#!/bin/sh

run() {
	xsetroot -name groaaaar
	xsetroot -cursor_name left_ptr
	xrdb -load  ~/conf/xrdb.conf

	#hsetroot -fill ~/.wall.png
	hsetroot -solid '#14120f'

	sxhkd -m 1 &

	compton -cCf -D2 -e 0.4 -o1 -r8 -l-12 -t-12 &

	wew | yawee &
	mailbar     &
	takeoffdir  &
	beepop      &
	pulsar      &

	exec xwait
}

run this shit
