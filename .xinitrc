setxkbmap -option caps:escape
xset r rate 250 30
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec dbus-launch i3
