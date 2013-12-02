;; 禁用启动画面
(setq inhibit-startup-screen t)
;; 隐藏工具栏
(tool-bar-mode -1)
;; 禁用滚动条
(scroll-bar-mode -1)
;; 背景颜色
(set-background-color "black")
(set-foreground-color "white")

;; 显示行号
(global-linum-mode 1)
(setq linum-format "%d ")

;; 字体和编码
(set-language-environment 'UTF-8)
(set-locale-environment "UTF-8")

(set-face-attribute 'default nil :height 160)
;(set-fontset-font 'default (font-spec :name "Hei"))
;(set-fontset-font "fontset-global" 'chinese-gb2312 '("Hei" . "gb2312.1980-0"))

;; UTF-8 settings
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

;; font
(set-frame-font "Courier New-16") ;; for Mac

;; 主题配色
