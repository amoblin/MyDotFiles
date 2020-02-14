; File Name: init-programming.el
; Author: amoblin <amoblin@gmail.com>
; Created Time: 2020-02-14 Fri 09:14

;; Golang
;(require 'go-mode)

;; Swift Mode
(use-package swift-mode
  :ensure t
  )

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

;; python dev
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;(require 'lsp-mode)
;(require 'lsp-clients)

;(lsp-register-client
; (make-lsp-client :new-connection (lsp-tramp-connection "solargraph socket")
;                  :major-modes '(ruby-mode)
;                  :remote? t
;                  :server-id 'solargraph))

;(add-hook 'ruby-mode-hook #'lsp)

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

(provide 'init-programming)
