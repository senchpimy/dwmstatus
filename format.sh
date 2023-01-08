cpu_shape=$(python3 xsetroot.py cpu)
mem_shape=$(python3 xsetroot.py mem)
date=$(date +%I:%M)
music=$(sh music.sh)
nettraf=$(sh nettraf.sh)
#vol=$(printf "\x01")
#music_man=$(printf "\x02")
#incMus=$(printf "\x03")
#lowMus=$(printf "\x04")
#cale=$(printf "\x05")
#null=$(printf "\x06")
#2 es el widget de vol
#3 es el estatus y manipulador de musica 
#6 es aumentar vol "🔊"
#7 es disminuir vol "🔉"
#8 es null
xsetroot -name "$(printf '\x02') [ $music$(printf '\x03') ]$(printf '\x01') 🔊[ V$(printf '\x04')ol ]🔉$(printf '\x05') [$date]$(printf '\x06') [$cpu_shape] [$mem_shape] [$nettraf] "
#echo "$null [$cpu_shape] [$mem_shape] [$nettraf] $music_man[$music] $incMus🔊[$vol Vol ]🔉$lowMus [$date]"
