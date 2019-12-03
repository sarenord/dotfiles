(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

(require 'evil)
(evil-mode t)

;;; use-package package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))


;;; packages to install/use
(use-package ispell)
(use-package helm)
(use-package ewal
	     :init (setq ewal-use-built-in-always-p nil
			 ewal-use-built-in-on-failure-p t
			 ewal-built-in-palette "sexy material"
			 ewal-json-file "~/.cache/wal/colors.json")
	     :ensure t)
(use-package ewal-spacemacs-themes
	:config (progn
		  (load-theme 'ewal-spacemacs-modern t)
		  (enable-theme 'ewal-spacemacs-modern)))
(use-package pdf-tools)


;;; some configuration commands
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;;; variable setting



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#010d0c" "#2D6354" "#4E7151" "#428568" "#619369" "#B1A244" "#90A96C" "#bfcbb3"])
 '(custom-safe-themes
   (quote
    ("41098e2f8fa67dc51bbe89cce4fb7109f53a164e3a92356964c72f76d068587e" default)))
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#428568")
     ("NEXT" . "#428568")
     ("THEM" . "#90A96C")
     ("PROG" . "#619369")
     ("OKAY" . "#619369")
     ("DONT" . "#2D6354")
     ("FAIL" . "#2D6354")
     ("DONE" . "#718d73")
     ("NOTE" . "#428568")
     ("KLUDGE" . "#428568")
     ("HACK" . "#428568")
     ("TEMP" . "#428568")
     ("FIXME" . "#428568")
     ("XXX+" . "#428568")
     ("\\?\\?\\?+" . "#428568"))))
 '(package-selected-packages
   (quote
    (pdf-tools ewal-spacemacs-themes ewal use-package org-evil evil-visual-mark-mode)))
 '(pdf-view-midnight-colors (quote ("#bfcbb3" . "#021110"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
