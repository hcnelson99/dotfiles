;; We'll let customize handle fonts, but all other config should be in here
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")
	("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(setq doc-view-resolution 300)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq vc-handled-backends nil)

(setq backup-directory-alist `(("." . "~/.emacs.d/backup-files")))

(server-mode 1)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

(use-package base16-theme
  :config
  (load-theme 'base16-materia t))

(use-package magit)

(use-package org)

(use-package slime
  :config
  (setq inferior-lisp-program "ros run")
  (setq slime-contribs '(slime-fancy)))

(use-package paredit)
