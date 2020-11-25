;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Dorian Stoll")
(setq user-mail-address "dorian.stoll@tmsp.io")

(load! "local.el")

(setq display-line-numbers-type t)
(setq-default show-trailing-whitespace t)
(setq-default indent-tabs-mode t)

(cua-mode t)
(transient-mark-mode 1)
(setq cua-auto-tabify-rectangles nil)
(setq cua-keep-region-after-copy t)

(c-add-style "linux-custom"
	'("linux"
		 (c-offsets-alist
			 (arglist-cont-nonempty . ++))))

(setq c-default-style "linux-custom")
