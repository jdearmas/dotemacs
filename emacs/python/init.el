;; Python Configuration File Environment

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

  (load "elpy")
  (load "elpy-rpc")
  (load "elpy-shell")
  (load "elpy-profile")
  (load "elpy-refactor")
  (load "elpy-django")

(use-package python-black
  :demand t
  :after python)
