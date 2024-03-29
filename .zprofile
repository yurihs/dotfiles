export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export SDL_GAMECONTROLLERCONFIG="030000005e040000ea02000001030000,Xbox One Wireless Controller (Model 1708),a:b0,b:b1,back:b6,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b8,leftshoulder:b4,leftstick:b9,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b10,righttrigger:a5,rightx:a3,righty:a4,start:b7,x:b2,y:b3,"
export ANDROID_HOME=$HOME/Android/Sdk

# For Yubikey PIN
export SSH_ASKPASS=/usr/lib/seahorse/ssh-askpass

# Disable transient symbols for compose and dead keys in GTK programs
# export GTK_IM_MODULE=xim

# rootless docker
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/docker.sock"

# Make npm install global packages in the home directory
export npm_config_prefix=$HOME/.node_modules

# For Flutter
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

# Init pyenv (part 1)
eval "$(pyenv init --path)"

# Start Xorg on tty1
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

