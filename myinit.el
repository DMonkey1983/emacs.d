(setq inhibit-startup-message t)
(tool-bar-mode -1)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(custom-set-variables
 '(org-directory "~/Documents/orgfiles")
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 )

(global-set-key "\C-ca" 'org-agenda)

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files (list "~/Documents/orgfiles/gcal.org"
			     "~/Documents/orgfiles/i.org"
			     "~/Documents/orgfiles/shedule.org"))
(setq org-capture-templates
      '(("a" "Appointment" entry (file+headline "~/Documents/orgfiles/gcal.org" "Appointments")
	 "* TODO %?\n:PROPERTIES:\n\n:END\nDEADLINE: %^T \n %i\n")
	("n" "Note" entry (file+headline "~/Documents/orgfiles/notes.org" "Notes")
	 "* Note %?\n%T")
	("l" "Link" entry (file+headline "~/Documents/orgfiles/Links.org" "Links")
	 "* %? ?^L %^g \n%T" :prepend t)
	("n" "Blog idea" entry (file+headline "~/Documents/orgfiles/i.org" "Blog Topics")
	 "* %?\n%T" :prepend t)
	("n" "To Do Items" entry (file+headline "~/Documents/orgfiles/i.org" "To Do Items")
	 "* %?\n%T" :prepend t)

	("j" "Journal" entry (file+datetree "~/Documents/orgfiles/journal.org")
	 "*%?\nEntered on %U\n %i\n %a")))

(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(defalias 'list-buffers 'ibuffer-other-window)
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("org" (name . "^.*org$"))

               ("web" (or (mode . web-mode) (mode . js2-mode)))
               ("shell" (or(mode . eshell-mode) (mode . shell-mode)))
               ("mu4e" (name . "\*mu4e\*"))
               ("programming" (or
                               (mode . python-mode)
                               (mode . c++-mode)))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ))))
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-auto-mode 1)
            (ibuffer-switch-to-saved-filter-groups "default")))

(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-expert t)

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

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup))

(use-package yasnippet
  :ensure t
  :init
    (yas-global-mode 1))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode t))

(global-hl-line-mode t)

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

(use-package iedit
  :ensure t)

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t)
  (show-smartparens-global-mode t))
(add-hook 'markdown-mode-hook 'turn-on-smartparens-mode)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jinja\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (setq web-mode-engines-alist
	'(("django"   . "\\.html\\'")))
  (setq web-mode-enable-auto-closing t))

(use-package tex
  :ensure auctex)

(use-package ggtags
  :ensure t
  :config
  (add-hook 'c-mode-common-hoook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode)
                (ggtags-mode 1))))
  )

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
(setq projectile-completion-system 'ivy))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-on))

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g x" . dumb-jump-go-prefered-external)
         ("M-g z" . dumb-jump-go-external-other-window))
  :config (setq dumb-jump-selector 'ivy)
  :init
  (dumb-jump-mode)
  :ensure)

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'sqml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode)
)
