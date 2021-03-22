;; -*- mode: emacs-lisp; lexical-binding: t -*-

;; Read the maximum line length for whitespace mode from editorconfig
(defun editorconfig/whitespace (length)
	(setq whitespace-line-column fill-column)
)

(advice-add 'editorconfig-set-line-length :after #'editorconfig/whitespace)
