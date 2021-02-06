 ;; Emacs Lisp Environment Configuration File

;; set the scheme program name to 'guile'
(setq scheme-program-name "guile")

;; Slime
(unless (package-installed-p 'slime)
  (package-install 'slime)
  (package-install 'slime-quicklisp))

;(setq inferior-lisp-program "/usr/bin/clisp")

(add-hook 'slime-load-hook
  (lambda ()
    (define-key slime-prefix-map (kbd "M-h") 'slime-documentation-lookup)))


(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")
