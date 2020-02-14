export EDITOR=vim
export BROWSER=firefox
export SDL_GAMECONTROLLERCONFIG="030000005e040000ea02000001030000,Xbox One Wireless Controller (Model 1708),a:b0,b:b1,back:b6,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b10,righttrigger:a5,rightx:a3,righty:a4,start:b7,x:b2,y:b3,"

# Make npm install global packages in the home directory
export npm_config_prefix=$HOME/.node_modules

# Start Xorg on tty1
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

