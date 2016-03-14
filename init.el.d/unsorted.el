
; {{{

; {{{

(column-number-mode 1)

(global-auto-revert-mode t)

; }}}

(set-face-attribute 'default nil :height 150)
(scroll-bar-mode -1)

; (openwith-mode t)

; }}}

; {{{

(load-file "~/.emacs.d/xml-rpc.el")
(load-file "~/.emacs.d/showtip.el")

; (load-file "~/.emacs.d/frame-fns.el")
; (load-file "~/.emacs.d/frame-cmds.el")

; }}}

; {{{

(add-hook 'list-diary-entries-hook 'sort-diary-entries t)

; }}}

; {{{

(line-number-mode 0)
(org-clock-persistence-insinuate)
(put 'scroll-left 'disabled nil)

; }}}

; setq {{{

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq auto-fill-mode 1)
(setq default-major-mode 'text-mode)
(setq delete-old-versions t)

(setq initial-scratch-message nil)
(setq make-backup-files t)

(setq ns-use-native-fullscreen nil)

(setq scroll-step 1)
(setq standard-indent 2)
(setq version-control t)

; }}}

; {{{

(setq-default fill-column 72)
(show-paren-mode 1)
(transient-mark-mode 1)

(put 'narrow-to-region 'disabled nil)

(put 'set-goal-column 'disabled nil)

(add-to-list 'load-path "~/.emacs.d/avy")

(add-to-list 'load-path "~/.emacs.d/async")

(defun server-load-hook ()
  ;; attempt start server. if already running, fail silently.
  (ignore-errors
    (ignore-errors
      (require 'xref))
    (if (and (fboundp 'server-running-p)
             (not (eq (server-running-p) t)))
        (server-start))
    ;; its annoying always having to say "yes" to close client-opened files
    (remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)))

(eval-after-load "server"
  '(server-load-hook))

(add-hook 'server-load-hook 'bh/punch-in t)

;; so we can use emacsclient from other terminals
;; but dont start server if it already exists
(require 'server)

; }}}

; ';' is for comments in the end of line, ';;' is for comments that take a
; line inside defun block, ';;;' is for comments outside of defun blocks

; (info "(elisp) Comments")

; leafnode+fetchmail+dovecot+postfix is an amazing combo
; leafnode + fetchmail + msmtp

;; I found in the end that use-package was a better way to bring sanity to my
;; configuration, rather than splitting things up into multiple files.  I ended
;; up doing far too much grepping to find what I wanted to modify

