# Completion
autoload -Uz compinit && compinit

# Prompt
autoload -U promptinit && promptinit
prompt walters

# History
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000

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

## vi editing
bindkey -v

## file rename magick
bindkey '^[m' copy-prev-shell-word

# Aliases 
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'

if ls -F --color=auto >&/dev/null; then
  alias ls='ls --color=auto -F'
else
  alias ls='ls -F -G'
fi
alias ll='ls -l'
alias l.='ls -d .[^.]*'
alias lsd='ls -ld *(-/DN)'

alias md='mkdir -p'
alias rd='rmdir'

alias cd..='cd ..'
alias ..='cd ..'
alias po='popd'
alias pu='pushd'

alias cp='cp -v -i'
alias mv='mv -v -i'
alias rm='rm -v -i'

alias v='vim'

alias vt220='export TERM=vt220; tset -I -Q'
alias vt102='export TERM=vt102; tset -I -Q'
alias wsvt25='export TERM=wsvt25; tset -I -Q'
alias pcvt25='export TERM=pcvt25; tset -I -Q'
alias xterm256='export TERM=xterm-256color; tset -I -Q'
alias xtermcolor='export TERM=xterm-color; tset -I -Q'
