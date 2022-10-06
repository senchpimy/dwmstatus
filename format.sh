cpu_shape=$(python3 xsetroot.py cpu)
echo cpu_shape
mem_shape=$(python3 xsetroot.py mem)
echo mem_shape
date=$(date +%I:%M)
echo date
music=$(sh music.sh)
echo music
nettraf=$(sh nettraf.sh)
echo nettraf
echo funcs
vol=$(printf "\x01")
music_man=$(printf "\x02")
incMus=$(printf "\x03")
lowMus=$(printf "\x04")
null=$(printf "\x05")
#2 es el widget de vol
#3 es el estatus y manipulador de musica 
#6 es aumentar vol "🔊"
#7 es disminuir vol "🔉"
#8 es null
xsetroot -name "$(printf '\x02')[$music] $(printf '\x03')🔊[$(printf '\x01') Vol ]$(printf '\x04')🔉 $(printf '\x05') [$date]$(printf '\x05') [$cpu_shape] [$mem_shape] [$nettraf] "
#echo "$null [$cpu_shape] [$mem_shape] [$nettraf] $music_man[$music] $incMus🔊[$vol Vol ]🔉$lowMus [$date]"
