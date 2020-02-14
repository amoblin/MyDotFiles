(add-to-list 'load-path "~/.emacs.d/my-lisp")

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; 设置elpa源
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(require 'init-general)
(require 'init-shell)
(require 'init-file-manager)
(require 'init-rss)
(require 'init-org)
(require 'init-yas)

;; 设置第三方插件安装目录
(add-to-list 'load-path "~/.emacs.d/vendor")

;; shortcut keybinding

;;(normal-erase-is-backspace-mode 1)
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
;(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "C-x C-c") 'kill-this-buffer)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-b") 'ivy-switch-buffer)

(add-hook 'after-init-hook 'global-company-mode)

;; 语法高亮
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(add-to-list 'auto-mode-alist '("\\.*rc$" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.*config$" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.*gitcustom$" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.*tmux$" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))

;; 自动恢复
;;(desktop-save-mode 1)

;; 显示行号
(global-linum-mode t)
(setq linum-format " %d ")

;; 添加文件更新时间戳
(add-hook 'before-save-hook 'time-stamp)

;; 保存文件时删除空白符
;(add-hook 'before-save-hook 'delete-trailing-whitespace)

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
(global-set-key (kbd "C-c x") 'am-open-terminal)
(global-set-key (kbd "C-c f") 'treemacs)
(global-set-key (kbd "C-c n") 'neotree-toggle)
(global-set-key (kbd "C-c d") 'insert-date)
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)

;; auto update package list
(when (not package-archive-contents)
  (package-refresh-contents))

;; 自动安装包
;(defvar myPackages
;  '(better-defaults
;    ein
;    elpy
;    flycheck
;    material-theme
;    py-autopep8))

;(mapc #'(lambda (package)
;          (unless (package-installed-p package)
;            (package-install package)))
;      myPackages)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'zenburn t)

(use-package doom-themes
    :init ;(load-theme 'doom-one t)
    :config
    ;; Enable flashing mode-line on errors
    (doom-themes-visual-bell-config)

    ;; Corrects (and improves) org-mode's native fontification.
    ;(doom-themes-org-config)

    ;; Enable custom treemacs theme (all-the-icons must be installed!)
    (doom-themes-treemacs-config)
    )

;; projectile
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (counsel-projectile-mode)
;       (require 'helm-projectile)
;       (helm-projectile-on)
;(projectile-global-mode)
  (projectile-mode +1)
  )
;; fix find file bug
;(setq projectile-git-submodule-command nil)
;(setq projectile-enable-caching t)


(use-package makefile-executor
  :config
  (add-hook 'makefile-mode-hook 'makefile-executor-mode))

;; CSV config
;(when (fboundp 'csv-mode)

;  (defun my-config ()
;    "For use in `csv-mode-hook'."
;    (local-set-key (kbd "tab") 'csv-forward-field)
;    (local-set-key (kbd "S-TAB") 'csv-backward-field)
;    ;; more stuff here
;    )

;  (add-hook 'csv-mode-hook 'my-config)
;  )

(add-hook 'csv-mode-hook ;; guessing
          '(lambda ()
             (local-set-key (kbd "TAB") 'csv-forward-field)
             (local-set-key (kbd "<backtab>") 'csv-backward-field)
             (local-set-key (kbd "C-c h") 'csv-header-line)
             (local-set-key (kbd "C-c a") (kbd "C-c C-a C-c h C-c h"))
             (local-set-key (kbd "C-c u") (kbd "C-c C-u C-c h C-c h"))
             (csv-header-line)
             ))

;; python dev
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(require 'all-the-icons)

;; json lint
(require 'flycheck-demjsonlint)

(setq inhibit-compacting-font-caches t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq js-indent-level 2)

;; dockerfile-mode
;(require 'dockerfile-mode)
;(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))


;; tabbar mode
;(require 'tabbar)
;(tabbar-mode t)
;; 禁用分组
;(setq tabbar-buffer-groups-function nil)
;(global-set-key [(meta n)] 'tabbar-forward)
;(global-set-key [(meta p)] 'tabbar-backward)

;; 80 column indicator
;(require 'fill-column-indicator)
;(setq fci-rule-width 1)
;(setq fci-rule-color "gray")
;(add-hook 'after-change-major-mode-hook 'fci-mode)
;(setq-default fci-rule-column 80)
;(setq fci-handle-truncate-lines nil)


(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
   (lambda () (rainbow-mode t)))
(my-global-rainbow-mode t)

;; Golang
;(require 'go-mode)

;; Common Lisp
; slime setup
;(setq inferior-lisp-program "sbcl")
;(require 'slime)
;(slime-setup)

;; Presentation/ Slide
;; retrieve at https://github.com/yjwen/org-reveal/
;(require 'ox-reveal)

;; Swift Mode
(use-package swift-mode
  :ensure t
  )

;; Markdown Mode
(add-to-list 'load-path "~/.emacs.d/dev-repo/markdown-mode")
;;(add-to-list 'load-path "~/.emacs.d/modes")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.apib\\'" . markdown-mode))

;; PHP Mode
;(require 'php-mode)
;(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
;(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
;(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; Jade Mode
;(add-to-list 'load-path "~/.emacs.d/vendor/jade-mode")
;(require 'sws-mode)
;(require 'jade-mode)
;(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
;(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; web mode
;(require 'web-mode)
;(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))


;; Adaptive Filling
(setq adaptive-fill-regexp "[ \t]+\\|[ \t]*\\([0-9]+\\.\\|\\*+\\)[ \t]*")

;; 语法高亮
;(add-auto-mode 'ruby-mode "Podfile\\'" "\\.podspec\\'")
;(add-to-list 'auto-mode-alist '("Podfile$" . ruby-mode)) ;; support Podfiles
;(add-to-list 'auto-mode-alist '("\\.podspec$" . ruby-mode)) ;; support Podspecs
;(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))


(require 'eglot)
;(add-hook 'ruby-mode-hook 'eglot-ensure)
;(add-to-list 'eglot-server-programs '(ruby-mode . ("solargraph" "socket")))

;(require 'lsp-mode)
;(require 'lsp-clients)

;(lsp-register-client
; (make-lsp-client :new-connection (lsp-tramp-connection "solargraph socket")
;                  :major-modes '(ruby-mode)
;                  :remote? t
;                  :server-id 'solargraph))

;(add-hook 'ruby-mode-hook #'lsp)

;(require 'company-lsp)
;(push 'company-lsp company-backends)

;(lsp-define-stdio-client
; lsp-ruby-mtsmfm "ruby"
; nil
; '("language_server-ruby" "--experimental-features")
; :initialize 'lsp-ruby--initialize-client)

;(lsp-define-stdio-client 'ruby-mode "ruby" 'stdio
;                         #'projectile-project-root
;                         '("solargraph socket"))

(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(setq rspec-use-rvm t)
(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))

(ad-activate 'rspec-compile)

;; iimage mode
;(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
;(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)


;; evil
;(add-to-list 'load-path "~/.emacs.d/evil")
;(require 'evil)
;(evil-mode 1)
;(setq evil-default-state 'emacs)
;(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)
;(custom-set-variables


;(elpy-enable)
;(elpy-use-ipython)

;; use flycheck not flymake with elpy
;(when (require 'flycheck nil t)
;  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
;(require 'py-autopep8)
;(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
; '(custom-safe-themes
;   (quote
;    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
; '(menu-bar-mode nil)
; '(package-selected-packages
;   (quote
;    (eterm-256color multi-run multi-term color-theme-sanityinc-solarized color-theme-github color-theme-sanityinc-tomorrow cnfonts jekyll-modes exec-path-from-shell easy-jekyll counsel-projectile counsel ivy helm projectile markdown-mode+ yaml-mode dart-mode vue-mode json-mode neotree markdown-mode)))
; '(scroll-bar-mode nil)
; '(tool-bar-mode nil)
; (counsel-projectile-mode)
; '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (elfeed-goodies elfeed-org elfeed treemacs-icons-dired doom-themes treemacs desktop+ makefile-executor groovy-mode helm-projectile eglot yaml-mode wsd-mode swift-mode rspec-mode realgud-pry realgud-byebug plantuml-mode neotree multi-term multi-run magit-popup magit lsp-rust lsp-ruby json-mode jekyll-modes inf-ruby hierarchy helm go-mode ghub feature-mode exec-path-from-shell eterm-256color enh-ruby-mode ecukes easy-jekyll cucumber-goto-step ctags csv-mode counsel-projectile company-ycmd company-lsp color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme-github cnfonts auto-complete all-the-icons-ivy all-the-icons-dired ag))))
