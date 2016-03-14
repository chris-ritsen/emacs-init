
; helm {{{

(add-to-list 'load-path "~/.emacs.d/helm")

(require 'helm)
(require 'helm-utils)
(require 'helm-config)
(require 'helm-org)

(setq helm-M-x-fuzzy-match t)
(setq helm-apropos-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-ff-fuzzy-matching t)
(setq helm-imenu-fuzzy-match t)
(setq helm-lisp-fuzzy-completion t)
(setq helm-locate-fuzzy-match t)
(setq helm-recentf-fuzzy-match t)
(setq helm-semantic-fuzzy-match t)

(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c o") 'helm-org-agenda-files-headings)

(helm-mode 1)

(add-hook 'minibuffer-setup-hook
  (lambda ()
    (local-set-key (kbd "C-w") 'backward-kill-word)
    (local-set-key (kbd "C-u") 'kill-whole-line)))

; }}}

