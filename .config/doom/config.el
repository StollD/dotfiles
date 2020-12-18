;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Dorian Stoll")
(setq user-mail-address "dorian.stoll@tmsp.io")

(setq doom-theme 'doom-vibrant)
(setq doom-font (font-spec :family "Fira Code" :size 13 :weight 'semi-light))

(setq display-line-numbers-type t)
(setq-default show-trailing-whitespace t)
(setq-default indent-tabs-mode t)

(require 'whitespace)
(setq whitespace-style '(face trailing tabs spaces
				lines-tail empty indentation
				space-after-tab space-before-tab))
(global-whitespace-mode t)
(global-display-line-numbers-mode)

(cua-mode t)
(transient-mark-mode 1)
(setq cua-auto-tabify-rectangles nil)
(setq cua-keep-region-after-copy t)

(c-add-style "linux-custom"
	'("linux"
		 (c-offsets-alist
			 (arglist-cont-nonempty . ++))))

(setq c-default-style "linux-custom")
