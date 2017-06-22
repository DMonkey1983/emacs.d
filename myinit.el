(setq inhibit-startup-message t)
(tool-bar-mode -1)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(defalias 'list-buffers 'ibuffer-other-window)

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    ))

(use-package counsel
  :ensure t
  )

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind(("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (setq enable-recursive-minibuffers t)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package company
  :ensure t
  :defer t
  :init (global-company-mode)
  :config
  (progn
    (bind-key [remap completion-at-point] #'company-complete company-mode-map)

    (setq company-tooltip-align-annotations t
	  company-show-numbers t)
    (setq company-dabbrev-downcase nil))
  :diminish company-mode)

(use-package zenburn-theme
  :ensure t
  )

(load-theme 'zenburn t)
