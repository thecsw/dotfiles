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
 '(custom-safe-themes nil)
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
    (org-ref doom-themes tramp smex irony-eldoc company-irony company-c-headers matlab-mode gruvbox-theme htmlize powerline evil-snipe goto-chg w3m magit undo-tree cquery dashboard clang-format yaml-mode dracula-theme solidity-flycheck git-gutter-fringe solidity-mode go-gopath markdown-mode+ markdown-mode autopair go-gen-test go-scratch go-complete go-autocomplete)))
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
 '(line-number ((t (:inherit nil))))
 '(linum ((t (:background "unspecified-bg" :foreground "#565761" :slant italic)))))

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(load-theme 'doom-spacegrey t)
(provide '.emacs)
