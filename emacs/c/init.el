;; c-emacs-env configuration file

;; install the package, if not installed already

    (unless (package-installed-p 'cedet)
      (package-install 'cedet))
