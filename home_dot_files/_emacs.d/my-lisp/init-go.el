;; -*- coding: utf-8 -*-
;; File Name: init-go.el
;; Description:
;; Reference:
;; Author: amoblin <amoblin@gmail.com>
;; Created Time: 2021-05-24 一 15:59

(provide 'init-go)

(add-hook 'go-mode-hook '(lambda ()
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook '(lambda ()
  (local-set-key (kbd "C-c C-g") 'go-goto-imports)))
(add-hook 'go-mode-hook '(lambda ()
  (local-set-key (kbd "C-c C-f") 'gofmt)))
(add-hook 'before-save-hook 'gofmt-before-save)


;;设置company-mode 在go-mode时，开启
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)))



(defvar golang-goto-stack '())

(defun golang-jump-to-definition ()
  (interactive)
  (add-to-list 'golang-goto-stack
               (list (buffer-name) (point)))
  (godef-jump (point) nil))

(defun golang-jump-back ()
  (interactive)
  (let ((p (pop golang-goto-stack)))
    (if p (progn
            (switch-to-buffer (nth 0 p))
            (goto-char (nth 1 p))))))

;; Call Gofmt before saving
 (setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;;autocomplete
(set (make-local-variable 'company-backends) '(company-go))
(company-mode)

;; Godef jump key binding
(add-hook 'go-mode-hook '(lambda ()
 (local-set-key (kbd "M-.") 'godef-jump)))
(add-hook 'go-mode-hook '(lambda ()
 (local-set-key (kbd "M-,") 'pop-tag-mark)))
