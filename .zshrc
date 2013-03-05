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

# ls
case `uname -s` in
'Darwin'| 'FreeBSD')
	export LSCOLORS=exfxcxdxbxegedabagacad
	alias ls='ls -F -G'
	;;
'Linux')
	alias ls='ls -F --color=auto'
	eval `dircolors ~/.dircolors`
	;;
esac

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

# Terminal
_terms=(rxvt rxvt-unicode vt102 vt220 xterm-color xterm-256color)
for term in $_terms; do
	alias term_${term}='eval `tset -s -I -Q '${term}'`'
done

alias ssh='TERM=xterm-color ssh'

# Colorful completion listings
zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

if [[ -e `which keychain` ]]; then
	eval `keychain -q -Q --nogui --eval id_rsa`
fi

# tmux
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
