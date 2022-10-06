#!/bin/sh

out=$(mpc status)
name=$(echo "${out#*/}" | head -n 1| sed "s/[.].*//;")
simbol=$(echo "$out"| grep paused | sed "s/\\[paused\\].*/⏸/g" )

case $BUTTON in
	1) mpc toggle -q  ;;# left click, pause/unpause
	2) mpc prev -q;;# middle click previous
	3) mpc next -q;;# right click next
esac

echo $name $simbol
