(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq vc-handled-backends nil) ; disable emacs version control
(global-unset-key (kbd "C-u"))

(setq backup-directory-alist `(("." . "~/.emacs.d/backup-files")))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

(use-package base16-theme
  :config
  (load-theme 'base16-materia t))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(use-package evil-leader
  :config (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "r" 'eval-buffer
    "w" 'save-buffer
    "j" 'evil-numbers/dec-at-pt
    "k" 'evil-numbers/inc-at-pt
    "q" 'kill-this-buffer))

(use-package evil
  :init (setq evil-want-integration nil)
  :config
  (evil-mode 1)
  (evil-define-key 'normal (current-global-map)
    (kbd "C-j") 'evil-window-down
    (kbd "C-k") 'evil-window-up
    (kbd "C-h") 'evil-window-left
    (kbd "C-l") 'evil-window-right
    (kbd "C-u") 'evil-scroll-up))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package evil-numbers)
  

(use-package key-chord
  :config
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.1)
  (key-chord-define evil-insert-state-map  "jk" 'evil-normal-state))

(use-package magit)
(use-package evil-magit
  :config
  (key-chord-define evil-normal-state-map " g" 'magit-status))

(use-package org)
(use-package evil-org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
	    (lambda ()
	      (evil-org-set-key-theme))))

(use-package slime
  :config
  (setq inferior-lisp-program "ros run")
  (setq slime-contribs '(slime-fancy)))

(use-package parinfer
  :ensure t
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
	     pretty-parens  ; different paren styles for different modes.
	     evil           ; If you use Evil.
	     smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
	     smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (parinfer slime use-package key-chord evil-surround evil-org evil-numbers evil-magit evil-commentary base16-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
