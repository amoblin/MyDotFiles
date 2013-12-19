;; 禁用启动画面
(setq inhibit-startup-screen t)
;; 隐藏工具栏
(tool-bar-mode -1)
;; 禁用滚动条
(scroll-bar-mode -1)

;; 背景颜色
(set-background-color "black")
(set-foreground-color "white")
;; 当前行高亮
(global-hl-line-mode 1)
;(set-face-background 'hl-line "#efefef")
(set-face-background 'hl-line "#141414")
(set-face-foreground 'highlight nil)

;; 自动恢复
;;(desktop-save-mode 1)

;; 显示行号
(global-linum-mode 1)
(setq linum-format "%d ")
;; 添加文件更新时间戳
(add-hook 'before-save-hook 'time-stamp)

;; Org-Mode
(setq org-hide-leading-stars t)
(setq org-log-done 'time)
(define-key global-map "\C-ca" 'org-agenda)
;; Org Export HTML
(setq org-publish-project-alist
      '(("blog" .  (:base-directory "~/blog/source/org_posts/"
				    :base-extension "org"
				    :publishing-directory "~/blog/source/_posts/"
				    :sub-superscript ""
				    :recursive t
				    :publishing-function org-publish-org-to-html
				    :headline-levels 4
				    :html-extension "html"
				    :body-only t))))

;; Jade Mode
(add-to-list 'load-path "~/.emacs.d/vendor/jade-mode")
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

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

;; 设置elpa源
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; 在同一窗口打开文件
(setq ns-pop-up-frames nil)

;; markdown syntax height
(add-to-list 'load-path "~/.emacs.d/modes")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; evil
;(add-to-list 'load-path "~/.emacs.d/evil")
;(require 'evil)
;(evil-mode 1)
;(setq evil-default-state 'emacs)
;(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)
