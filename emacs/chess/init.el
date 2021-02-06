;; Emacs Chess Environment Configuration File

;; Chess
(unless (package-installed-p 'chess)
  (package-install 'chess))

;; Connect to a chess server
;; (SERVER PORT [HANDLE] [PASSWORD-OR-FILENAME] [HELPER] [HELPER ARGS...])
