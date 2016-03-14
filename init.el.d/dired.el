
; dired {{{

; {{{

(add-hook 'dired-mode-hook
  (lambda ()
    (local-set-key "\C-j" 'dired-find-file)))

(local-set-key (kbd "<double-mouse-1>") 'dired-find-file)
(local-set-key (kbd "<mouse-1>") 'dired-find-file)

(add-hook 'dired-load-hook '(lambda () (require 'dired-x)))

(eval-after-load "dired-aux"
  '(add-to-list 'dired-compress-file-suffixes
  '("\\.zip\\'" ".zip" "unzip")))

; }}}

(when (require 'dired-aux)
(require 'dired-async))

; }}}

