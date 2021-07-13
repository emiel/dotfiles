install: \
	install-flake8 \
	install-gdb \
	install-ghci \
	install-git \
	install-i3 \
	install-i3status \
	install-mutt \
	install-npm \
	install-psql \
	install-tmux \
	install-vim \
	install-x11 \
	install-zsh

install-flake8:
	rm -f $(HOME)/.config/flake8
	mkdir -p $(HOME)/.config
	ln -s `pwd`/flake8/flake8 $(HOME)/.config/flake8

install-gdb:
	rm -f $(HOME)/.gdbinit
	ln -s `pwd`/gdb/gdbinit $(HOME)/.gdbinit

install-ghci:
	rm -f $(HOME)/.ghci
	ln -s `pwd`/ghci/ghci $(HOME)/.ghci

install-git:
	rm -f $(HOME)/.gitconfig
	ln -s `pwd`/git/gitconfig $(HOME)/.gitconfig

install-i3:
	rm -rf $(HOME)/.i3
	ln -s `pwd`/i3 $(HOME)/.i3

install-i3status:
	rm -f $(HOME)/.i3status.conf
	ln -s `pwd`/i3status/i3status.conf $(HOME)/.i3status.conf

install-mutt:
	rm -rf $(HOME)/.mutt
	ln -s `pwd`/mutt $(HOME)/.mutt

install-npm:
	rm -f $(HOME)/.npmrc
	ln -s `pwd`/npm/npmrc $(HOME)/.npmrc

install-psql:
	rm -f $(HOME)/.psqlrc
	ln -s `pwd`/psql/psqlrc $(HOME)/.psqlrc

install-tmux:
	rm -f $(HOME)/.tmux.conf
	ln -s `pwd`/tmux/tmux.conf $(HOME)/.tmux.conf

install-vim:
	git submodule update --init
	rm -rf $(HOME)/.vim
	ln -s `pwd`/vim $(HOME)/.vim

install-x11:
	rm -f $(HOME)/.xinitrc $(HOME)/.Xresources $(HOME)/.Xresources.d
	ln -s `pwd`/x11/xinitrc $(HOME)/.xinitrc
	ln -s `pwd`/x11/Xresources $(HOME)/.Xresources
	ln -s `pwd`/x11/Xresources.d $(HOME)/.Xresources.d

install-zsh:
	rm -f $(HOME)/.zlogout $(HOME)/.zshenv $(HOME)/.zshrc
	ln -s `pwd`/zsh/zlogout $(HOME)/.zlogout
	ln -s `pwd`/zsh/zshenv $(HOME)/.zshenv
	ln -s `pwd`/zsh/zshrc $(HOME)/.zshrc
