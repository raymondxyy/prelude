;; Configure orgmode
(setq org-directory "/home/xyy/pCloudDrive/xyy/0-Org")
;(setq org-default-notes-file (concat org-directory "/WorkingMemory.org"))
(setq org-capture-templates
      `(("t" "Todo [Inbox]" entry (file ,(concat org-directory "/_Inbox_.org"))
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree ,(concat org-directory "/Journal.org"))
         "* %?\nEntered on %U\n  %i\n  %a")
        ("n" "Note" entry (file ,(concat org-directory "/WorkingMemory.org"))
         "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)))
(setq org-archive-location (concat org-directory "/Archives.org::"))
(setq org-agenda-files (list org-directory))

;; Define keywords
(setq org-todo-keyword-faces
      '(
        ("PROG" . (:foreground "blue" :weight bold))
        ("WAIT" . (:foreground "yellow" :weight bold))
        ("DROP" . (:foreground "black" :weight bold))
        ))

(setq org-todo-keywords
      '((sequence "TODO" "PROG" "WAIT" "DROP" "DONE")))

;; Keybindings
(global-set-key (kbd "C-c c") 'org-capture)
