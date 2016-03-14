
; erc {{{

; {{{

(dolist (hook '(erc-mode-hook
                  emacs-lisp-mode-hook
                  text-mode-hook))
    (add-hook hook (lambda () (abbrev-mode 1))))

; }}}


(load-file "~/.emacs.d/erc-highlight-nicknames.el")

(require 'erc-highlight-nicknames)

(setq erc-current-nick-highlight-type 'nick)
(setq erc-keywords '("\\berc[-a-z]*\\b" "\\bemms[-a-z]*\\b"))
(setq erc-track-exclude-types '("JOIN" "PART" "QUIT" "NICK" "MODE"))
(setq erc-track-faces-priority-list '(erc-current-nick-face erc-keyword-face))
(setq erc-track-priority-faces-only 'all)
(setq erc-track-use-faces t)

; }}}

