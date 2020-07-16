; File Name: init-yas.el
; Author: amoblin <amoblin@gmail.com>
; Created Time: 2020-02-14 Fri 09:10

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :config
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets")))

(defun my/autoinsert-yas-expand()
  "Replace text in yasnippet template."
  (yas-expand-snippet (buffer-string) (point-min) (point-max)))

(use-package autoinsert
  :init
  ;; Don't want to be prompted before insertion:
  (setq auto-insert-query nil)

  (setq auto-insert-directory (locate-user-emacs-file "templates"))
  (add-hook 'find-file-hook 'auto-insert)
  (auto-insert-mode 1)

  :config
  (define-auto-insert "\\.el$" ["elisp.el" my/autoinsert-yas-expand])
  (define-auto-insert "\\.c$" ["c.c" my/autoinsert-yas-expand])
  (define-auto-insert "\\.org$" ["org-mode.org" my/autoinsert-yas-expand])
  (define-auto-insert "\\.py$" ["python.py" my/autoinsert-yas-expand])
  (define-auto-insert "\\.js$" ["node.js" my/autoinsert-yas-expand])
  (define-auto-insert "\\.rb$" ["ruby.rb" my/autoinsert-yas-expand])
  (define-auto-insert "\\.md$" ["markdown.rb" my/autoinsert-yas-expand])
  (define-auto-insert "\\.sh$" ["shell.sh" my/autoinsert-yas-expand])
  (define-auto-insert "Makefile$" ["Makefile" my/autoinsert-yas-expand])
  (define-auto-insert "Rakefile$" ["Rakefile" my/autoinsert-yas-expand])
  (define-auto-insert "\\.html?$" ["html.html" my/autoinsert-yas-expand]))
  (define-auto-insert "\\.pu?$" ["plantuml.pu" my/autoinsert-yas-expand]))

(provide 'init-yas)
