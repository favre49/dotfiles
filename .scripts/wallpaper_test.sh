src="/run/media/favre49/WinData/Downloads/DC/Wallpapers/Untested/*"
dest="/run/media/favre49/WinData/Downloads/DC/Wallpapers/Validated"

IFS=$'\n'

for f in $src
do
    feh --bg-scale $f
    while true; do
        read -r input
        case $input in
            m ) mv $f $dest; break;;
            d ) rm $f; break;;
        esac
    done
done

feh --bg-scale /home/favre49/Downloads/wallpaper.jpeg
