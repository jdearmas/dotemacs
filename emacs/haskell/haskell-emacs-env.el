;; haskell-emacs-env configuration file

;; install the package, if not installed already

    (unless (package-installed-p 'haskell-mode)
      (package-install 'haskell-mode))

;; haskell-interactive-mode
;; To enable the minor mode which activates keybindings associated with
;; interactive mode, use:

    (require 'haskell-interactive-mode)
    (require 'haskell-process)
    (add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;; hooks
;; To automatically enable the ‘haskell-unicode’ input method

(add-hook 'haskell-mode-hook 'turn-on-haskell-unicode-input-method)

;; To enable auto-insertion of module templates, enable:
(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

;; ‘haskell-decl-scan-mode’ is a minor mode which performs declaration
;; scanning and provides ‘M-x imenu’ support
(add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)

;; general settings
;; The command-line arguments passed to the ghci command
'(haskell-process-args-ghci '("-dynamic" "-ferror-spans"))

;; Auto import the modules reported by GHC to have been loaded
'(haskell-process-auto-import-loaded-modules t)

'(haskell-process-log t)

;; The path for starting ghci.
'(haskell-process-path-ghci "ghci-8.10.2")

'(haskell-process-suggest-remove-import-lines t)

'(haskell-stylish-on-save t)

;; haskell-mode can generate tags when saving source files
'(haskell-tags-on-save t)

;; keymaps
;; invoke the ‘haskell-compile’ command instead of
;; ‘compile’ as you would for the ordinary Compilation mode
(eval-after-load "haskell-mode"
	'(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))


'(haskell-compile-cabal-build-command "cabal build --ghc-option=-ferror-spans --ghc-option=-dynamic")

'(haskell-process-args-cabal-repl '("--ghc-option=-dynamic" "--ghc-option=-ferror-spans"))

'(haskell-process-args-ghci '("-dynamic" "-ferror-spans"))

'(haskell-process-auto-import-loaded-modules t)

'(haskell-process-log t)

'(haskell-process-path-ghci "ghci-8.10.2")

'(haskell-process-suggest-remove-import-lines t)

'(haskell-stylish-on-save t)

'(haskell-tags-on-save t)

;; To automatically enable the ‘haskell-unicode’ input method
(add-hook 'haskell-mode-hook 'turn-on-haskell-unicode-input-method)

;; To enable auto-insertion of module templates, enable:
(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

;; ‘haskell-decl-scan-mode’ is a minor mode which performs declaration
;; scanning and provides ‘M-x imenu’ support
(add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)

;; invoke the ‘haskell-compile’ command instead of
;; ‘compile’ as you would for the ordinary Compilation mode
(eval-after-load "haskell-mode"
  '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))

;; haskell-interactive-mode
;; To enable the minor mode which activates keybindings associated with
;; interactive mode, use:
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;; This enables some handy and benign features.


(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
