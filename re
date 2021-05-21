#! /bin/sh
runner \
	`sed -n 1p /tmp/vim.dat` \
	`sed -n 2p /tmp/vim.dat` \
	`sed -n 3p /tmp/vim.dat` \
	`sed -n 4p /tmp/vim.dat`
