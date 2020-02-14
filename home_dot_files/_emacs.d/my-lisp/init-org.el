; File Name: init-org.el
; Author: amoblin <amoblin@gmail.com>
; Created Time: 2020-02-14 Fri 09:04

;; Org-Mode
;(use-package ox-gfm
;  :ensure t
;  )
;(setq org-hide-leading-stars t)
(setq org-log-done 'time)
;(define-key global-map "\C-ca" 'org-agenda)
; org mode默认遇到中文不自动换行，中文换行问题
(add-hook 'org-mode-hook
	  (lambda () (setq truncate-lines nil)))
;;(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
;; org中源码高亮显示
;(setq org-src-fontify-natively t)
;; 导出html时源码高亮显示
;(require 'htmlize)
;; 导出markdown
;(eval-after-load "org"
;  '(require 'ox-md nil t))


(setq org-confirm-babel-evaluate nil)

(add-to-list 'load-path "~/.emacs.d/elpa/ob-mermaid-20180522.1659")

(setq org-plantuml-jar-path (expand-file-name "~/MyDocuments/bin/plantuml.jar"))
;(setq ob-mermaid-cli-path "/usr/local/bin/mmdc")
(setq ob-mermaid-cli-path (expand-file-name "~/MyDocuments/bin/mmdc.sh"))
;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)
   (js . t)
   (python . t)
   (ruby . t)
   (mermaid . t)
   (C . t)
))


;; Enable plantuml-mode for PlantUML files
(setq plantuml-jar-path (expand-file-name "~/MyDocuments/bin/plantuml.jar"))
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
(add-to-list 'auto-mode-alist '("\\plantumlrc\\'" . plantuml-mode))
(add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode))
(add-to-list 'auto-mode-alist '("\\.pu\\'" . plantuml-mode))
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))

;;开启dot画图
(defvar org-list-allow-alphabetical t)
(defun  org-element-bold-successor           (arg))
(defun  org-element-code-successor           (arg))
(defun  org-element-entity-successor         (arg))
(defun  org-element-italic-successor         (arg))
(defun  org-element-latex-fragment-successor (arg))
(defun  org-element-strike-through-successor (arg))
(defun  org-element-subscript-successor      (arg))
(defun  org-element-superscript-successor    (arg))
(defun  org-element-underline-successor      (arg))
(defun  org-element-verbatim-successor       (arg))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)))


(provide 'init-org)
