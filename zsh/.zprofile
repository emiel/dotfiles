#
# All things $PATH or $path related go here. See
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
path=(/usr/local/bin $path)

# Homebrew: ImageMagick full
path=("$HOMEBREW_PREFIX/opt/imagemagick-full/bin" $path)

# Homebrew: ffmpeg-full
path=("$HOMEBREW_PREFIX/opt/ffmpeg-full/bin" $path)

# Homebrew: OpenJDK
path=("$HOMEBREW_PREFIX/Cellar/openjdk@21/21.0.8/bin" $path)

# Homebrew: postgres
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@18/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@18/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@18/lib/pkgconfig"

# Homebrew: mysql
# export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
# export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.0/include"
# export LDFLAGS="-L/opt/homebrew/opt/mysql@8.0/lib"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql@8.0/lib/pkgconfig"
