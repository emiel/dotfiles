##
## PARAMETERS (zshparam)
##

export HISTFILE=~/.zhistory
export HISTSIZE=12000
export SAVEHIST=10000

##
## OPTIONS (zshoptions)
##

# Changing directories
setopt AUTO_CD
setopt CDABLE_VARS
setopt CD_SILENT

# Expansion and Globbing
setopt EXTENDED_GLOB

# History
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY

# Command prompt
setopt PROMPT_SUBST

# Include git branch name in prompt
autoload -Uz vcs_info
precmd_functions+=( vcs_info )
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '[%b]%m'
zstyle ':vcs_info:git:*' actionformats '[%b|%a]'

PROMPT='%n@%m:%~/ %F{32}${vcs_info_msg_0_}%f> '

# Search for my functions (must come before `compinit`).
fpath=($ZDOTDIR/functions $fpath)

##
## Completion
##

# The following is needed for AWS CLI (and Terraform) completion
autoload -U +X bashcompinit && bashcompinit

autoload -Uz compinit
compinit

# Zle
unsetopt BEEP

##
## ZLE (zshzle)
##

# Vi editing
bindkey -v

bindkey '^[m' copy-prev-shell-word # File rename magick
bindkey '^r' history-incremental-search-backward

bindkey -M viins "^[[1~" vi-beginning-of-line   # Home
bindkey -M viins "^[[4~" vi-end-of-line         # End
bindkey -M viins '^[[2~' beep                   # Insert
bindkey -M viins '^[[3~' delete-char            # Del
bindkey -M viins '^[[5~' vi-backward-blank-word # Page Up
bindkey -M viins '^[[6~' vi-forward-blank-word  # Page Down

##
## Aliases
##

alias cp='nocorrect cp -v -i'
alias mkdir='nocorrect mkdir -v'
alias mv='nocorrect mv -v -i'
alias rm='nocorrect rm -v -i'

alias bc='bc -l'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias ssh='TERM=xterm-color ssh'
alias view='vim -N -R'
alias vim='vim -N'

alias d='docker'
alias k='kubectl'
alias mr='mise run'
alias pgpp='pgpp --semicolon-after-last-statement --preserve-comments'
alias rg='rg --smart-case'
alias tf='terraform'
alias tm='terramate'

alias zconf='vim $ZDOTDIR/.zshrc'

# git
# fo() {
#     git branch --no-color --sort=-committerdate --format='%(refname:short)' | fzf --header 'git checkout' | xargs git checkout
# }

# myprs() {
#     gh pr list --author "@me" | fzf --header 'checkout PR' | awk '{print $(NF-5)}' | xargs git checkout
# }

##
## Named directories
##

hash -d blog=~/Projects/blog
hash -d dotfiles=~/Projects/dotfiles

# ls
case $(uname -s) in
'Darwin' | 'FreeBSD')
    export LSCOLORS=exfxcxdxbxegedabagacad
    alias ls='ls -F -G'
    ;;
'Linux')
    alias ls='ls -F --color=auto'
    eval "$(dircolors ~/.dircolors)"
    ;;
esac

alias l.='ls -d .[^.]*'
alias ll.='ls -l -d .[^.]*'
alias ll='ls -l'
alias lsd='ls -ld *(-/DN)'

# Python virtualenv
alias venv='python3 -m venv .venv && . ./.venv/bin/activate && pip install --upgrade pip -q'
alias venv310='python3.10 -m venv .venv && . ./.venv/bin/activate'

# My logbook
function lb() {
    local lbdir=~/logbook
    [[ ! -d $lbdir ]] && mkdir $lbdir
    vim "$lbdir/$(date '+%Y')/$(date '+%Yw%V').md"
}

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
alias bubu='brew update && brew upgrade && brew cleanup'

# Docker Desktop / kubernetes; must come after brew path to ensure kubectl is picked up from docker desktop
path=(/usr/local/bin $path)

# kubectl completion
eval "$(kubectl completion zsh)"

# AWS CLI completion
complete -C '/opt/homebrew/bin/aws_completer' aws

# tenv completion
source $HOME/.tenv.completion.zsh

# Terraform CLI completion
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/emiel/.opam/opam-init/init.zsh' ]] || source '/Users/emiel/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

# Completion for pnpm (pnpm completion zsh)
if type compdef &>/dev/null; then
  _pnpm_completion () {
    local reply
    local si=$IFS

    IFS=$'\n' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" SHELL=zsh pnpm completion-server -- "${words[@]}"))
    IFS=$si

    if [ "$reply" = "__tabtab_complete_files__" ]; then
      _files
    else
      _describe 'values' reply
    fi
  }
  compdef _pnpm_completion pnpm
fi

# FZF
source <(fzf --zsh)

# mise
eval "$(mise activate zsh)"

source ${ZDOTDIR}/.secrets.zsh
source ${ZDOTDIR}/.smartpr.zsh

# OpenJDK
export PATH="/opt/homebrew/Cellar/openjdk@21/21.0.8/bin:$PATH"
