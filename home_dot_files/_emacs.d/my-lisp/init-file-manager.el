; -*- coding: utf-8 -*-
; File Name: init-file-manager.el
; Author: amoblin <amoblin@gmail.com>
; Created Time: 2020-02-14 Fri 08:58

(defun tree-conf ()
  (local-set-key (kbd "s") 'am-open-terminal)
  (local-set-key (kbd "x") 'am-open-terminal)
  (local-set-key (kbd "j") (kbd "n"))
  (local-set-key (kbd "k") (kbd "p"))
  (local-set-key (kbd "l") (kbd "TAB"))
  )

(add-hook 'treemacs-mode-hook
          '(lambda ()
             (tree-conf)
             (linum-mode -1)
             )
          )

(add-hook 'neotree-mode-hook
          '(lambda ()
             (tree-conf)
             (local-set-key (kbd "u") (kbd "U"))
             )
          )

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-width 25)
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package neotree
  :ensure t
  :config
  (setq neo-autorefresh t)
;  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-theme 'icons)
  )
(setq projectile-switch-project-action 'neotree-projectile-action)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ffip-project-root))
        (file-name (buffer-file-name)))
    (if project-dir
        (progn
          (neotree-dir project-dir)
          (neotree-find file-name))
      (message "Could not find git project root."))))

;  (define-key projectile-mode-map (kbd "C-c C-p") 'neotree-project-dir)

(provide 'init-file-manager)
