;; ci/cd emacs configuration file

;; Jenkins
(unless (package-installed-p 'jenkins)
  (package-install 'jenkins)


