
; global-set-key {{{

(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-xm" 'browse-url-at-point)

; in (back side button)
(global-set-key (kbd "<mouse-8>") 'org-clock-in)

; out (front side button)
(global-set-key (kbd "<mouse-9>") 'org-clock-out)

(global-set-key (kbd "C-M-y") 'query-replace-regexp)
(global-set-key (kbd "C-b") 'backward-char)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

; {{{

(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-x C-g") 'org-clock-remove-overlays)

; }}}

; }}}

