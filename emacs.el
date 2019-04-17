;; 禁用启动画面
(setq inhibit-startup-screen t)
;; 隐藏工具栏
;;(tool-bar-mode -1)
;; 禁用menubar
(menu-bar-mode -1)
;; 禁用滚动条
;;(scroll-bar-mode -1)
;; kill buffer without confirm
(global-set-key [(control x) (k)] 'kill-this-buffer)
;; 设置第三方插件安装目录
(add-to-list 'load-path "~/.emacs.d/vendor")

;; No Tabs
(setq-default indent-tabs-mode nil)

(setq tab-width 2) ; 2空格缩进

;设置启动窗口位置大小
;也可以配置REG文件来实现(更高效)
;[HKEY_LOCAL_MACHINE\SOFTWARE\GNU\Emacs]
;"Emacs.Geometry"="100x30+240+70"

(setq default-frame-alist
    (append
    '( (top . 310)
       (left . 540)
       (width . 110)
       (height . 35))
       default-frame-alist))

(setq-default cursor-type 'bar) ; 设置光标为竖线 
;(setq-default cursor-type 'box) ; 设置光标为方块 

(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)))

;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))
(setq org-plantuml-jar-path (expand-file-name "~/MyDocuments/bin/plantuml.jar"))

;; Enable plantuml-mode for PlantUML files
(setq plantuml-jar-path (expand-file-name "~/MyDocuments/bin/plantuml.jar"))
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
(add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode))
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))


;; 启动时全屏
(defun fullscreen (&optional f)
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

;;(require 'maxframe)
;;(add-hook 'window-setup-hook 'maximize-frame t)

;;(require 'color-theme)
;;(color-theme-initialize)
;; dark
;;(color-theme-tty-dark)

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
(global-linum-mode 1)
(setq linum-format "%d ")
;; 添加文件更新时间戳
(add-hook 'before-save-hook 'time-stamp)

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


(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; 设置elpa源
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
;; auto update package list
(when (not package-archive-contents)
  (package-refresh-contents))

(require 'neotree)
(neotree-toggle)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; Org-Mode
;(require 'ox-gfm)
;(setq org-hide-leading-stars t)
;(setq org-log-done 'time)
;(define-key global-map "\C-ca" 'org-agenda)
;(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
;(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
;; org中源码高亮显示
;(setq org-src-fontify-natively t)
;; 导出html时源码高亮显示
;(require 'htmlize)
;; 导出markdown
;(eval-after-load "org"
;  '(require 'ox-md nil t))

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
(add-to-list 'auto-mode-alist '("Podfile$" . ruby-mode)) ;; support Podfiles
(add-to-list 'auto-mode-alist '("\\.podspec$" . ruby-mode)) ;; support Podspecs
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))

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
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system
      '(chinese-gbk . chinese-gbk))
(setq-default pathname-coding-system 'chinese-gbk)

;; evil
;(add-to-list 'load-path "~/.emacs.d/evil")
;(require 'evil)
;(evil-mode 1)
;(setq evil-default-state 'emacs)
;(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode+ yaml-mode dart-mode vue-mode json-mode neotree markdown-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
