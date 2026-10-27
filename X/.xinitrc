if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap -option ctrl:nocaps
xmodmap ~/.Xmodmap

[ -f ~/.monitor.local ] && . ~/.monitor.local

unclutter &
exec i3
