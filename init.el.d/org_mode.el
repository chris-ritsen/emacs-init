
; org-mode {{{

; org-link-minor-mode {{{

(load-file "~/.emacs.d/org-link-minor-mode.el")
(load-file "~/.emacs.d/org-link-minor-mode.el")

(require 'org-link-minor-mode)

; }}}

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp")

(require 'org)

; {{{

(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/.documents/org/refile.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file "~/.documents/org/refile.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/.documents/org/refile.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/.documents/org/diary.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file "~/.documents/org/refile.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("p" "Phone call" entry (file "~/.documents/org/refile.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/.documents/org/refile.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

; }}}

; gtd function {{{

; (defun gtd ()
;   (interactive)
;   (find-file "~/.documents/gtd.org")
; )

; }}}

; {{{

(setq org-capture-templates
      (append '(("l" "Ledger entries")
                ("lb" "checking" plain
                (file (getenv "LEDGER"))

"%(org-read-date) * %^{Payee}
  assets:elga:checking
  expenses:%^{Account}  $%^{Amount}
")
                ("lc" "cash" plain
                (file (getenv "LEDGER"))
"%(org-read-date) * %^{Payee}
  assets:cash
  expenses:cash  $%^{Amount}
"))
 org-capture-templates))

; }}}

; {{{

(setq org-agenda-custom-commands
  '(("w" "Work tasks" agenda "TDI"
    (
      (org-agenda-ndays 1)
      (org-agenda-files (quote ("~/.documents/org/" "~/.documents/gtd.org")))
      (org-agenda-clockreport-mode t)
      (org-agenda-day-view t)
      (tags "work")))))

; }}}

; define-key {{{

(define-key global-map "\C-c\C-o" 'org-open-at-point)
(define-key global-map "\C-cl" 'org-store-link)

; }}}

; setq {{{

(setq org-click-into-drawer t)
(setq org-clock-continuously nil)
(setq org-clock-continuously t)
(setq org-clock-idle-time nil)
(setq org-clock-out-remove-zero-time-clocks t)
(setq org-clock-persist 'history)
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")
(setq org-confirm-shell-link-function nil)
(setq org-default-notes-file "~/.documents/org/notes.org")
(setq org-directory "~/.documents/org")
(setq org-export-html-postamble nil)
(setq org-image-actual-width nil)
(setq org-link-abbrev-alist '(("cmus" . "shell:/usr/bin/cmus-remote --play %s")))
(setq org-log-done 'time)
(setq org-use-fast-todo-selection t)

; ditaa {{{

(setq org-ditaa-jar-path "/home/chris/.emacs.d/org-mode/contrib/scripts/ditaa.jar")

; }}}

; }}}

; {{{

(setq org-agenda-clockreport-parameter-plist
  (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))

; }}}

; {{{

(setq org-todo-keywords
  '((sequence "TODO(t)" "|" "DONE(d!)")
    (sequence "HABIT(h)" "|" "DONE(d!)")
    (sequence "REPORT(r)" "BUG(b@)" "KNOWNCAUSE(k)" "|" "FIXED(f!)")
    (sequence "REVIEW" "REVISE" "WAITING(w)" "ACCEPTED" "|" "CLOSED")
    (sequence "CONSIDER" "APPLIED" "RESPONDED" "INTERVIEW" "|" "OFFER(!)" "CLOSED(!)")
    (sequence "|" "CANCELED(c!/@)")))

; }}}

; {{{

(setq org-agenda-clockreport-parameter-plist
  (quote (:link t :maxlevel 6 :fileskip0 t :compact t :narrow 80)))

; Adds a percentage column, but adds a junk comment line below the table

; (setq org-agenda-clockreport-parameter-plist
;   (quote (:link t :maxlevel 6 :fileskip0 t :compact t :narrow 80 :formula %)))

; }}}

; Automatically create ids when saving {{{ 

; FIXME: This is noticeably slow.

; (defun my/org-add-ids-to-headlines-in-file ()
;   "Add ID properties to all headlines in the current file which do not already have one."
;     (interactive)
;       (org-map-entries 'org-id-get-create))

; (add-hook 'org-mode-hook
;   (lambda ()
;     (add-hook 'before-save-hook 'my/org-add-ids-to-headlines-in-file nil 'local)))

; }}}

; TODO: Use \\[org-clock-remove-overlays] to remove the subtree times."

(org-agenda-files (quote ("~/.documents/org/")))

; Decent, but moves the cursor back and forth and breaks the functionality of 
; going to the timestamp being checked.

(advice-add 'org-agenda-goto :after
	(lambda (&rest args)
		(org-narrow-to-subtree)))

; }}}

; new {{{

(add-hook 'org-log-buffer-setup-hook 
	(lambda ()
		(visual-line-mode)
		(auto-fill-mode)))

; }}}

; new {{{

(defun bh/is-project-p ()
  "Any task with a todo keyword subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task has-subtask))))

(defun bh/is-project-subtree-p ()
  "Any task with a todo keyword that is in a project subtree.
Callers of this function already widen the buffer view."
  (let ((task (save-excursion (org-back-to-heading 'invisible-ok)
                              (point))))
    (save-excursion
      (bh/find-project-task)
      (if (equal (point) task)
          nil
        t))))

(defun bh/is-task-p ()
  "Any task with a todo keyword and no subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task (not has-subtask)))))

(defun bh/is-subproject-p ()
  "Any task which is a subtask of another project"
  (let ((is-subproject)
        (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
    (save-excursion
      (while (and (not is-subproject) (org-up-heading-safe))
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq is-subproject t))))
    (and is-a-task is-subproject)))

(defun bh/list-sublevels-for-projects-indented ()
  "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
  This is normally used by skipping functions where this variable is already local to the agenda."
  (if (marker-buffer org-agenda-restrict-begin)
      (setq org-tags-match-list-sublevels 'indented)
    (setq org-tags-match-list-sublevels nil))
  nil)

(defun bh/list-sublevels-for-projects ()
  "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
  This is normally used by skipping functions where this variable is already local to the agenda."
  (if (marker-buffer org-agenda-restrict-begin)
      (setq org-tags-match-list-sublevels t)
    (setq org-tags-match-list-sublevels nil))
  nil)

; (defvar bh/hide-scheduled-and-waiting-next-tasks t)

; (defun bh/toggle-next-task-display ()
;   (interactive)
;   (setq bh/hide-scheduled-and-waiting-next-tasks (not bh/hide-scheduled-and-waiting-next-tasks))
;   (when  (equal major-mode 'org-agenda-mode)
;     (org-agenda-redo))
;   (message "%s WAITING and SCHEDULED NEXT Tasks" (if bh/hide-scheduled-and-waiting-next-tasks "Hide" "Show")))

; (defun bh/skip-stuck-projects ()
;   "Skip trees that are not stuck projects"
;   (save-restriction
;     (widen)
;     (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
;       (if (bh/is-project-p)
;           (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
;                  (has-next ))
;             (save-excursion
;               (forward-line 1)
;               (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
;                 (unless (member "WAITING" (org-get-tags-at))
;                   (setq has-next t))))
;             (if has-next
;                 nil
;               next-headline)) ; a stuck project, has subtasks but no next task
;         nil))))

; (defun bh/skip-non-stuck-projects ()
;   "Skip trees that are not stuck projects"
;   ;; (bh/list-sublevels-for-projects-indented)
;   (save-restriction
;     (widen)
;     (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
;       (if (bh/is-project-p)
;           (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
;                  (has-next ))
;             (save-excursion
;               (forward-line 1)
;               (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
;                 (unless (member "WAITING" (org-get-tags-at))
;                   (setq has-next t))))
;             (if has-next
;                 next-headline
;               nil)) ; a stuck project, has subtasks but no next task
;         next-headline))))

(defun bh/skip-non-projects ()
  "Skip trees that are not projects"
  ;; (bh/list-sublevels-for-projects-indented)
  (if (save-excursion (bh/skip-non-stuck-projects))
      (save-restriction
        (widen)
        (let ((subtree-end (save-excursion (org-end-of-subtree t))))
          (cond
           ((bh/is-project-p)
            nil)
           ((and (bh/is-project-subtree-p) (not (bh/is-task-p)))
            nil)
           (t
            subtree-end))))
    (save-excursion (org-end-of-subtree t))))

; (defun bh/skip-non-tasks ()
;   "Show non-project tasks.
; Skip project and sub-project tasks, habits, and project related tasks."
;   (save-restriction
;     (widen)
;     (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
;       (cond
;        ((bh/is-task-p)
;         nil)
;        (t
;         next-headline)))))

(defun bh/skip-project-trees-and-habits ()
  "Skip trees that are projects"
  (save-restriction
    (widen)
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((bh/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       (t
        nil)))))

; (defun bh/skip-projects-and-habits-and-single-tasks ()
;   "Skip trees that are projects, tasks that are habits, single non-project tasks"
;   (save-restriction
;     (widen)
;     (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
;       (cond
;        ((org-is-habit-p)
;         next-headline)
;        ((and bh/hide-scheduled-and-waiting-next-tasks
;              (member "WAITING" (org-get-tags-at)))
;         next-headline)
;        ((bh/is-project-p)
;         next-headline)
;        ((and (bh/is-task-p) (not (bh/is-project-subtree-p)))
;         next-headline)
;        (t
;         nil)))))

; (defun bh/skip-project-tasks-maybe ()
;   "Show tasks related to the current restriction.
; When restricted to a project, skip project and sub project tasks, habits, NEXT tasks, and loose tasks.
; When not restricted, skip project and sub-project tasks, habits, and project related tasks."
;   (save-restriction
;     (widen)
;     (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
;            (next-headline (save-excursion (or (outline-next-heading) (point-max))))
;            (limit-to-project (marker-buffer org-agenda-restrict-begin)))
;       (cond
;        ((bh/is-project-p)
;         next-headline)
;        ((org-is-habit-p)
;         subtree-end)
;        ((and (not limit-to-project)
;              (bh/is-project-subtree-p))
;         subtree-end)
;        ((and limit-to-project
;              (bh/is-project-subtree-p)
;              (member (org-get-todo-state) (list "NEXT")))
;         subtree-end)
;        (t
;         nil)))))

(defun bh/skip-project-tasks ()
  "Show non-project tasks.
Skip project and sub-project tasks, habits, and project related tasks."
  (save-restriction
    (widen)
    (let* ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((bh/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       ((bh/is-project-subtree-p)
        subtree-end)
       (t
        nil)))))

; (defun bh/skip-non-project-tasks ()
;   "Show project tasks.
; Skip project and sub-project tasks, habits, and loose non-project tasks."
;   (save-restriction
;     (widen)
;     (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
;            (next-headline (save-excursion (or (outline-next-heading) (point-max)))))
;       (cond
;        ((bh/is-project-p)
;         next-headline)
;        ((org-is-habit-p)
;         subtree-end)
;        ((and (bh/is-project-subtree-p)
;              (member (org-get-todo-state) (list "NEXT")))
;         subtree-end)
;        ((not (bh/is-project-subtree-p))
;         subtree-end)
;        (t
;         nil)))))

(defun bh/skip-projects-and-habits ()
  "Skip trees that are projects and tasks that are habits"
  (save-restriction
    (widen)
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((bh/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       (t
        nil)))))

; (defun bh/skip-non-subprojects ()
;   "Skip trees that are not projects"
;   (let ((next-headline (save-excursion (outline-next-heading))))
;     (if (bh/is-subproject-p)
;         nil
;       next-headline)))

; }}}
              
; maybe clock out {{{

;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)

;; Show lot of clocking history so it's easy to pick items off the C-F11 list
(setq org-clock-history-length 23)

;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)

;; Change tasks to NEXT when clocking in
; (setq org-clock-in-switch-to-state 'bh/clock-in-to-next)

;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))

;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)

;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)

;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))

;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)

(setq bh/keep-clock-running nil)

; (defun bh/clock-in-to-next (kw)
;   "Switch a task from TODO to NEXT when clocking in.
; Skips capture tasks, projects, and subprojects.
; Switch projects and subprojects from NEXT back to TODO"
;   (when (not (and (boundp 'org-capture-mode) org-capture-mode))
;     (cond
;      ((and (member (org-get-todo-state) (list "TODO"))
;            (bh/is-task-p))
;       "NEXT")
;      ((and (member (org-get-todo-state) (list "NEXT"))
;            (bh/is-project-p))
;       "TODO"))))

(defun bh/find-project-task ()
  "Move point to the parent (project) task if any"
  (save-restriction
    (widen)
    (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
      (while (org-up-heading-safe)
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq parent-task (point))))
      (goto-char parent-task)
      parent-task)))

(defun bh/punch-in (arg)
  "Start continuous clocking and set the default task to the
selected task.  If no task is selected set the Organization task
as the default task."
  (interactive "p")
  (setq bh/keep-clock-running t)
  (if (equal major-mode 'org-agenda-mode)
      ;;
      ;; We're in the agenda
      ;;
      (let* ((marker (org-get-at-bol 'org-hd-marker))
             (tags (org-with-point-at marker (org-get-tags-at))))
        (if (and (eq arg 4) tags)
            (org-agenda-clock-in '(16))
          (bh/clock-in-organization-task-as-default)))
    ;;
    ;; We are not in the agenda
    ;;
    (save-restriction
      (widen)
      ; Find the tags on the current task
      (if (and (equal major-mode 'org-mode) (not (org-before-first-heading-p)) (eq arg 4))
          (org-clock-in '(16))
        (bh/clock-in-organization-task-as-default)))))

(defun bh/punch-out ()
  (interactive)
  (setq bh/keep-clock-running nil)
  (when (org-clock-is-active)
    (org-clock-out))
  (org-agenda-remove-restriction-lock))

(defun bh/clock-in-default-task ()
  (save-excursion
    (org-with-point-at org-clock-default-task
      (org-clock-in))))

(defun bh/clock-in-parent-task ()
  "Move point to the parent (project) task if any and clock in"
  (let ((parent-task))
    (save-excursion
      (save-restriction
        (widen)
        (while (and (not parent-task) (org-up-heading-safe))
          (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
            (setq parent-task (point))))
        (bh/clock-in-default-task)))))

(defvar bh/organization-task-id "e2109d33-c4a7-4541-8f5e-d3b6ac300ef0")

(defun bh/clock-in-organization-task-as-default ()
  (interactive)
  (org-with-point-at (org-id-find bh/organization-task-id 'marker)
    (org-clock-in '(16))))

(defun bh/clock-out-maybe ()
  (when (and bh/keep-clock-running
             (not org-clock-clocking-in)
             (marker-buffer org-clock-default-task)
             (not org-clock-resolving-clocks-due-to-idleness))
    (bh/clock-in-parent-task)))


; }}}

; {{{

(defun on-org-clock-out ()
  (save-window-excursion
    (call-process "/home/chris/.scripts/clock_out.zsh" nil 0 nil)))

(defun on-org-clock-in ()
  (save-window-excursion
    (call-process "/home/chris/.scripts/clock_in.zsh" nil 0 nil)))

(add-hook 'org-clock-in-hook 'on-org-clock-in)

(add-hook 'org-mode-hook
  (lambda ()
		(auto-fill-mode)
		; (bh/punch-in nil)
    (local-set-key (kbd "<mouse-1>") 'org-cycle)
		; (org-agenda-list 1)
))

(add-hook 'org-clock-out-hook 'on-org-clock-out t)
(add-hook 'org-clock-out-hook 'bh/clock-out-maybe t)

; (add-hook 'after-init-hook 
;   (lambda ()

; ;  ; (if (eq major-mode 'latex-mode)
; ; 	 ; (message "LaTeX mode is ON")
; ; 	 ; (message "LaTeX mode is OFF")))

; 		(org-agenda-list 1)))

; }}}

(defun org-random-entry (&optional arg)
  "Select and goto a random todo item from the global agenda"
  (interactive "P")
  (if org-agenda-overriding-arguments
      (setq arg org-agenda-overriding-arguments))
  (if (and (stringp arg) (not (string-match "\\S-" arg))) (setq arg nil))
  (let* ((today (org-today))
         (date (calendar-gregorian-from-absolute today))
         (kwds org-todo-keywords-for-agenda)
         (lucky-entry nil)
         (completion-ignore-case t)
         (org-agenda-buffer (when (buffer-live-p org-agenda-buffer)
                              org-agenda-buffer))
         (org-select-this-todo-keyword
          (if (stringp arg) arg
            (and arg (integerp arg) (> arg 0)
                 (nth (1- arg) kwds))))
         rtn rtnall files file pos marker buffer)
    (when (equal arg '(4))
      (setq org-select-this-todo-keyword
            (org-icompleting-read "Keyword (or KWD1|K2D2|...): "
                                  (mapcar 'list kwds) nil nil)))
    (and (equal 0 arg) (setq org-select-this-todo-keyword nil))
    (catch 'exit
      (org-compile-prefix-format 'todo)
      (org-set-sorting-strategy 'todo)
      (setq files (org-agenda-files nil 'ifmode)
            rtnall nil)
      (while (setq file (pop files))
        (catch 'nextfile
          (org-check-agenda-file file)
          (setq rtn (org-agenda-get-day-entries file date :todo))
          (setq rtnall (append rtnall rtn))))

      (when rtnall
        (setq lucky-entry
              (nth (random
                    (safe-length
                     (setq entries rtnall)))
                   entries))

        (setq marker (or (get-text-property 0 'org-marker lucky-entry)
                         (org-agenda-error)))
        (setq buffer (marker-buffer marker))
        (setq pos (marker-position marker))
        (org-pop-to-buffer-same-window buffer)
        (widen)
        (goto-char pos)
        (when (derived-mode-p 'org-mode)
          (org-show-context 'agenda)
          (save-excursion
            (and (outline-next-heading)
                 (org-flag-heading nil))) ; show the next heading
          (when (outline-invisible-p)
            (show-entry))                 ; display invisible text
          (run-hooks 'org-agenda-after-show-hook))))))

