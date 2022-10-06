cpu_shape=$(python3 xsetroot.py cpu)
mem_shape=$(python3 xsetroot.py mem)
date=$(date +%I:%M)
nettraf=$(sh nettraf.sh)
music=$(sh music.sh)
null=$(printf "\x08")
music_man=$(printf "\x03")
lowMus=$(printf "\x06")
incMus=$(printf "\x07")
vol=$(printf "\x02")
#2 es el widget de vol
#3 es el estatus y manipulador de musica 
#6 es aumentar vol "🔊"
#7 es disminuir vol "🔉"
#8 es null
xsetroot -name "$null [$cpu_shape] [$mem_shape] [$nettraf] $music_man[$music] $incMus🔊[$vol Vol ]🔉$lowMus [$date]"
