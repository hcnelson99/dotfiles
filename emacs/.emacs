(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

(use-package evil
  :init (setq evil-want-integration nil)
  :config (evil-mode 1))

(use-package evil-numbers
  :after evil)

(use-package key-chord
  :after (evil evil-numbers)
  :config
    (key-chord-mode 1)
    (setq key-chord-two-keys-delay 0.2)
    (key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
    (key-chord-define evil-normal-state-map " k" 'evil-numbers/inc-at-pt)
    (key-chord-define evil-normal-state-map " j" 'evil-numbers/dec-at-pt))

(use-package magit)

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
 '(package-selected-packages (quote (evil-numbers key-chord use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
