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

# Setup Homebrew:
#  - environment (PATH, HOMEBREW_PREFIX, etc.)
#  - Invokes /usr/libexec/path_helper -s
#  - zsh completions (from Homebrew zsh)
if [[ -x "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#
# All things $PATH or $path related go here. See:
# https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2
#
# Debug:
#
# $ echo $PATH | tr ':' '\n'
# $ print -l $path
#

# Ensure unique items
typeset -U MANPATH manpath
typeset -U PATH path

# My bin
path=(~/bin $path)

# Cargo
path=(~/.cargo/bin $path)

# NPM
NPM_PACKAGES=${HOME}/.npm-packages
path=(${NPM_PACKAGES}/bin $path)
manpath=(${NPM_PACKAGES}/share/man $manpath)

# Docker Desktop / kubernetes; must come before $HOMEBREW_PREFIX/bin to ensure
# kubectl is picked up from docker desktop.
# path=(/usr/local/bin $path)
#
# Homebrew: orbstack
path=(~/.orbstack/bin $path)

# Homebrew: imagemagick-full
path=("$HOMEBREW_PREFIX/opt/imagemagick-full/bin" $path)

# Homebrew: ffmpeg-full
path=("$HOMEBREW_PREFIX/opt/ffmpeg-full/bin" $path)

# Homebrew: OpenJDK
path=("$HOMEBREW_PREFIX/Cellar/openjdk@21/21.0.8/bin" $path)

# Homebrew: postgres
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"

#
# zsh functions
#

# fpath additions — Homebrew completions + your own functions
# Must come before compinit
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
alias view='nvim -N -R'
alias vim='nvim -N'
alias nvim='nvim -N'

alias k='kubectl'
alias mr='NO_COLOR=true mise run'
alias pgpp='pgpp --semicolon-after-last-statement --preserve-comments'
alias rg='rg --smart-case'
alias tf='terraform'
alias tm='terramate'

alias zconf='${EDITOR} $ZDOTDIR/.zshrc'

# git
# fo() {
#     git branch --no-color --sort=-committerdate --format='%(refname:short)' | fzf --header 'git checkout' | xargs git checkout
# }

# myprs() {
#     gh pr list --author "@me" | fzf --header 'checkout PR' | awk '{print $(NF-5)}' | xargs git checkout
# }

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

# Vim
alias e_vim='${EDITOR} ~/.vim/vimrc'
alias e_nvim='pushd ~/.config/nvim && ${EDITOR} . && popd'

# Zsh
alias e_zsh='${EDITOR} $ZDOTDIR/.zshrc'

# Captain's Log
alias cl='${EDITOR} $(cd ~/Projects/captains-log && ./main.py ~/Documents/captains-log)'

# Homebrew
alias bubu='brew update && brew upgrade --no-ask && brew cleanup'

##
## Named directories
##

hash -d blog=~/Projects/blog
hash -d dotfiles=~/Projects/dotfiles

##
## Completion
##

# kubectl completion
if command -v kubectl > /dev/null 2>&1; then
    eval "$(kubectl completion zsh)"
else
    echo "Skipping kubectl zsh completion setup"
fi

# AWS CLI completion
complete -C '/opt/homebrew/bin/aws_completer' aws

# tenv completion
if [[ -f $HOME/.tenv.completion.zsh ]]; then
    source $HOME/.tenv.completion.zsh
else
    echo "Skipping tenv zsh completion setup"
fi

# Terraform CLI completion
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Jujutsu CLI completion
if command -v jj > /dev/null 2>&1; then
    source <(jj util completion zsh)
else
    echo "Skipping jj zsh completion setup"
fi

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

###-begin-opencode-completions-###
#
# yargs command completion script
#
# Installation: opencode completion >> ~/.zshrc
#    or opencode completion >> ~/.zprofile on OSX.
#
_opencode_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" opencode --get-yargs-completions "${words[@]}"))
  IFS=$si
  if [[ ${#reply} -gt 0 ]]; then
    _describe 'values' reply
  else
    _default
  fi
}
if [[ "'${zsh_eval_context[-1]}" == "loadautofunc" ]]; then
  _opencode_yargs_completions "$@"
else
  compdef _opencode_yargs_completions opencode
fi
###-end-opencode-completions-###

# worktrunk completion
if command -v wt > /dev/null 2>&1; then
    eval "$(command wt config shell init zsh)"
else
    echo "Skipping wt zsh completion setup"
fi

# FZF
if command -v fzf > /dev/null 2>&1; then
    source <(fzf --zsh)
else
    echo "Skipping fzf setup"
fi

# mise
if command -v mise > /dev/null 2>&1; then
    eval "$(mise activate zsh)"
else
    echo "Skipping mise setup"
fi

# Custom zsh setup (secrects)
if [[ -f ${ZDOTDIR}/.secrets.zsh ]]; then
    source ${ZDOTDIR}/.secrets.zsh
fi

# Custom zsh setup (work)
if [[ -f ${ZDOTDIR}/.smartpr.zsh ]]; then
    source ${ZDOTDIR}/.smartpr.zsh
fi
