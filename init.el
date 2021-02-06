;; General Emacs Environment Configuration File

;; start at index
(setq initial-buffer-choice "~/docs/emacs/dailys.org")

;; hide the menu bar
;(menu-bar-mode -1)

;; replace 'Buffer List with 'IBuffer'
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; bind shell to C-c s
(global-set-key (kbd "C-c s") 'shell)

;; bind olivitel to C-c o
(global-set-key (kbd "C-c o") 'olivetti-mode)

;; set email address
(setq user-mail-address "var.mail.john@gmail.com")

;; display bytes in hexadecimal format
(setq display-raw-bytes-as-hex t)

;; Disable visible scrollbar
(scroll-bar-mode -1)

;; Disable the toolbar
(tool-bar-mode -1)

;; Disable tooltips
(tooltip-mode -1)

;; Give some breathing room
(set-fringe-mode 10)

;; make the default mode 'text-mode'
(setq-default major-mode 'text-mode)


;; Add This to .emacs to split windows vertically as default opening a
;; new buffer in other windows

    (setq
     split-width-threshold 0
     split-height-threshold nil)

;; Set up package.el to work with MELPA

    (require 'package)
    (add-to-list 'package-archives
		'("melpa" . "https://melpa.org/packages/")
		'("org" . "https://orgmode.org/elpa/")
		)
    (package-initialize)
    ;;(package-refresh-contents)

;; Download Evil

    (unless (package-installed-p 'evil)
      (package-install 'evil))

;; Enable Evil

    (require 'evil)
    (evil-mode 1)
    
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(chess-ics-server-list
   '(("freechess.org" 5000 nil nil nil nil)
     ("chess.unix-ag.uni-kl.de" 5000 nil nil nil nil)
     ("chessclub.com" 5000 nil nil nil nil)
     ("chess.net" 5000 nil nil nil nil)
     ("oics.olympuschess.com" 5000 nil nil nil nil)
     ("lichess.org" 80 nil nil nil nil)))
 '(custom-enabled-themes '(green-phosphor))
 '(custom-safe-themes
   '("08765d801b06462a3ce7e414cdb747436ccaf0c073350be201d8f87bd0481435" default))
 '(org-after-todo-state-change-hook '(org-checklist))
 '(org-agenda-files '("~/docs/emacs/dailys.org" "~/docs/emacs/resume/test.org"))
 '(org-babel-load-languages '((haskell . t) (emacs-lisp . t)))
 '(org-export-with-properties '("nil"))
 '(package-selected-packages
   '(olivetti python-black use-package pyenv-mode elpy yaml-mode jenkins green-phosphor-theme slime-quicklisp which-key slime org-plus-contrib magit haskell-mode evil chess)))

 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

    '(ansi-color-faces-vector
    [default default default italic underline success warning error])
    '(ansi-color-names-vector
    ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
    '(custom-enabled-themes nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; For a better experience, the three Org commands ‘org-store-link’,
;; ‘org-capture’ and ‘org-agenda’ ought to be accessible anywhere in
;; Emacs, not just in Org buffers.  To that effect, you need to bind them
;; to globally available keys, like the ones reserved for users (see
;; (elisp)Key Binding Conventions::).  Here are suggested bindings,
;; please modify the keys to your own liking.

    (global-set-key (kbd "C-c l") 'org-store-link)
    (global-set-key (kbd "C-c a") 'org-agenda)
    (global-set-key (kbd "C-c c") 'org-capture)


; How to make <tab> work in org mode when combined with evil mode
; (evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)
; How to make <tab> work in org mode when combined with evil mode

    (evil-define-key 'normal 'haskell-error-mode-map "q" #'quit-window)
    ;(define-key evil-normal-state-map (kbd "q") 'some-function)

; Personally I prefer to use emacs registers to store files which I
; use often. I would store '~/.emacs' in a register:
;; and open it with C-x r j e

    (set-register ?a (cons 'file "/home/jcd/docs/emacs/"))
    (set-register ?o (cons 'file "/home/jcd/.config/emacs/elpa/org-plus-contrib-20201116/ox-groff.el"))
    (set-register ?e (cons 'file user-init-file))
    (set-register ?u (cons 'file "/home/jcd/docs/emacs/dailys.org"))

;; (add-to-list 'load-path "path/to/which-key.el")
(require 'which-key)
(which-key-mode)

;; set default tab char's display width to 2 spaces
(setq-default tab-width 2) ; emacs 23.1 to 26 default to 8

(progn
  ;; make indent commands use space only (never tab character)
  (setq-default indent-tabs-mode nil)
  ;; emacs 23.1 to 26, default to t
  ;; if indent-tabs-mode is t, it means it may use tab, resulting mixed
  ;; space and tab
)

(defun er-kill-other-buffers ()
    "Kill all buffers but the current one.
Don't mess with special buffers."
    (interactive)
    (dolist (buffer (buffer-list))
      (unless (or (eql buffer (current-buffer)) (not (buffer-file-name buffer)))
              (kill-buffer buffer))))


(setq gnus-button-url 'browse-url-generic
        browse-url-generic-program "qutebrowser"
        browse-url-browser-function gnus-button-url)

(when (fboundp 'winner-mode)
  (winner-mode 1))

(setq display-buffer-alist
      '(;; bottom window
        ("\\*\\vc-\\(incoming\\|outgoing\\).*"
         (display-buffer-at-bottom))
        ("\\*\\(Output\\|Register Preview\\).*"
         (display-buffer-at-bottom)
         (window-parameters . ((no-other-window . t))))
        ("\\*.*\\([^E]eshell\\|shell\\|v?term\\).*"
         (display-buffer-reuse-mode-window display-buffer-at-bottom)
         (window-height . 0.2)
           ;; (mode . '(eshell-mode shell-mode))
         )))






(load "~/envs/emacs/org/init.el")
