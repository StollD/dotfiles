;; -*- mode: emacs-lisp; lexical-binding: t -*-

(defun toolbox/list ()
	(cdr (apply #'process-lines "flatpak-spawn"
		(list "--host" "toolbox" "list" "-c")))
)

(defun toolbox/parse-list (&optional ignored)
	(cl-loop for line in (toolbox/list)
		for info = (split-string line "[[:space:]]+" t)
		collect (list "" (nth 1 info)))
)

(defun toolbox/default ()
	(shell-command-to-string
		"flatpak-spawn --host sh -c 'echo -n fedora-toolbox-$(rpm -E %fedora)'")
)

(defun toolbox/add-method ()
	(add-to-list 'tramp-methods `("tb"
		(tramp-login-program "flatpak-spawn")
		(tramp-login-args (("--host") ("toolbox")
			("run") ("-c") ("%h") ("/bin/sh")))

		(tramp-remote-shell "/bin/sh")
		(tramp-remote-shell-args ("-c"))))

	(tramp-set-completion-function "tb" '((toolbox/parse-list "")))
	(add-to-list 'tramp-default-host-alist `("tb" nil ,(toolbox/default)))
)

(with-eval-after-load 'tramp (toolbox/add-method))
