(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds
   (quote
    ("\"https://www.smashingmagazine.com/feed/\"" "http://feeds.feedburner.com/paul-irish?format=xml")))
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Documents/orgfiles")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (evil-nerd-commenter go-mode php-mode tide magit ag markdown-mode pdf-tools no-littering powerline json-mode dired-quick-sort dired+ nodejs-repl tern js2-refactor origami company-quickhelp linum-relative neotree dashboard evil-leader evil emmet-mode dumb-jump counsel-projectile projectile ggtags smartparens auctex web-mode iedit beacon org-edna zenburn-theme zenburn company counsel swiper ace-window org-bullets which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
