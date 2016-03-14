
; my-terminal-config {{{

(xterm-mouse-mode t)

(add-hook 'after-make-frame-functions 'my-terminal-config)

(defun my-terminal-config (&optional frame)
  "Establish settings for the current terminal."
  (if (not frame)
    (xterm-mouse-mode 1)
    (if xterm-mouse-mode
      (xterm-mouse-mode 1))))

(my-terminal-config)

; }}}

