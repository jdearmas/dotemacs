;; Orgmode Configuration File Environment

;; Document Structure
;; Headlines
;; Dynamic numbering of headlines in an Org buffer.
; (org-num-mode nil)

;; 2.2.3 Catching invisible edits
(setq org-catch-invisible-edits 1)

;; Orgmode Backend configurations
(require 'ox-groff)

;; Load Languages for org compilation
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t))
 )

(org-babel-do-load-languages
 'org-babel-load-languages '(
			     (shell . t)
			     )
 )

(org-babel-do-load-languages
 'org-babel-load-languages
  '((lisp . t)))

(org-babel-do-load-languages
 'org-babel-load-languages
  '((python . t)))

(setq org-log-done 'time)


;; TODO look into writeroom package

;; Non-nil means on links RET will follow the link.
(setq org-return-follows-link t)

(require 'ox-extra)
(ox-extras-activate '(ignore-headlines))
