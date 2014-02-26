install: \
	install-gdb \
	install-git \
	install-i3 \
	install-psql \
	install-tmux \
	install-vim \
	install-x11 \
	install-zsh

install-gdb:
	rm -f $(HOME)/.gdbinit
	ln -s `pwd`/gdb/gdbinit $(HOME)/.gdbinit

install-git:
	rm -f $(HOME)/.gitconfig
	ln -s `pwd`/git/gitconfig $(HOME)/.gitconfig

install-i3:
	rm -rf $(HOME)/.i3
	ln -s `pwd`/i3 $(HOME)/.i3

install-psql:
	rm -f $(HOME)/.psqlrc*
	ln -s `pwd`/psql/psqlrc $(HOME)/.psqlrc
	ln -s `pwd`/psql/psqlrc-9.2 $(HOME)/.psqlrc-9.2
	ln -s `pwd`/psql/psqlrc-9.3 $(HOME)/.psqlrc-9.3

install-tmux:
	rm -f $(HOME)/.tmux.conf
	ln -s `pwd`/tmux/tmux.conf $(HOME)/.tmux.conf

install-vim:
	git submodule update --init
	rm -rf $(HOME)/.vim $(HOME)/.vimrc
	ln -s `pwd`/vim $(HOME)/.vim
	ln -s $(HOME)/.vim/vimrc $(HOME)/.vimrc

install-x11:
	rm -f $(HOME)/.xinitrc $(HOME)/.Xresources
	ln -s `pwd`/x11/xinitrc $(HOME)/.xinitrc
	ln -s `pwd`/x11/Xresources $(HOME)/.Xresources

install-zsh:
	rm -f $(HOME)/.zlogout $(HOME)/.zshenv $(HOME)/.zshrc
	ln -s `pwd`/zsh/zlogout $(HOME)/.zlogout
	ln -s `pwd`/zsh/zshenv $(HOME)/.zshenv
	ln -s `pwd`/zsh/zshrc $(HOME)/.zshrc