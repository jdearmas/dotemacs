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

(defun org-create-link()
  "Create a directory link, that makes the directory and index file."
  (interactive)
  (setq text (thing-at-point 'filename))
(condition-case nil
    (org-open-at-point)
  (error 
  (when (string= (substring text -1 nil) "/")
        (setq pathname (concat default-directory text "index.org"))
        (unless (file-directory-p text)
          (make-directory text)
        )
        (unless (file-exists-p pathname)
          (make-empty-file pathname)
        )
        (append-to-file (format "#+TITLE: %s" text) nil pathname)
        ;;(org-insert-link nil pathname text)
        (setq bounds (bounds-of-thing-at-point 'filename))
        (setq pos1 (car bounds))
        (setq pos2 (cdr bounds))
        (setq mything (buffer-substring-no-properties pos1 pos2))
        (delete-region pos1 pos2)
        (insert (format "[[%s][%s]]" pathname text))
        )
  )
  )
)


(eval-after-load 'org-mode
  '(define-key evil-normal-state-map (kbd "RET") 'org-create-link))

  
