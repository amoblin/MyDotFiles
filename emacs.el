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
;; 设置英文字体
(if (display-graphic-p)
(set-face-attribute 'default nil :font "Menlo 16" :height 160))
(if (display-graphic-p)
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
       charset (font-spec :family "Heiti_SC" :size 16))))

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

;; markdown syntax height
(add-to-list 'load-path "~/.emacs.d/modes")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
