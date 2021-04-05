;; -*- mode: emacs-lisp; lexical-binding: t -*-

(require 'whitespace)
(setq whitespace-style '(
	face
	empty
	indentation
	lines-tail
	space-after-tab
	space-before-tab
	trailing))

(global-whitespace-mode t)
(global-display-fill-column-indicator-mode t)

;; Read the maximum line length for whitespace mode from editorconfig
(advice-add 'editorconfig-set-line-length :after '(lambda (length)
	(setq whitespace-line-column fill-column)
))
