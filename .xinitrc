#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


# Set keyboard layout, map caps lock to ctrl, map simultaneous shift to caps
setxkbmap br -option ctrl:nocaps -option shift:both_capslock

# Disable scroll lock
xmodmap -e 'keycode 78='

# Activate screensaver after 30 minutes
xset s 1800

## 75Hz
xrandr --newmode "1920x1080_75.00_rb2"  167.85  1920 1928 1960 2000  1080 1105 1113 1119 +hsync -vsync
xrandr --addmode DisplayPort-0 "1920x1080_75.00_rb2"
xrandr --output DisplayPort-0 --primary --mode "1920x1080_75.00_rb2" --pos 0x0

## Second display positioning
xrandr --output DVI-D-0 --mode 1440x900 --pos 1920x180

# No tearing please
xrandr --output DVI-D-0 --set TearFree on

# Start ssh-agent
eval $(ssh-agent)

# Start the window manager!
exec i3

