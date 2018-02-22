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

(use-package evil-numbers
  :after evil)

(use-package key-chord
    :after (evil evil-numbers)
    :config
	(key-chord-mode 1)
	(key-chord-define evil-normal-state-map " r" 'eval-buffer)
	(setq key-chord-two-keys-delay 0.2)
	(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
	(key-chord-define evil-normal-state-map " k" 'evil-numbers/inc-at-pt)
	(key-chord-define evil-normal-state-map " j" 'evil-numbers/dec-at-pt)
	(key-chord-define evil-normal-state-map " w" 'save-buffer)
	(key-chord-define evil-normal-state-map " q" 'kill-this-buffer))

(use-package magit)

(use-package evil-magit
  :after magit
  :config
    (key-chord-define evil-normal-state-map " g" 'magit-status))

(use-package org)

(use-package evil-org
    :after org
    :config
	(add-hook 'org-mode-hook 'evil-org-mode)
	(add-hook 'evil-org-mode-hook
	    (lambda ()
	    (evil-org-set-key-theme))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil-magit evil-numbers key-chord use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
