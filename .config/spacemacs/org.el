;; -*- mode: emacs-lisp; lexical-binding: t -*-

(defun org/user-setup ()
	(org-indent-mode)
	(visual-line-mode)

	(olivetti-mode)
	(olivetti-set-width fill-column)

	(setq line-spacing 0.1)
	(setq header-line-format "")

	(setq org-hide-emphasis-markers t)
	(setq org-superstar-remove-leading-stars t)
	(setq org-superstar-headline-bullets-list '(" "))

	(setq org-hidden-keywords '(title))
	(setq org-cycle-level-faces nil)
	(setq org-n-level-faces 4)

	(set-face-attribute 'org-level-8 nil :weight 'bold :inherit 'default)

	(set-face-attribute 'org-level-7 nil :inherit 'org-level-8)
	(set-face-attribute 'org-level-6 nil :inherit 'org-level-8)
	(set-face-attribute 'org-level-5 nil :inherit 'org-level-8)
	(set-face-attribute 'org-level-4 nil :inherit 'org-level-8)

	(set-face-attribute 'org-level-3 nil :inherit 'org-level-8 :height 1.2)
	(set-face-attribute 'org-level-2 nil :inherit 'org-level-8 :height 1.44)
	(set-face-attribute 'org-level-1 nil :inherit 'org-level-8 :height 1.728)

	(set-face-attribute 'org-document-title nil
                :height 2.074
                :foreground 'unspecified
                :inherit 'org-level-8)

	(setq org-fontify-done-headline t)
	(setq org-fontify-whole-heading-line t)
	(setq org-fontify-quote-and-verse-blocks t)

	(setq whitespace-global-modes '(not org-mode))
)

(with-eval-after-load 'org (add-hook 'org-mode-hook #'org/user-setup))
