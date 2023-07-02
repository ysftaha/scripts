#!/usr/bin/sh
command git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs 
command ~/.config/emacs/bin/doom install -!
