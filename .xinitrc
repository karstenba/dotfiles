setxkbmap -option caps:escape
xinput --set-prop "$(xinput | grep "TPPS/2 Elan TrackPoint" | tr -s "\t" " " | cut -d " " -f 6 | cut -d "=" -f 2)" "libinput Accel Speed" 1
xset r rate 250 30
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec dbus-launch i3
