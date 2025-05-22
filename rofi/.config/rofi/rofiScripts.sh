ANSWER=$(echo "wallpaper\nmusic\npolybar" | rofi -dmenu)

case $ANSWER in
	"wallpaper")
	wal -i ~/Wallpaper
	;;
	"music")
	vlc ~/Music --random &
	;;
	"polybar")
	polybar --config=~/.config/polybar/config.ini &
	;;
esac
