# Ensure unique manpath, path items
typeset -U MANPATH manpath PATH path

# General
export EDITOR="vim"
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export MAILDIR="${HOME}/Maildir"
export PAGER="less -R"

# NPM
NPM_PACKAGES=${HOME}/.npm-packages
path=(${NPM_PACKAGES}/bin $path)
manpath=(${NPM_PACKAGES}/share/man $manpath)

# Homebrew (postgres)
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@16/lib/pkgconfig"

# Homebrew (mysql)
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/mysql@8.0/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.0/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql@8.0/lib/pkgconfig"
