#!/usr/bin/sh
command git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs 
command ~/.config/emacs/bin/doom install -!
command emacs -nw --kill -f all-the-icons-install-fonts
command emacs -nw --kill -f nerd-icons-install-fonts
