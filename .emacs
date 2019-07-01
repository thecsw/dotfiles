(package-initialize)

(org-babel-load-file "~/.emacs.d/configuration.org")

(ac-config-default)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" default)))
 '(font-use-system-font t)
 '(org-log-done (quote time))
 '(package-selected-packages
   (quote
    (dracula-theme solidity-flycheck git-gutter-fringe solidity-mode go-gopath markdown-mode+ markdown-mode autopair go-gen-test go-scratch go-complete go-autocomplete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
 
(require 'autopair)
(autopair-global-mode)

(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)

(require 'git-gutter-fringe)
(setq-default left-fringe-width  20)
(setq-default right-fringe-width 20)

(provide '.emacs)
