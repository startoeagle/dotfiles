setup-bin: 
	ln -s $(PWD)/bin/* ~/.local/bin/
setup-fzf: 
	./setup-fzf.sh
setup-tmux: tmux/tmux.conf tmux/setup.sh
	./tmux/setup.sh
