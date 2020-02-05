;;
; 启动报错：Emacs-x86_64-10_14[76147:86409916] Failed to initialize color list unarchiver: Error Domain=NSCocoaErrorDomain Code=4864 "*** -[NSKeyedUnarchiver _initForReadingFromData:error:throwLegacyExceptions:]: non-keyed archive cannot be decoded by NSKeyedUnarchiver" UserInfo={NSDebugDescription=*** -[NSKeyedUnarchiver _initForReadingFromData:error:throwLegacyExceptions:]: non-keyed archive cannot be decoded by NSKeyedUnarchiver}
; 删除 ~/Library/Colors/Emacs.clr 即可


;; 禁用启动画面
(setq inhibit-startup-screen t)

;; 隐藏工具栏
;(tool-bar-mode -1)

;; 禁用menubar
(setq menu-bar-mode nil)

(global-auto-revert-mode t)

(set-default-font "Source Code Pro 24")

;; 设置第三方插件安装目录
(add-to-list 'load-path "~/.emacs.d/vendor")

;; 禁用滚动条
;(scroll-bar-mode -1)

;; kill buffer without confirm
(global-set-key [(control x) (k)] 'kill-this-buffer)

;; No Tabs
(setq-default indent-tabs-mode nil)

;; 自动折行
(toggle-truncate-lines 1)

;; 不提示软连接到Git仓库里的文件
(setq vc-follow-symlinks nil)

(setq tab-width 2) ; 2空格缩进

;;(ac-config-default)

(setq redisplay-dont-pause t
  scroll-margin 10
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;设置启动窗口位置大小
;也可以配置REG文件来实现(更高效)
;[HKEY_LOCAL_MACHINE\SOFTWARE\GNU\Emacs]
;"Emacs.Geometry"="100x30+240+70"

;; shortcut keybinding

;;(normal-erase-is-backspace-mode 1)
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "C-x C-c") 'kill-this-buffer)
(global-set-key (kbd "C-x t") 'multi-term)
(global-set-key (kbd "C-x d") 'neotree-toggle)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
;(global-set-key (kbd "C-x C-b") 'ivy-switch-buffer)

(setq default-frame-alist
    (append
    '( (top . 310)
       (left . 540)
       (width . 110)
       (height . 35))
       default-frame-alist))

(setq-default cursor-type 'bar) ; 设置光标为竖线
;(setq-default cursor-type 'box) ; 设置光标为方块

;; 启动时全屏
(defun fullscreen (&optional f)
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

(add-hook 'after-init-hook 'global-company-mode)

;;(require 'maxframe)
;;(add-hook 'window-setup-hook 'maximize-frame t)

;;(require 'color-theme)
;;(color-theme-initialize)
;; dark
;;(color-theme-tty-dark)
;;(color-theme-sanityinc-tomorrow)

;; 背景颜色
(set-background-color "black")
(set-foreground-color "white")

;(set-cursor-color "black")
;(set-cursor-color "#ffffff")

;(setq default-frame-alist
;   '((cursor-color . "palegoldenrod")))

;; 当前行高亮
(global-hl-line-mode 1)
;(set-face-background 'hl-line "#efefef")
(set-face-background 'hl-line "#333333")
(set-face-foreground 'highlight nil)
;; 在同一窗口打开文件
(setq ns-pop-up-frames nil)

;; 语法高亮
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(add-to-list 'auto-mode-alist '("\\.*rc$" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.*tmux$" . conf-unix-mode))

;; 自动恢复
;;(desktop-save-mode 1)

;; 显示行号
(global-linum-mode t)
(setq linum-format "%d ")
;; 添加文件更新时间戳
(add-hook 'before-save-hook 'time-stamp)
(add-hook 'before-save-hook 'delete-trailing-whitespace)


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
(global-set-key (kbd "C-c d") 'insert-date)

;; Emacs Shell Mode
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

(defun nolinum ()
  (global-linum-mode 0)
)
;;(add-hook 'shell-mode-hook 'nolinum)


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



(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; 设置elpa源
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; auto update package list
(when (not package-archive-contents)
  (package-refresh-contents))

;; projectile

(use-package projectile
   :ensure t
   :config
       (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
       (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
       (counsel-projectile-mode)
;       (require 'helm-projectile)
;       (helm-projectile-on)
       (projectile-mode +1))
;; fix find file bug
;(setq projectile-git-submodule-command nil)
;(setq projectile-enable-caching t)

;; Projectile
;(require 'projectile)
;(projectile-global-mode)

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
(require 'elpy)
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;;
(require 'all-the-icons)

(require 'neotree)
;;(use-package neotree
;;  :after
;;  ;; Load the above patches
;;  )

;; json lint
(require 'flycheck-demjsonlint)

(setq inhibit-compacting-font-caches t)
;;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-theme 'icons)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq js-indent-level 2)

;; dockerfile-mode
;(require 'dockerfile-mode)
;(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; multi-term.el
;(require 'multi-term)
;(setq multi-term-program "/bin/bash")
;(setq multi-term-program "/bin/zsh")
;(global-set-key (kbd "C-c z") (quote multi-term))


;; tabbar mode
;(require 'tabbar)
;(tabbar-mode t)
;; 禁用分组
;(setq tabbar-buffer-groups-function nil)

(global-set-key [(meta n)] 'tabbar-forward)
(global-set-key [(meta p)] 'tabbar-backward)

;; 80 column indicator
;(require 'fill-column-indicator)
;(setq fci-rule-width 1)
;(setq fci-rule-color "gray")
;(add-hook 'after-change-major-mode-hook 'fci-mode)
;(setq-default fci-rule-column 80)
;(setq fci-handle-truncate-lines nil)

;; zsh
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))


(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
   (lambda () (rainbow-mode t)))
(my-global-rainbow-mode t)

;; Org-Mode
;(require 'ox-gfm)
;(setq org-hide-leading-stars t)
(setq org-log-done 'time)
;(define-key global-map "\C-ca" 'org-agenda)
;; org mode默认遇到中文不自动换行，中文换行问题
;(add-hook 'org-mode-hook
;	  (lambda () (setq truncate-lines nil)))
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
;(require 'swift-mode)

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

;(when (featurep 'cocoa)
;  ;; Initialize environment from user's shell to make eshell know every PATH by other shell.
;  (require 'exec-path-from-shell)
;  (exec-path-from-shell-initialize))

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

;(defun copy-shell-environment-variables ()
;  (when (memq window-system '(mac ns))
;    (exec-path-from-shell-initialize)))
;(copy-shell-environment-variables)
;(setenv "VISUAL" "emacsclient")
;(setenv "EDITOR" (getenv "VISUAL"))

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

;; 设置备份目录
;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
(defvar autosave-dir
 (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
(make-directory autosave-dir t)
(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))
(defun make-auto-save-file-name ()
  (concat autosave-dir
   (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))
;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))

;; 字体和编码
;; 设置英文字体
(if (display-graphic-p)
(set-face-attribute 'default nil :font "Menlo 14" :height 140))
(if (display-graphic-p)
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
       charset (font-spec :family "Heiti_SC" :size 14))))

;; UTF-8 settings
(set-language-environment 'UTF-8)
(set-locale-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
;(setq default-process-coding-system
;      '(chinese-gbk . chinese-gbk))
;(setq-default pathname-coding-system 'chinese-gbk)

(set-default-coding-systems 'utf-8)
(set-file-name-coding-system 'utf-8-unix)
(set-next-selection-coding-system 'utf-8-unix)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(prefer-coding-system 'cp950)
(prefer-coding-system 'gb2312)
(prefer-coding-system 'cp936)
(prefer-coding-system 'gb18030)
(prefer-coding-system 'utf-16)
(prefer-coding-system 'utf-8-dos)
(prefer-coding-system 'utf-8-unix)


;; evil
;(add-to-list 'load-path "~/.emacs.d/evil")
;(require 'evil)
;(evil-mode 1)
;(setq evil-default-state 'emacs)
;(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)
;(custom-set-variables


;(defvar myPackages
;  '(better-defaults
;    ein
;    elpy
;    flycheck
;    material-theme
;    py-autopep8))

;(mapc #'(lambda (package)
;    (unless (package-installed-p package)
;      (package-install package)))
;      myPackages)

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
    (groovy-mode helm-projectile eglot yaml-mode wsd-mode swift-mode rspec-mode realgud-pry realgud-byebug plantuml-mode neotree multi-term multi-run magit-popup magit lsp-rust lsp-ruby json-mode jekyll-modes inf-ruby hierarchy helm go-mode ghub feature-mode exec-path-from-shell eterm-256color enh-ruby-mode ecukes easy-jekyll cucumber-goto-step ctags csv-mode counsel-projectile company-ycmd company-lsp color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme-github cnfonts auto-complete all-the-icons-ivy all-the-icons-dired ag))))
