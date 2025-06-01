DOTFILES = $(shell pwd)

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

ensure_config:
	mkdir -p $(HOME)/.config

install-flake8: ensure_config
	rm -f $(HOME)/.config/flake8
	ln -s $(DOTFILES)/flake8/flake8 $(HOME)/.config/flake8

install-gdb:
	rm -f $(HOME)/.gdbinit
	ln -s $(DOTFILES)/gdb/gdbinit $(HOME)/.gdbinit

install-ghci:
	rm -f $(HOME)/.ghci
	ln -s $(DOTFILES)/ghci/ghci $(HOME)/.ghci

install-git: ensure_config
	rm -f $(HOME)/.config/git
	ln -s $(DOTFILES)/git $(HOME)/.config/git

install-i3:
	rm -f $(HOME)/.i3
	ln -s $(DOTFILES)/i3 $(HOME)/.i3

install-i3status:
	rm -f $(HOME)/.i3status.conf
	ln -s $(DOTFILES)/i3status/i3status.conf $(HOME)/.i3status.conf

install-mutt:
	rm -f $(HOME)/.mutt
	ln -s $(DOTFILES)/mutt $(HOME)/.mutt

install-npm:
	rm -f $(HOME)/.npmrc
	ln -s $(DOTFILES)/npm/npmrc $(HOME)/.npmrc

install-nvim:
	rm -f $(HOME)/.config/nvim
	ln -s $(DOTFILES)/nvim $(HOME)/.config/nvim

install-psql:
	rm -f $(HOME)/.psqlrc
	ln -s $(DOTFILES)/psql/psqlrc $(HOME)/.psqlrc

install-tmux:
	rm -f $(HOME)/.tmux.conf
	ln -s $(DOTFILES)/tmux/tmux.conf $(HOME)/.tmux.conf

install-vim:
	git submodule update --init
	rm -f $(HOME)/.vim
	ln -s $(DOTFILES)/vim $(HOME)/.vim

install-x11:
	rm -f $(HOME)/.xinitrc $(HOME)/.Xresources $(HOME)/.Xresources.d
	ln -s $(DOTFILES)/x11/xinitrc $(HOME)/.xinitrc
	ln -s $(DOTFILES)/x11/Xresources $(HOME)/.Xresources
	ln -s $(DOTFILES)/x11/Xresources.d $(HOME)/.Xresources.d

install-zsh:
	rm -f $(HOME)/.zshenv
	echo 'ZDOTDIR=$(DOTFILES)/zsh' >> $(HOME)/.zshenv
	echo 'source $$ZDOTDIR/.zshenv' >> $(HOME)/.zshenv
	# ln -s $(DOTFILES)/zsh/.zshenv $(HOME)/.zshenv
	# ln -s $(DOTFILES)/zsh/.zshrc $(HOME)/.zshrc
	# ln -s $(DOTFILES)/zsh/.zlogout $(HOME)/.zlogout

update-home-manager:
	home-manager --flake $(CURDIR) switch

brew-bundle-dump:
	brew bundle dump --force --file=$(CURDIR)/Brewfile

brew-bundle-install:
	brew bundle install
