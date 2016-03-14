
; $HOME/.emacs.d/init.el

; you want to set custom-file (and read its docstring)

(load-file "~/.emacs.d/init.el.d/color_theme.el")

(load-file "~/.emacs.d/init.el.d/global_keys.el")

(load-file "~/.emacs.d/init.el.d/abbrev.el")

(load-file "~/.emacs.d/init.el.d/mouse.el")

(load-file "~/.emacs.d/init.el.d/calendar.el")

; (load-file "~/.emacs.d/init.el.d/dired.el")

(load-file "~/.emacs.d/init.el.d/org_mode.el")

(load-file "~/.emacs.d/init.el.d/erc.el")

(load-file "~/.emacs.d/init.el.d/remote_control.el")

(load-file "~/.emacs.d/init.el.d/tmux.el")

(load-file "~/.emacs.d/init.el.d/bbdb.el")

(load-file "~/.emacs.d/init.el.d/diminish.el")

(load-file "~/.emacs.d/init.el.d/w3m.el")

(load-file "~/.emacs.d/init.el.d/helm.el")

(load-file "~/.emacs.d/init.el.d/mm_url.el")

(load-file "~/.emacs.d/init.el.d/jira.el")

(load-file "~/.emacs.d/init.el.d/gnus.el")

(load-file "~/.emacs.d/init.el.d/stardict.el")

(load-file "~/.emacs.d/init.el.d/csharp.el")

(load-file "~/.emacs.d/init.el.d/jabber.el")

(load-file "~/.emacs.d/init.el.d/uniquify.el")

(load-file "~/.emacs.d/init.el.d/openwith.el")

(load-file "~/.emacs.d/init.el.d/ledger.el")

; (load-file "~/.emacs.d/init.el.d/ace.el")

(load-file "~/.emacs.d/init.el.d/ido.el")

(load-file "~/.emacs.d/init.el.d/cursor_blink.el")

(load-file "~/.emacs.d/init.el.d/terminal_config.el")

; (load-file "~/.emacs.d/init.el.d/hydra.el")

