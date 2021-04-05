;; -*- mode: emacs-lisp; lexical-binding: t -*-

(defun ccls/register-remote ()
	(lsp-register-client
		(make-lsp-client
			:new-connection (lsp-tramp-connection "ccls")
			:major-modes '(c-mode c++-mode cuda-mode objc-mode)
			:server-id 'ccls-remote
			:multi-root nil
			:notification-handlers (lsp-ht
				("$ccls/publishSkippedRanges" #'ccls--publish-skipped-ranges)
				("$ccls/publishSemanticHighlight" #'ccls--publish-semantic-highlight))
			:initialization-options (lambda () ccls-initialization-options)
			:library-folders-fn ccls-library-folders-fn
			:remote? t))
)

(with-eval-after-load 'ccls (ccls/register-remote))
