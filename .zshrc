# Powerlevel10k instant prompt
# ======================================

# Must stay near the top.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Powerlevel10k theme
# ======================================

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Autocomplete
# ======================================

autoload -U compinit
compinit

# Case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


# Automatically quote pasted URLs
# ======================================

autoload -U bracketed-paste-magic
autoload -U url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic


# Key bindings
# ======================================

# Default emacs bindings
bindkey -e

# Home
bindkey "^[[H" beginning-of-line
# End
bindkey "^[[F" end-of-line
# Delete
bindkey "^[[3~" delete-char
# Ctrl + Delete
bindkey "^[[3;5~" delete-word
# Ctrl + Backspace
bindkey "^H" backward-delete-word
# Ctrl + Left arrow
bindkey "^[[1;5D" vi-backward-blank-word
# Ctrl + Right arrow
bindkey "^[[1;5C" vi-forward-blank-word

# Aliases
# ======================================

alias ls="ls --color=auto"
alias ll="ls -lh"
alias lt="ll -tr"
alias la="ll -A"
alias exan="exa -l -snew"
alias df="df -h"
alias free="free -h"
alias grep="grep --color=auto"
alias history="fc -li"
alias ssh="TERM=xterm ssh"
alias ip="ip --color"
alias vim="nvim"
alias g="git"
alias k="kubectl"

# History
# ======================================

HISTSIZE=100000000
SAVEHIST=100000000
HISTFILE=$HOME/.zsh_history

setopt append_history
setopt share_history
setopt inc_append_history
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify


# Misc scripts
# ======================================

. "$HOME/.local/bin/wt";

ytmusic() {
    mpv --ytdl --ytdl-format=bestaudio --no-video "ytdl://ytsearch1:$1" "${@:2}"
}

codeclimate() {
	docker run -it --rm -e CODECLIMATE_CODE="$PWD" -v "$PWD":/code -v /run/user/1000/docker.sock:/var/run/docker.sock -v /tmp/cc:/tmp/cc codeclimate/codeclimate "$@"
}

# Init pyenv (part 2)
eval "$(pyenv init -)"

# Init nodenv
eval "$(nodenv init -)"

