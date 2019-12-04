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
(use-package ispell :ensure t)
(use-package helm :ensure t)

(use-package org-bullets :ensure t
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )


(use-package ewal :ensure t
	     :init (setq ewal-use-built-in-always-p nil
			 ewal-use-built-in-on-failure-p t
			 ewal-built-in-palette "sexy material"
			 ewal-json-file "~/.cache/wal/colors.json")
	     )
(use-package ewal-spacemacs-themes
	:config (progn
		  (load-theme 'ewal-spacemacs-modern t)
		  (enable-theme 'ewal-spacemacs-modern))
	)

(use-package ivy :ensure t
  :diminish (ivy-mode . "")
  :init (ivy-mode 1)
  :bind (:map ivy-mode-map
	      ("C-'" . ivy-avy))
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 20)
  (setq ivy-count-format "(%d/%d) ")
  )
(use-package counsel :ensure t
  :bind*
  (("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-x C-r" . counsel-recentf)
   ("C-c f" . counsel-git)
   ("C-c s" . counsel-git-grep)
   ("C-c /" . counsel-ag)
   ("C-c l" . counsel-locate))
   )

(use-package which-key :ensure t
  :init (which-key-mode)
  :config
  (which-key-setup-side-window-right-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.05)
  )

(use-package pdf-tools
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-page)
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
  (add-hook 'pdf-view-mode-hook (lambda () (cua-mode 0)))

  (define-key pdf-view-mode-map (kbd "h") 'image-backward-hscroll)
  (define-key pdf-view-mode-map (kbd "j") 'pdf-view-next-line-or-next-page)
  (define-key pdf-view-mode-map (kbd "k") 'pdf-view-previous-line-or-next-page)
  (define-key pdf-view-mode-map (kbd "l") 'image-forward-hscroll)
  )
(use-package key-chord
  :init (key-chord-mode 1)
  :config
  )



;;; some configuration commands
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;;; key bindings
(key-chord-define-global "  " 'helm-M-x)

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
    (org-bullets which-key ivy go-mode pdf-tools ewal-spacemacs-themes ewal use-package org-evil evil-visual-mark-mode)))
 '(pdf-view-midnight-colors (quote ("#bfcbb3" . "#021110"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )