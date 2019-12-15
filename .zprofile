export EDITOR=vim
export BROWSER=firefox

# Make npm install global packages in the home directory
export npm_config_prefix=$HOME/.node_modules

# Start Xorg on tty1
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

