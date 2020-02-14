; File Name: init-rss.el
; Author: amoblin <amoblin@gmail.com>
; Created Time: 2020-02-14 Fri 09:01

(use-package elfeed
  :ensure t
  :config
  (global-set-key (kbd "C-x w") 'elfeed)
  )

(defun my/browse-url ()
  (interactive)
  (if mark-active
      (browse-url (buffer-substring (region-beginning) (region-end)))
    (browse-url-at-point)
    )
  )

(setq browse-url-browser-function 'eww-browse-url)
(global-set-key (kbd "s-.") 'my/browse-url)
(global-set-key (kbd "C-c q .") 'my/browse-url)


(use-package elfeed-org
  :ensure t
  :init (elfeed-org)
  :config
  (setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org"))
  )


(use-package elfeed-goodies
  :ensure t
  :init (elfeed-goodies/setup)
  )

(provide 'init-rss)
