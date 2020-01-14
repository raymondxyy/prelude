(require 'use-package)

;;; Writing
(use-package writegood-mode
             :ensure t
             :bind ("C-c g" . writegood-mode)
             :config
             (add-to-list 'writegood-weasel-words "actionable"))

;;; Stack overflow
(use-package sx
    :ensure t
    :config
    (bind-keys :prefix "C-c s"
               :prefix-map my-sx-map
               :prefix-docstring "Global keymap for SX."
               ("q" . sx-tab-all-questions)
               ("i" . sx-inbox)
               ("o" . sx-open-link)
               ("u" . sx-tab-unanswered-my-tags)
               ("a" . sx-ask)
               ("s" . sx-search)))

;;; Markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
