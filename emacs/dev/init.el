(require 'use-package)

;; SX is a full-featured Stack Exchange mode for GNU Emacs 24+. Using
;; the official API, it provides a versatile experience for the Stack
;; Exchange network within Emacs itself.
;; M-x package-install RET sx RET
(use-package sx
	     :config
	     (bind-keys :prefix "C-c s"
			:prefix-map my-sx-map
			:prefix-docstring "Global keymap for SX."
			("q" . sx-tab-all-questions)
			("i" . sx-inbox)
			("o" . sx-open-link)
			("u" . sx-tab-unanswered-my-tags)
			("a" . sx-ask)
			             ("s" . sx-search)))

