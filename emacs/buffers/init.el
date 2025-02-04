(setq display-buffer-alist
    '(;; top side window
        ("\\*Bongo-Elfeed Queue.*"
        (display-buffer-reuse-window display-buffer-in-side-window)
        (window-height . 0.16)
        (side . top)
        (slot . -2))
        ("\\*\\(elfeed-mpv-output\\|world-clock\\).*"
        (display-buffer-in-side-window)
        (window-height . 0.16)
        (side . top)
        (slot . -1))
        ("\\*\\(Flymake\\|Package-Lint\\|vc-git :\\).*"
        (display-buffer-in-side-window)
        (window-height . 0.16)
        (side . top)
        (slot . 0)
        (window-parameters . ((no-other-window . t))))
        ("\\*Messages.*"
        (display-buffer-in-side-window)
        (window-height . 0.16)
        (side . top)
        (slot . 1)
        (window-parameters . ((no-other-window . t))))
        ("\\*\\(Backtrace\\|Warnings\\|Compile-Log\\)\\*"
        (display-buffer-in-side-window)
        (window-height . 0.16)
        (side . top)
        (slot . 2)
        (window-parameters . ((no-other-window . t))))
        ;; bottom side window
        ("\\*\\(Output\\|Register Preview\\).*"
        (display-buffer-in-side-window)
        (window-width . 0.16)       ; See the :hook
        (side . bottom)
        (slot . -1)
        (window-parameters . ((no-other-window . t))))
        ("\\*\\(Completions\\|Embark Live Occur\\).*"
        (display-buffer-in-side-window)
        (window-height . 0.16)
        (side . bottom)
        (slot . 0)
        (window-parameters . ((no-other-window . t))))
        (".*\\(e?shell\\|vterm\\).*"
        (display-buffer-in-side-window)
        (window-height . 0.16)
        (side . bottom)
        (slot . 1))
        ;; left side window
        ("\\*Help.*"
        (display-buffer-in-side-window)
        (window-width . 0.20)       ; See the :hook
        (side . left)
        (slot . 0)
        (window-parameters . ((no-other-window . t))))
        ;; right side window
        ("\\*Faces\\*"
        (display-buffer-in-side-window)
        (window-width . 0.25)
        (side . right)
        (slot . 0)
        (window-parameters
        . ((no-other-window . t)
            (mode-line-format
            . (" "
                mode-line-buffer-identification)))))
        ("\\*Custom.*"
        (display-buffer-in-side-window)
        (window-width . 0.25)
        (side . right)
        (slot . 1))
        ("\\.*"
        (display-buffer-reuse-window))
        ;; bottom buffer (NOT side window)
        ("\\*\\vc-\\(incoming\\|outgoing\\).*"
        (display-buffer-at-bottom))))
(setq window-combination-resize t)
(setq even-window-sizes 'height-only)
(setq window-sides-vertical nil)
(setq switch-to-buffer-in-dedicated-window 'pop)
;; Hooks' syntax is controlled by the `use-package-hook-name-suffix'
;; variable.  The "-hook" suffix is intentional.
;:hook ((help-mode-hook . visual-line-mode)
;                (custom-mode-hook . visual-line-mode))
