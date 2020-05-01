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
 '(custom-enabled-themes (quote (abyss)))
 '(custom-safe-themes
   (quote
    ("4c9366a045fff3296b1b0565c181732bc9b103fe2a94dbe1f1159e6c4dfa9463" "36f17556e827b41b63fe9375dbeeb4989d4976fe51cd0506968c6a41d2a7c9f8" "14a4bbd2207617728ea504ea9aa48416999a456db9f10e7d74baab896301d8a3" "ab0e54d683d251ceee2b7c9de7cb486a960a29fb84b56acbff86a355c7d96ed8" "08ed410f71bd79e1f7dfb03d7defa478047a47149ff7b0a93c854b1ff55e9807" "ffe7b31b6fb3dae583b45ef71c7efdf50a017db40b8dcd7b0b3665c30f186dfc" "15006b639ac371eaaf6fa63e59f0078c6ec2f989d5cd15a91de2dab2d1d9ebf4" "73eacaf368e16cf41b125a1b6d3587308224d745fed432d641c54883ca3c55f0" "7e13dae26544cdfb7f78f6a0e01a032c350b76d9846e7420e40e7f1a02d0ffd9" "bcc4dcf3ab49551bdb912b3b2bb88a428f45b18995cab2e4d453537a9f1e042a" "543810bda3d88d3172bea79fd4c1446a0f3f7bf2027fb3433283f00c1771b915" "d8dc153c58354d612b2576fea87fe676a3a5d43bcc71170c62ddde4a1ad9e1fb")))
 '(fci-rule-color "#5B6268")
 '(font-use-system-font t)
 '(initial-buffer-choice t)
 '(jdee-db-active-breakpoint-face-colors (cons "#2b2a27" "#ff5d38"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#2b2a27" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#2b2a27" "#3f444a"))
 '(objed-cursor-color "#ff5d38")
 '(org-log-done (quote time))
 '(package-selected-packages
   (quote
    (dot-mode olivetti format-all caddyfile-mode org-ref doom-themes tramp smex irony-eldoc company-irony company-c-headers matlab-mode gruvbox-theme htmlize powerline evil-snipe goto-chg w3m magit undo-tree cquery dashboard clang-format yaml-mode dracula-theme solidity-flycheck git-gutter-fringe solidity-mode go-gopath markdown-mode+ markdown-mode autopair go-gen-test go-scratch go-complete go-autocomplete)))
 '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#32302f")))
 '(save-place-mode t)
 '(show-paren-mode t)
 '(vc-annotate-background "#2b2a27")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#a4c551")
    (cons 60 "#b0cc3d")
    (cons 80 "#bcd42a")
    (cons 100 "#c1a623")
    (cons 120 "#c5781c")
    (cons 140 "#cb4b16")
    (cons 160 "#c95a58")
    (cons 180 "#c7699a")
    (cons 200 "#c678dd")
    (cons 220 "#d96fa6")
    (cons 240 "#ec666f")
    (cons 260 "#ff5d38")
    (cons 280 "#cf563c")
    (cons 300 "#9f5041")
    (cons 320 "#6f4a45")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "unspecified-bg" :foreground "#f8f8f2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default"))))
 '(diff-function ((t (:inherit nil))))
 '(line-number ((t (:inherit nil))))
 '(linum ((t (:background "unspecified-bg" :foreground "#565761" :slant italic))))
 '(magit-diff-added ((t (:foreground "#22aa22"))))
 '(magit-diff-added-highlight ((t (:background "color-233" :foreground "#22aa22"))))
 '(magit-diff-context-highlight ((t (:background "color-233" :foreground "brightyellow"))))
 '(magit-diff-file-heading-highlight ((t (:foreground "magenta"))))
 '(magit-diff-removed ((t (:foreground "#aa2222"))))
 '(magit-diff-removed-highlight ((t (:background "color-233" :foreground "#aa2222"))))
 '(magit-section-highlight ((t (:background "color-232" :foreground "brightmagenta" :weight bold)))))

(provide '.emacs)
