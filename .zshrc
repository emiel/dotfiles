# Completion
autoload -Uz compinit && compinit

# Prompt
autoload -U promptinit && promptinit
prompt suse

# History
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000

setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Misc
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt NO_BEEP

# Vi editing
bindkey -v

# File rename magick
bindkey '^[m' copy-prev-shell-word

# Aliases 
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias rm='nocorrect rm'

if ls -F --color=auto >&/dev/null; then
  alias ls='ls --color=auto -F'
else
  alias ls='ls -F -G'
fi
alias l.='ls -d .[^.]*'
alias ll='ls -l'
alias ll.='ls -l -d .[^.]*'
alias lsd='ls -ld *(-/DN)'

alias md='mkdir -p'
alias rd='rmdir'

alias po='popd'
alias pu='pushd'

alias cp='cp -v -i'
alias mkdir='mkdir -v'
alias mv='mv -v -i'
alias rm='rm -v -i'

alias v='vim'

alias vt220='export TERM=vt220; tset -I -Q'
alias vt102='export TERM=vt102; tset -I -Q'
alias wsvt25='export TERM=wsvt25; tset -I -Q'
alias pcvt25='export TERM=pcvt25; tset -I -Q'
alias xterm256='export TERM=xterm-256color; tset -I -Q'
alias xtermcolor='export TERM=xterm-color; tset -I -Q'

eval `dircolors ~/.dircolors`

# Colorful completion listings
zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

if [ "$TERM" != "dumb" ]; then
	export LS_OPTIONS="--color=auto"
	#export LS_OPTIONS="-F -G"
fi

eval `keychain -q -Q --nogui --eval id_rsa`

# tmux
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
