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
	("b" "Blog idea" entry (file+headline "~/Documents/orgfiles/i.org" "Blog Topics")
	 "* %?\n%T" :prepend t)
	("t" "To Do Items" entry (file+headline "~/Documents/orgfiles/shedule.org" "To Do Items")
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

(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode 1))

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

(use-package linum-relative
  :ensure
  :config
  (linum-relative-on))

(use-package no-littering
  :ensure t)

(use-package ag
  :ensure t)

(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jinja\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-engines-alist
        '(("django"   . "\\.html\\'")))
  (setq web-mode-enable-auto-closing t))

(use-package tide
  :ensure t
  :config
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1)))

(use-package php-mode
  :ensure t)

(use-package go-mode
  :ensure t)

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

(use-package evil
  :init
  (progn
    ;; if we don't have this evil overwrites the cursor color
    (setq evil-default-cursor t)

    ;; leader shortcuts

    ;; This has to be before we invoke evil-mode due to:
    ;; https://github.com/cofi/evil-leader/issues/10
    (use-package evil-leader
      :init (global-evil-leader-mode t)
      :config
      (progn
        (setq evil-leader/in-all-states t)
        ;; keyboard shortcuts
        (evil-leader/set-key
          "a" 'ag-project
          "A" 'ag
          "b" 'ido-switch-buffer
          "c" 'mc/mark-next-like-this
          "C" 'mc/mark-all-like-this
          "e" 'er/expand-region
          "E" 'mc/edit-lines
          "f" 'ido-find-file
          "g" 'magit-status
          "i" 'idomenu
          "j" 'ace-jump-mode
          "k" 'kill-buffer
          "K" 'kill-this-buffer
          "o" 'occur
          "p" 'magit-find-file-completing-read
          "r" 'recentf-ido-find-file
          "s" 'ag-project
          "t" 'bw-open-term
          "T" 'eshell
          "w" 'save-buffer
          "x" 'smex
          "li" 'evilnc-comment-or-uncomment-lines
          "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
          "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
          "lc" 'evilnc-copy-and-comment-lines
          "lp" 'evilnc-comment-or-uncomment-paragraphs
          "lr" 'comment-or-uncomment-region
          "lv" 'evilnc-toggle-invert-comment-line-by-line
          "."  'evilnc-copy-and-comment-operator
          "\\" 'evilnc-comment-operator ; if you prefer backslash key
          )))

    ;; boot evil by default
    (evil-mode 1))
  :config
  (progn
    ;; use ido to open files
    (define-key evil-ex-map "e " 'ido-find-file)
    (define-key evil-ex-map "b " 'ido-switch-buffer)

    (setq
     ;; h/l wrap around to next lines
     evil-cross-lines t)

    ;; esc should always quit: http://stackoverflow.com/a/10166400/61435
    (define-key evil-normal-state-map [escape] 'keyboard-quit)
    (define-key evil-visual-state-map [escape] 'keyboard-quit)
    (define-key minibuffer-local-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit)

    ;; modes to map to different default states
    (evil-set-initial-state 'calendar-mode 'emacs)
    (evil-set-initial-state 'org-mode 'emacs)
    (evil-set-initial-state 'elfeed-search 'emacs)))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to Einar's Emacs Dashboard")
  (setq dashboard-items '((recents . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda . 5))))

(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle))

(use-package js2-mode
  :ensure t
  :init
  (progn
    (add-hook 'js-mode-hook 'js2-minor-mode)
    ))

(use-package js2-refactor
  :ensure t
  :config
  (progn
    (js2r-add-keybindings-with-prefix "C-c C-m")
    (add-hook 'js2-mode #'js2-refactor-mode)))

(use-package tern
  :ensure tern
  :config
  (progn
    (add-hook 'js-mode-hook (lambda () (tern-mode t)))
    (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
    (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))))

(use-package nodejs-repl
  :ensure t)

(add-hook 'js-mode-hook
          (lambda ()
            (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-sexp)
            (define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
            (define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
            (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)))

(use-package json-mode
  :ensure t)

(use-package dired+
  :ensure t
  :config (require 'dired+))

(use-package dired-quick-sort
  :ensure t
  :config
  (dired-quick-sort-setup))

(use-package powerline :ensure t
:init (setq powerline-default-separator 'wave)
:config (progn
          (require 'powerline)
          (add-hook 'desktop-after-read-hook 'powerline-reset)
          (defface modes-ml-face '((t (:background "#002b36" :inherit mode-line)))
            "Powerline face for modes section of the mode-line"
            :group 'powerline)
          (defface file-ml-face '((t (:background "#586e75" :inherit mode-line)))
            "Powerline face for file and branch section of the mode-line"
            :group 'powerline)
          (defface line-ml-face '((t (:background "#93a1a1" :inherit mode-line)))
            "Powerline face for line number section of the mode-line"
            :group 'powerline)
          (defface pos-ml-face '((t (:background "#586e75" :inherit mode-line)))
            "Powerline face for file position section of the mode-line"
            :group 'powerline)
          (defface ml-fill-face '((t (:background "#93a1a1" :inherit mode-line)))
            "Powerline face used to fill the unused portion of the mode-line"
            :group 'powerline)
          (setq-default mode-line-format
                        '("%e"
                          (:eval
                           (let* ((file-name (buffer-file-name (current-buffer)))
                                  (active (powerline-selected-window-active))
                                  (separator-left (intern (format "powerline-%s-%s"
                                                                  (powerline-current-separator)
                                                                  (car powerline-default-separator-dir))))
                                  (separator-right (intern (format "powerline-%s-%s"
                                                                   (powerline-current-separator)
                                                                   (cdr powerline-default-separator-dir))))
                                  (lhs (list (powerline-major-mode 'modes-ml-face 'l)
                                             (powerline-process 'modes-ml-face 'l)
                                             (powerline-minor-modes 'modes-ml-face 'l)
                                             (powerline-raw " " 'modes-ml-face)
                                             (funcall separator-left 'modes-ml-face 'file-ml-face)

                                             (powerline-raw "[" 'file-ml-face)
                                             (powerline-raw (projectile-project-name) 'file-ml-face)
                                             (powerline-raw "] %b %*" 'file-ml-face)
                                             (powerline-raw (concat " "
                                                                    (when (and file-name vc-mode)
                                                                      (concat "(" (-> file-name
                                                                                      vc-working-revision
                                                                                      (string-utils-truncate-to 40))
                                                                              ")")))
                                                            'file-ml-face 'r)
                                             (funcall separator-left 'file-ml-face 'ml-fill-face)))

                                  (rhs (list (powerline-raw global-mode-string 'ml-fill-face 'r)
                                             (funcall separator-right 'ml-fill-face 'pos-ml-face)
                                             (powerline-raw "%p " 'pos-ml-face 'l)
                                             (funcall separator-right 'pos-ml-face 'line-ml-face)

                                             (powerline-raw " %4l " 'line-ml-face 'r))))

                             (concat (powerline-render lhs)
                                     (powerline-fill 'ml-fill-face (powerline-width rhs))
                                     (powerline-render rhs))))))))

(use-package pdf-tools
  :ensure t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package magit
  :ensure t
  :init
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package magithub-cache-file
  :after magit
  :config (magithub-feature-autoinject t))

(setq elfeed-db-directory "~/Documents/shared/elfeeddb")

(defun elfeed-mark-all-as-read ()
  (interactive)
  (mark-whole-buffer)
  (elfeed-search-untag-all-unread))

(use-package elfeed-goodies
  :ensure t
  :config
  (elfeed-goodies/setup))


(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/Documents/shared/elfeed.org")))


;; elfeed feed reader                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;shortcut functions
(defun bjm/elfeed-show-all ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-all"))
(defun bjm/elfeed-show-emacs ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-emacs"))
(defun bjm/elfeed-show-daily ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-daily"))
(defun bjm/elfeed-show-web ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-web"))
;;functions to support syncing .elfeed between machines
;;makes sure elfeed reads index from disk before launching
(defun bjm/elfeed-load-db-and-open ()
  "Wrapper to load the elfeed db from disk before opening"
  (interactive)
  (elfeed-db-load)
  (elfeed)
  (elfeed-search-update--force))

;;write to disk when quiting
(defun bjm/elfeed-save-db-and-bury ()
  "Wrapper to save the elfeed db to disk before burying buffer"
  (interactive)
  (elfeed-db-save)
  (quit-window))

(use-package elfeed
  :ensure t
  :config
  (global-set-key (kbd "C-x w") 'elfeed)
  :bind (:map elfeed-search-mode-map
              ("A" . bjm/elfeed-show-all)
              ("E" . bjm/elfeed-show-emacs)
              ("D" . bjm/elfeed-show-daily)
              ("W" . bjm/elfeed-show-web)
              ("q" . bjm/elfeed-save-db-and-bury)))

(use-package evil-nerd-commenter
  :ensure t
  )
