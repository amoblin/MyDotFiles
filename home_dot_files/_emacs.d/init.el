(add-to-list 'load-path "~/.emacs.d/my-lisp")

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ("melpa-stable" . "http://elpa.emacs-china.org/melpa-stable/")
			 ("marmalade" . "http://elpa.emacs-china.org/marmalade/")
			 ))
;; 设置elpa源
(setq _package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
			 ))
(package-initialize)

;; auto update package list
(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(require 'init-general)
(require 'init-shell)
(require 'init-file-manager)
(require 'init-rss)
(require 'init-org)
(require 'init-yas)
(require 'init-programming)
(require 'init-op)

;; 设置第三方插件安装目录
(add-to-list 'load-path "~/.emacs.d/vendor")

;; shortcut keybinding

;;(normal-erase-is-backspace-mode 1)
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
;(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(defun my/switch-env ()
  (interactive)
  (if (display-graphic-p)
      (switch-to-next-buffer)
    (save-buffers-kill-terminal)
    )
  )

(global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "C-x C-c") 'my/switch-env)
;;(setq server-kill-new-buffers nil)

(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)

(add-hook 'after-init-hook 'global-company-mode)

;; 语法高亮
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(add-to-list 'auto-mode-alist '("\\.*rc$" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.*config$" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.*gitcustom$" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.*tmux$" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))

(require 'whitespace)
(setq-default show-trailing-whitespace t)

;; 自动恢复
;;(desktop-save-mode 1)

;; 显示行号
(global-linum-mode t)
(setq linum-format " %d ")

;; 添加文件更新时间戳
(add-hook 'before-save-hook 'time-stamp)

;; 保存文件时删除空白符
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun insert-date (prefix)
  "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
  (interactive "P")
  (let ((format (cond
		 ((not prefix) "%d.%m.%Y")
		 ((equal prefix '(4)) "%Y-%m-%d %H:%M:%S")
		 ((equal prefix '(16)) "%A, %d. %B %Y")))
	(system-time-locale "zh_CN"))
    (insert (format-time-string format))))

(global-set-key (kbd "C-c SPC") 'window-split-toggle)
(global-set-key (kbd "C-c f") 'treemacs)
(global-set-key (kbd "C-c n") 'neotree-toggle)
(global-set-key (kbd "C-c d") 'insert-date)

;; pyim
(use-package pyim
  :ensure nil
  :config
  (global-set-key (kbd "C-\\") 'toggle-input-method)
  (use-package pyim-basedict
    :ensure nil
    :config (pyim-basedict-enable))

  (setq default-input-method "pyim")

  (pyim-isearch-mode 1)
  (setq pyim-page-tooltip 'popup)
  (setq pyim-page-length 10)

  (add-hook 'emacs-startup-hook
            '(lambda () (pyim-restart-1 t)))

  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-auto-english
                  pyim-probe-isearch-mode
                  pyim-probe-program-mode
                  pyim-probe-org-structure-template))

  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))

  (define-key pyim-mode-map "." 'pyim-page-next-page)
  (define-key pyim-mode-map "," 'pyim-page-previous-page)
  (define-key pyim-mode-map ";"
    (lambda ()
      (interactive)
      (pyim-page-select-word-by-number 2)))
  :bind
  (("M-j" . pyim-convert-string-at-point) ;与 pyim-probe-dynamic-english 配合
   ("C-;" . pyim-delete-word-from-personal-buffer)
   ))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'zenburn t)

(use-package doom-themes
  :ensure t
  :init ;(load-theme 'doom-one t)
  :config
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Corrects (and improves) org-mode's native fontification.
  ;;(doom-themes-org-config)

  ;; Enable custom treemacs theme (all-the-icons must be installed!)
  (doom-themes-treemacs-config)
  )

;; projectile
(use-package counsel-projectile
  :ensure t
)

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (counsel-projectile-mode)
;;       (require 'helm-projectile)
;;       (helm-projectile-on)
;;(projectile-global-mode)
  (projectile-mode +1)
  )
;; fix find file bug
;;(setq projectile-git-submodule-command nil)
;;(setq projectile-enable-caching t)

(use-package ace-window
  :ensure t
  :custom-face
;;  (aw-leading-char-face ((t (:inherit font-lock-keyword-face :bold t :height 3.0))))
;;  (aw-mode-line-face ((t (:inherit mode-line-emphasis :bold t))))
  :config
  (global-set-key (kbd "C-x o") 'ace-window)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  )

(show-paren-mode 1)

(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "C-:") 'avy-goto-char)
  (global-set-key (kbd "M-g w") 'avy-goto-word-1)
  )

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (setq magit-diff-refine-hunk (quote all))
  (setq magit-display-buffer-function
        (lambda (buffer)
          (display-buffer
           buffer (if (and (derived-mode-p 'magit-mode)
                           (memq (with-current-buffer buffer major-mode)
                                 '(magit-process-mode
                                   magit-revision-mode
                                   magit-diff-mode
                                   magit-stash-mode
                                   magit-status-mode)))
                      nil
                    '(display-buffer-same-window)))))
  )

(use-package smartparens
  :ensure t
  :init (require 'smartparens-config)
  :config
  (smartparens-global-mode)
  )

(use-package ws-butler
  :ensure t
  :config
  (ws-butler-global-mode)
  )

(use-package makefile-executor
  :ensure t
  :config
  (add-hook 'makefile-mode-hook 'makefile-executor-mode))

;; CSV config
;;(when (fboundp 'csv-mode)

;;  (defun my-config ()
;;    "For use in `csv-mode-hook'."
;;    (local-set-key (kbd "tab") 'csv-forward-field)
;;    (local-set-key (kbd "S-TAB") 'csv-backward-field)
;;    ;; more stuff here
;;    )

;;  (add-hook 'csv-mode-hook 'my-config)
;;  )

(add-hook 'csv-mode-hook ;; guessing
          '(lambda ()
             (local-set-key (kbd "TAB") 'csv-forward-field)
             (local-set-key (kbd "<backtab>") 'csv-backward-field)
             (local-set-key (kbd "C-c h") 'csv-header-line)
             (local-set-key (kbd "C-c a") (kbd "C-c C-a C-c h C-c h"))
             (local-set-key (kbd "C-c u") (kbd "C-c C-u C-c h C-c h"))
             (csv-header-line)
             ))

(use-package all-the-icons
  :ensure t
  :init (require 'all-the-icons)
)

;; json lint
;(use-package flycheck-demjsonlint
;  :ensure t
;)

(setq inhibit-compacting-font-caches t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq js-indent-level 2)

;; dockerfile-mode
;(require 'dockerfile-mode)
;(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))


;; tabbar mode
;;(require 'tabbar)
;;(tabbar-mode t)
;; 禁用分组
;;(setq tabbar-buffer-groups-function nil)
;;(global-set-key [(meta n)] 'tabbar-forward)
;;(global-set-key [(meta p)] 'tabbar-backward)

;; 80 column indicator
;;(require 'fill-column-indicator)
;;(setq fci-rule-width 1)
;;(setq fci-rule-color "gray")
;;(add-hook 'after-change-major-mode-hook 'fci-mode)
;;(setq-default fci-rule-column 80)
;;(setq fci-handle-truncate-lines nil)


(use-package rainbow-mode
  :ensure t
  :config (rainbow-mode t)
)
(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
   (lambda () (rainbow-mode t)))
(my-global-rainbow-mode t)

;; Common Lisp
;; slime setup
;;(setq inferior-lisp-program "sbcl")
;;(require 'slime)
;;(slime-setup)

;; Presentation/ Slide
;; retrieve at https://github.com/yjwen/org-reveal/
;;(require 'ox-reveal)

;; Adaptive Filling
(setq adaptive-fill-regexp "[ \t]+\\|[ \t]*\\([0-9]+\\.\\|\\*+\\)[ \t]*")

;; 语法高亮
;;(add-auto-mode 'ruby-mode "Podfile\\'" "\\.podspec\\'")
;;(add-to-list 'auto-mode-alist '("Podfile$" . ruby-mode)) ;; support Podfiles
;;(add-to-list 'auto-mode-alist '("\\.podspec$" . ruby-mode)) ;; support Podspecs
;;(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))


(use-package eglot
  :ensure t
)

;;(add-hook 'ruby-mode-hook 'eglot-ensure)
;;(add-to-list 'eglot-server-programs '(ruby-mode . ("solargraph" "socket")))

;;(require 'company-lsp)
;;(push 'company-lsp company-backends)

;; iimage mode
;;(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
;;(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit font-lock-keyword-face :bold t :height 3.0))))
 '(aw-mode-line-face ((t (:inherit mode-line-emphasis :bold t)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode typescript-mode nginx-mode htmlize gtags origami ace-link undo-tree org-preview-html xclip pyim-wbdict pyim ws-butler smartparens rainbow-delimiters ranger elfeed-goodies elfeed-org elfeed treemacs-icons-dired doom-themes treemacs desktop+ makefile-executor groovy-mode helm-projectile eglot yaml-mode wsd-mode swift-mode rspec-mode realgud-pry realgud-byebug plantuml-mode neotree multi-term multi-run magit-popup magit lsp-rust lsp-ruby json-mode jekyll-modes inf-ruby hierarchy helm go-mode ghub feature-mode exec-path-from-shell eterm-256color enh-ruby-mode ecukes easy-jekyll cucumber-goto-step ctags csv-mode counsel-projectile company-ycmd company-lsp color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme-github cnfonts auto-complete all-the-icons-ivy all-the-icons-dired ag))))
