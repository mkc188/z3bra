#!/bin/sh

run() {
	xsetroot -name groaaaar
	xsetroot -cursor_name left_ptr


	#compton -cCf -D2 -e 0.4 -o1 -r8 -l-12 -t-12 &

	wew | yawee &
	sxhkd -f 100 -m 1 &

	mailbar     &
	takeoffdir  &
	beepop      &
	#pulsar      &

	exec xwait
}

run this shit
