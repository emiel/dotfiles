install: \
	install-gdb \
	install-ghci \
	install-i3 \
	install-i3status \
	install-psql \
	install-tmux \
	install-urxvt \
	install-vim \
	install-x11 \
	install-zsh

install-gdb:
	rm -f $(HOME)/.gdbinit
	ln -s `pwd`/gdb/gdbinit $(HOME)/.gdbinit

install-ghci:
	rm -f $(HOME)/.ghci
	ln -s `pwd`/ghci/ghci $(HOME)/.ghci

install-git:
	rm -f $(HOME)/.gitconfig
	cp `pwd`/git/gitconfig $(HOME)/.gitconfig

install-i3:
	rm -rf $(HOME)/.i3
	ln -s `pwd`/i3 $(HOME)/.i3

install-i3status:
	rm -f $(HOME)/.i3status.conf
	ln -s `pwd`/i3status/i3status.conf $(HOME)/.i3status.conf

install-mutt:
	rm -rf $(HOME)/.mutt
	ln -s `pwd`/mutt $(HOME)/.mutt

install-psql:
	rm -f $(HOME)/.psqlrc*
	ln -s `pwd`/psql/psqlrc $(HOME)/.psqlrc
	ln -s `pwd`/psql/psqlrc-9.2 $(HOME)/.psqlrc-9.2
	ln -s `pwd`/psql/psqlrc-9.3 $(HOME)/.psqlrc-9.3
	ln -s `pwd`/psql/psqlrc-9.4 $(HOME)/.psqlrc-9.4

install-subversion:
	rm -f $(HOME)/.subversion/config
	ln -s `pwd`/subversion/config $(HOME)/.subversion/config

install-tmux:
	rm -f $(HOME)/.tmux.conf
	ln -s `pwd`/tmux/tmux.conf $(HOME)/.tmux.conf

install-urxvt:
	rm -f $(HOME)/.urxvt
	ln -s `pwd`/urxvt $(HOME)/.urxvt

install-vim:
	git submodule update --init
	rm -rf $(HOME)/.vim $(HOME)/.vimrc
	ln -s `pwd`/vim $(HOME)/.vim
	ln -s `pwd`/vim/vimrc $(HOME)/.vimrc

install-x11:
	rm -f $(HOME)/.xinitrc $(HOME)/.Xresources
	ln -s `pwd`/x11/xinitrc $(HOME)/.xinitrc
	ln -s `pwd`/x11/Xresources $(HOME)/.Xresources
	xrdb $(HOME)/.Xresources

install-zsh:
	rm -f $(HOME)/.zlogout $(HOME)/.zshenv $(HOME)/.zshrc
	ln -s `pwd`/zsh/zlogout $(HOME)/.zlogout
	ln -s `pwd`/zsh/zshenv $(HOME)/.zshenv
	ln -s `pwd`/zsh/zshrc $(HOME)/.zshrc
