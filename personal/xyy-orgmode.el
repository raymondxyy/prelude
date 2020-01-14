(require 'org)
(require 'use-package)

;; Configure orgmode
(setq org-directory "/home/xyy/pCloudDrive/xyy/0-Org")
(setq org-default-notes-file (concat org-directory "/WorkingMemory.org"))
(setq org-capture-templates
      `(("t" "Todo [Inbox]" entry (file ,(concat org-directory "/_Inbox_.org"))
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree ,(concat org-directory "/Journal.org"))
         "* %?\nEntered on %U\n  %i\n  %a")
        ("n" "Note" entry (file ,(concat org-directory "/WorkingMemory.org"))
         "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)))
(setq org-archive-location (concat org-directory "/Archives.org::"))
(setq org-agenda-files (list org-directory))
(setq org-startup-indented 'f)
(setq org-special-ctrl-a/e 't)
(setq org-src-fontify-natively 't)
(setq org-src-tab-acts-natively t)
(setq org-src-window-setup 'current-window)

;; Define keywords
(setq org-todo-keyword-faces
      '(
        ("PROG" . (:foreground "blue" :weight bold))
        ("WAIT" . (:foreground "yellow" :weight bold))
        ("DROP" . (:foreground "black" :weight bold))
        ))

(setq org-todo-keywords
      '((sequence "TODO" "PROG" "WAIT" "DROP" "DONE")))

;;; Keybindings
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(setq org-log-done 'time)

;;; Bullets
(use-package org-bullets
  :ensure t
  :config
  (setq org-bullets-bullet-list '("∙"))
  (add-hook 'org-mode-hook 'org-bullets-mode))

;;; Customize apperance
(let*
      ((variable-tuple (cond
                        ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                        ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                        ((x-list-fonts "Verdana")         '(:font "Verdana"))
                        ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                        (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight normal :foreground ,base-font-color)))

    (custom-theme-set-faces 'user
                            `(org-level-8 ((t (,@headline ,@variable-tuple))))
                            `(org-level-7 ((t (,@headline ,@variable-tuple))))
                            `(org-level-6 ((t (,@headline ,@variable-tuple))))
                            `(org-level-5 ((t (,@headline ,@variable-tuple))))
                            `(org-level-4 ((t (,@headline ,@variable-tuple))))
                            `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.33))))
                            `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.33))))
                            `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.33))))
                            `(org-document-title ((t (,@headline ,@variable-tuple :height 1.33 :underline nil))))))

;;; Resources:
;;; https://jamiecollinson.com/blog/my-emacs-config/#org
