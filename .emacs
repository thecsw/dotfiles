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
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes
   (quote
    ("551b18591d04da8b0f8305d3365c659ee591764dfde20f265631127d77ec40a6" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "08ed410f71bd79e1f7dfb03d7defa478047a47149ff7b0a93c854b1ff55e9807" "15006b639ac371eaaf6fa63e59f0078c6ec2f989d5cd15a91de2dab2d1d9ebf4" "73eacaf368e16cf41b125a1b6d3587308224d745fed432d641c54883ca3c55f0" "bcc4dcf3ab49551bdb912b3b2bb88a428f45b18995cab2e4d453537a9f1e042a" "7e13dae26544cdfb7f78f6a0e01a032c350b76d9846e7420e40e7f1a02d0ffd9" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e")))
 '(font-use-system-font t)
 '(initial-buffer-choice t)
 '(org-log-done (quote time))
 '(package-selected-packages
   (quote
    (tramp smex irony-eldoc company-irony company-c-headers matlab-mode gruvbox-theme htmlize powerline evil-snipe goto-chg w3m magit undo-tree cquery dashboard clang-format yaml-mode dracula-theme solidity-flycheck git-gutter-fringe solidity-mode go-gopath markdown-mode+ markdown-mode autopair go-gen-test go-scratch go-complete go-autocomplete)))
 '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#32302f")))
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

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))


(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(setq tramp-default-method "ssh")
(global-set-key (kbd "<f1>") 'shell)
(global-set-key (kbd "M-x") 'smex)
(provide '.emacs)
