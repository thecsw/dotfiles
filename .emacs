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
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(blink-cursor-mode t)
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e")))
 '(font-use-system-font t)
 '(org-log-done (quote time))
 '(package-selected-packages
   (quote
    (dracula-theme solidity-flycheck git-gutter-fringe solidity-mode go-gopath markdown-mode+ markdown-mode autopair go-gen-test go-scratch go-complete go-autocomplete)))
 '(save-place-mode t)
 '(show-paren-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "unspecified-bg" :foreground "#f8f8f2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default"))))
 '(line-number ((t (:inherit nil))))
 '(linum ((t (:background "unspecified-bg" :foreground "#565761" :slant italic)))))

(provide '.emacs)
