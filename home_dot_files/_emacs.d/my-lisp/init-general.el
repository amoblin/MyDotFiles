;;
; 启动报错：Emacs-x86_64-10_14[76147:86409916] Failed to initialize color list unarchiver: Error Domain=NSCocoaErrorDomain Code=4864 "*** -[NSKeyedUnarchiver _initForReadingFromData:error:throwLegacyExceptions:]: non-keyed archive cannot be decoded by NSKeyedUnarchiver" UserInfo={NSDebugDescription=*** -[NSKeyedUnarchiver _initForReadingFromData:error:throwLegacyExceptions:]: non-keyed archive cannot be decoded by NSKeyedUnarchiver}
; 删除 ~/Library/Colors/Emacs.clr 即可。参考：https://stackoverflow.com/questions/52521587/emacs-error-when-i-call-it-in-the-terminal

;; 禁用启动画面
(setq inhibit-startup-screen t)

;; 启动时全屏
(add-to-list 'default-frame-alist '(fullscreen . maximized))

; GUI配置
;; 隐藏工具栏
(tool-bar-mode -1)
;; 禁用滚动条
(scroll-bar-mode -1)
;; 禁用menubar
(unless (display-graphic-p)
   (menu-bar-mode -1))

(global-auto-revert-mode t)

(setq default-frame-alist
    (append
    '( (top . 310)
       (left . 540)
       (width . 110)
       (height . 35))
       default-frame-alist))

(setq-default cursor-type 'bar) ; 设置光标为竖线，terminal中无法生效
;(setq-default cursor-type 'box) ; 设置光标为方块


;;(require 'maxframe)
;;(add-hook 'window-setup-hook 'maximize-frame t)

;;(require 'color-theme)
;;(color-theme-initialize)
;; dark
;;(color-theme-tty-dark)
;;(color-theme-sanityinc-tomorrow)


(defun my-set-background-color (&optional frame)
  "Set custom background color."
  (with-selected-frame (or frame (selected-frame))
    ;; 背景颜色
    (set-background-color "black")
    (set-foreground-color "white")
;    (set-background-color "honeydew2")
    )
  )

(add-hook 'after-make-frame-functions 'my-set-background-color)
(my-set-background-color)

;(set-cursor-color "black")
;(set-cursor-color "#ffffff")

;(setq default-frame-alist
;   '((cursor-color . "palegoldenrod")))

;; 当前行高亮
(global-hl-line-mode t)
;(set-face-background 'hl-line "#efefef")
(set-face-background 'hl-line "#333333")
(set-face-foreground 'highlight nil)
;; 在同一窗口打开文件
(setq ns-pop-up-frames nil)

;; iTerm2中配置Command + p等效于C-c p，从而实现Command + p模拟s-p

;; xxd: https://stackoverflow.com/questions/36321230/finding-the-hex-code-sequence-for-a-key-combination

;; https://www.csee.umbc.edu/portal/help/theory/ascii.txt

;; KeyCode: https://apple.stackexchange.com/questions/89981/remapping-keys-in-iterm2

;; keymapping:  0x3 0x70

; 这个没什么效果
;(setq mac-command-modifier 'super)

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
                        charset (font-spec :family "Heiti_SC" :size 14))
      ))

;(set-default-font "Source Code Pro 24")

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

; 修复eshell中git log中文乱码 https://answer-id.com/52923551
(setenv "LANG" "en_US.UTF-8")

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


;; kill buffer without confirm
(global-set-key [(control x) (k)] 'kill-this-buffer)

;; No Tabs
(setq-default indent-tabs-mode nil)

;; 自动折行
;(toggle-truncate-lines 1)
(global-visual-line-mode t)

;; 记住光标位置
(require 'saveplace)
(save-place-mode)

;; 不提示软连接到Git仓库里的文件
(setq vc-follow-symlinks nil)

(setq tab-width 2) ; 2空格缩进

;;(ac-config-default)

(setq redisplay-dont-pause t
  scroll-margin 10
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)


(defun window-split-toggle ()
  "Toggle between horizontal and vertical split with two windows."
  (interactive)
  (if (> (length (window-list)) 3)
      (error "Can't toggle with more than 3 windows!")
    (let ((func (if (window-full-height-p)
                    #'split-window-vertically
                  #'split-window-horizontally)))
      (delete-other-windows)
      (funcall func)
      (save-selected-window
        (other-window 1)
        (switch-to-buffer (other-buffer))))))


(provide 'init-general)
