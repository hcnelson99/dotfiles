if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrdb ~/.Xresources
xmodmap ~/.Xmodmap
setxkbmap -option ctrl:nocaps


unclutter &
exec startxfce4
