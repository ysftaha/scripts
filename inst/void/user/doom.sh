#!/usr/bin/sh
command git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs 
command ~/.config/emacs/bin/doom install -! -v
command emacs -nw --kill -f nerd-icons-install-fonts
command emacs -nw --kill -f plantuml-download-jar
