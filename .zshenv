export PATH="${PATH}:${HOME}/bin"

export EDITOR="vim"
export MAILDIR="${HOME}/Maildir"
export PAGER="less -R"

# virtualenvwrapper
export WORKON_HOME=~/envs


# GNUPG
#eval `gpg-agent --daemon`
#
#if [ -f "${HOME}/.gpg-agent-info" ]; then
#      . "${HOME}/.gpg-agent-info"
#      export GPG_AGENT_INFO
#      export SSH_AUTH_SOCK
#      export SSH_AGENT_PID
#fi
#
#export GPG_TTY=`tty`
