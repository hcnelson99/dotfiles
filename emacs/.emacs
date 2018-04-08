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

(setf sentence-end-double-space nil)

(global-subword-mode 1)

(global-set-key (kbd "M-o") 'other-window)
;; unbind C-x o until we learn the above
(global-unset-key (kbd "C-x o"))
;; Use C-/ instead for now
(global-unset-key (kbd "C-x u"))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

(use-package smex
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands))

(use-package base16-theme
  :config
  (load-theme 'base16-materia t))

(use-package ws-butler
  :config
  (add-hook 'prog-mode-hook #'ws-butler-mode))

(use-package magit)

(use-package org)

(use-package slime
  :config
  (setq inferior-lisp-program "ros run")
  (setq slime-contribs '(slime-fancy)))

(use-package paredit)
