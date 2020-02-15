;; Emacs Shell Mode
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)

(when (featurep 'cocoa)
  ;; Initialize environment from user's shell to make eshell know every PATH by other shell.
  (use-package exec-path-from-shell
    :ensure t
    :init (exec-path-from-shell-initialize)
    )
  )

(defun copy-shell-environment-variables ()
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))
(copy-shell-environment-variables)
(setenv "VISUAL" "emacsclient")
(setenv "EDITOR" (getenv "VISUAL"))


;; multi-term.el
;(require 'multi-term)
;(setq multi-term-program "/bin/bash")
;(setq multi-term-program "/bin/zsh")
;(global-set-key (kbd "C-c z") (quote multi-term))

(global-set-key (kbd "C-c x") 'am-open-terminal)
(global-set-key (kbd "C-c e")
                '(lambda (command)
                   (interactive "sShell command: \n")
                   (if (display-graphic-p)
                       (shell-command command)
                     (shell-command (format "tmux split-window \"%s;readq\"" command))
                       )))

(defun am-open-terminal ()
  "Open a `shell' in a new window."
  (interactive)
  (if (display-graphic-p)
      (let ((buf (multi-term)))
        (switch-to-buffer (buf))
        )
    (shell-command "tmux split-window")
    )
  )

(defun shell-mode-config ()
    (set (make-local-variable 'scroll-margin) 0)
    (linum-mode -1)
;    (setq mode-line-format nil)
    (hl-line-mode nil)
    (face-remap-add-relative
     'hl-line '((:background "#000000") hl-line))
;    (ansi-color-for-comint-mode-on t)
    )

(add-hook 'term-mode-hook 'shell-mode-config)
(add-hook 'shell-mode-hook 'shell-mode-config)
(add-hook 'eshell-mode-hook 'shell-mode-config)

;(require 'aweshell)
;(load-file "~/.emacs.d/vendor/save-restore-shells.el")


(provide 'init-shell)
