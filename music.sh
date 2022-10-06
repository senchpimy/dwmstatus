#!/bin/sh

filter() { mpc | sed "/^volume:/d;s/\\&/&amp;/g;s/\\[paused\\].*/⏸/g;/\\[playing\\].*/d;/^ERROR/Q" | paste -sd ' ' -;}

pidof -x sb-mpdup >/dev/null 2>&1 || sb-mpdup >/dev/null 2>&1 &
case $BUTTON in
	1) mpc toggle -q  ;;# left click, pause/unpause
	2) mpc prev -q;;# middle click previous
	3) mpc next -q;;# right click next
esac

echo "$(mpc status|filter)"