; custom-set-variables {{{

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-delay 1000000)
 '(blink-cursor-interval 1000000)
 '(calendar-date-display-form
   (quote
    ((format "%s-%.2d-%.2d" year
	     (string-to-number month)
	     (string-to-number day)))))
 '(calendar-time-display-form
   (quote
    (24-hours ":" minutes
	      (if time-zone " (")
	      time-zone
	      (if time-zone ")"))))
 '(diary-file "~/.documents/diary")
 '(erc-autojoin-delay 20)
 '(erc-email-userid "")
 '(erc-hide-list (quote ("JOIN" "NICK" "PART" "QUIT")))
 '(erc-modules
   (quote
    (autojoin button completion dcc keep-place list log notifications ring services highlight-nicknames netsplit fill match track readonly networks noncommands irccontrols move-to-prompt stamp menu)))
 '(find-ls-option (quote ("-ls" . "-hdilsb")))
 '(find-ls-subdir-switches "-halb")
 '(fringe-mode 0 nil (fringe))
 '(global-linum-mode nil)
 '(helm-ff-auto-update-initial-value nil)
 '(helm-ff-file-name-history-use-recentf t)
 '(helm-file-cache-fuzzy-match t)
 '(ido-enable-flex-matching t)
 '(jabber-alert-presence-hooks nil)
 '(jabber-auto-reconnect t)
 '(jabber-backlog-days 30)
 '(jabber-backlog-number 40)
 '(jabber-history-enabled t)
 '(jabber-roster-show-bindings nil)
 '(jabber-show-offline-contacts nil)
 '(jabber-show-resources nil)
 '(jabber-use-global-history nil)
 '(js2-basic-offset 2)
 '(large-file-warning-threshold nil)
 '(linum-delay t)
 '(linum-eager nil)
 '(linum-format (quote dynamic))
 '(openwith-associations
   (quote
    (("\\.pdf\\'" "zathura"
      (file))
     ("\\.mp3\\'" "play"
      (file))
     ("\\.\\(?:mpe?g\\|avi\\|wmv\\|mkv\\|mp4\\)\\'" "mplayer"
      ("-utf8" "-fs" "-osdlevel" "0" "-vsync" file))
     ("\\.\\(?:jp?g\\|png\\)\\'" "feh"
      ("--hide-pointer" "--scale-down" "--image-bg black" "--fullscreen" "--force-aliasing" file)))))
 '(org-agenda-clock-consistency-checks
   (quote
    (:max-duration "18:00" :min-duration 0 :max-gap "0:05" :gap-ok-around
		   ("4:00")
		   :default-face
		   ((:background "DarkRed")
		    (:foreground "white"))
		   :overlap-face nil :gap-face nil :no-end-time-face nil :long-face nil :short-face nil)))
 '(org-agenda-clockreport-parameter-plist
   (quote
    (:link t :maxlevel 6 :fileskip0 t :compact t :narrow 80)))
 '(org-agenda-export-html-style
   "<link rel=\"stylesheet\" type=\"text/css\" href=\"org/style.css\">")
 '(org-agenda-files (quote ("/home/chris/.documents/org/")))
 '(org-agenda-include-diary t)
 '(org-agenda-persistent-filter t)
 '(org-agenda-persistent-marks t)
 '(org-agenda-skip-additional-timestamps-same-entry t)
 '(org-agenda-skip-archived-trees nil)
 '(org-agenda-skip-unavailable-files t)
 '(org-agenda-span (quote day))
 '(org-agenda-start-with-clockreport-mode t)
 '(org-agenda-start-with-log-mode t)
 '(org-agenda-sticky nil)
 '(org-agenda-tags-column -100)
 '(org-agenda-time-grid
   (quote
    ((require-timed)
     "----------------"
     (700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100))))
 '(org-agenda-time-leading-zero t)
 '(org-agenda-window-setup (quote only-window))
 '(org-babel-load-languages
   (quote
    ((css . t)
     (ditaa . t)
     (dot . t)
     (emacs-lisp . t)
     (gnuplot . t)
     (haskell . t)
     (js . t)
     (ledger . t)
     (plantuml . t)
     (python . t)
     (ruby . t)
     (screen . t)
     (sh . t)
     (sql . t)
     (sqlite . t))))
 '(org-checkbox-hierarchical-statistics t)
 '(org-clock-continuously t)
 '(org-clock-history-length 100)
 '(org-clock-in-resume t)
 '(org-clock-into-drawer "LOGBOOK")
 '(org-clock-persist t)
 '(org-clock-persist-query-resume nil)
 '(org-clock-report-include-clocking-task t)
 '(org-clock-resolve-expert t)
 '(org-clock-x11idle-program-name "xprintidle")
 '(org-clocktable-defaults
   (quote
    (:maxlevel 3 :lang "en" :scope nil :block nil :wstart 1 :mstart 1 :tstart nil :tend nil :step nil :stepskip0 nil :fileskip0 nil :tags nil :emphasize nil :link nil :narrow 40! :indent t :formula nil :timestamp nil :level nil :tcolumns nil :formatter nil)))
 '(org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")
 '(org-completion-use-ido t)
 '(org-confirm-babel-evaluate nil)
 '(org-cycle-hook nil)
 '(org-ditaa-jar-path "/home/chris/.emacs.d/org-mode/contrib/scripts/ditaa.jar")
 '(org-drawers
   (quote
    ("PROPERTIES" "CLOCK" "LOGBOOK" "RESULTS" "SCHEDULE")) t)
 '(org-drill-optimal-factor-matrix
   (quote
    ((3
      (3.0 . 3.002)
      (2.6 . 2.6)
      (2.8000000000000003 . 2.794)
      (2.56 . 2.606))
     (2
      (2.8000000000000003 . 2.785)
      (2.9 . 2.898)
      (2.6 . 2.6)
      (2.16 . 2.408)
      (2.7 . 2.691)
      (1.8000000000000003 . 2.236))
     (1
      (2.36 . 3.86)
      (1.8000000000000003 . 3.56)
      (2.8000000000000003 . 4.435)
      (2.06 . 3.705)
      (2.7 . 4.285)
      (2.2800000000000002 . 3.85)
      (1.96 . 3.58)
      (2.1799999999999997 . 3.72)
      (2.5 . 4.0)
      (2.6 . 4.14)
      (1.7000000000000002 . 3.44)))))
 '(org-enforce-todo-dependencies nil)
 '(org-export-allow-bind-keywords t)
 '(org-habit-graph-column 50)
 '(org-habit-preceding-days 14)
 '(org-html-postamble nil)
 '(org-log-into-drawer t)
 '(org-modules
   (quote
    (org-bbdb org-crypt org-habit org-id org-mouse org-checklist org-collector org-drill org-eshell org-expiry org-git-link org-learn org-man org-notmuch org-screen)))
 '(org-outline-path-complete-in-steps nil)
 '(org-plantuml-jar-path "/opt/plantuml/plantuml.jar")
 '(org-pretty-entities t)
 '(org-startup-folded nil)
 '(org-stuck-projects
   (quote
    ("+PROJECT/-DONE-CANCELED"
     ("TODO" "NEXT" "NEXTACTION")
     ("diet" "ARCHIVE")
     "\\<IGNORE\\>")))
 '(org-use-property-inheritance t)
 '(send-mail-function (quote mailclient-send-it))
 '(transient-mark-mode nil)
 '(truncate-lines t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

;; }}}

; custom-set-faces {{{

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 115 :width normal :foundry "unknown" :family "Monaco"))))
 '(linum ((t (:inherit (shadow default) :background "color-232" :foreground "#626262"))))
 '(menu ((t (:background "#d9d9d9" :foreground "#242424"))))
 '(mode-line ((t (:background "#3f3f3f" :foreground "#f6f3e8"))))
 '(mode-line-buffer-id ((t (:background "#6b6b6b" :weight bold))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#171717" :foreground "color-231" :box (:line-width -1 :color "grey40") :weight light))))
 '(org-agenda-clocking ((t (:inherit nil)))))

; }}}

(load-file "~/.emacs.d/init.el.d/theme.el")

(load-file "~/.emacs.d/init.el.d/unsorted.el")

;; C-h l
;; M-x command-history RET
;; C-x M-: 

(add-to-list 'load-path "~/.emacs.d/esup")

(load-file "~/.emacs.d/esup/esup-child.el")
(load-file "~/.emacs.d/esup/esup.el")

(autoload 'esup "esup" "Emacs Start Up Profiler." nil)

(defun switch-to-previous-buffer ()
	(interactive)
	(switch-to-buffer (other-buffer (current-buffer) 1)))

(global-set-key (kbd "C-x <up>") 'switch-to-previous-buffer)

