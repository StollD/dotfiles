;; -*- mode: emacs-lisp; lexical-binding: t -*-

(defun dotspacemacs/user-layers ()
	(setq-default dotspacemacs-configuration-layers '(
		auto-completion
		colors
		dap
		git
		ivy
		lsp
		org
		syntax-checking
		tabs
		themes-megapack
		version-control

		(treemacs :variables
			treemacs-use-git-mode 'extended)

		(c-c++ :variables
			c-c++-backend 'lsp-ccls
			c-c++-enable-clang-support t
			c-c++-enable-clang-format-on-save t
			c-c++-adopt-subprojects t)

		(go :variables
			go-backend 'lsp
			go-format-before-save t
			go-tab-width nil)

		emacs-lisp
		json
		markdown
		meson
		shell-scripts
		systemd
		yaml))

	(setq-default dotspacemacs-additional-packages '(olivetti))
)

(advice-add 'dotspacemacs/layers :after #'dotspacemacs/user-layers)

(defun dotspacemacs/user-init ()
	(setq-default
		dotspacemacs-themes '(doom-Iosvkem)
		dotspacemacs-mode-line-theme '(spacemacs :separator arrow)
		dotspacemacs-scratch-buffer-persistent t
		dotspacemacs-line-numbers t)

	(setq-default
		doom-Iosvkem-brighter-comments t
		doom-Iosvkem-comment-bg t
		doom-Iosvkem-padded-modeline t)

	;; Use a directory that will be accessible in toolbox and flatpak
	(setq server-socket-dir "/tmp/emacs")
)
