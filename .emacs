;;; .emacs -- ry
;;; Commentary:
;;; Code:
(require 'package)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; (add-to-list 'package-archives
;;              '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(display-time)
(if (display-graphic-p)
    (load-theme 'tango-dark t))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(require 'company-dcd)
(add-hook 'd-mode-hook 'company-dcd-mode)
;; ensure that we use only rtags checking
;; https://github.com/Andersbakken/rtags#optional-1
;; (defun setup-flycheck-rtags ()
;;   (interactive)
;;   (flycheck-select-checker 'rtags)
;;   ;; RTags creates more accurate overlays.
;;   (setq-local flycheck-highlighting-mode nil)
;;   (setq-local flycheck-check-syntax-automatically nil))

;; only run this if rtags is installed
;; (when (require 'rtags nil :noerror)
;;   ;; make sure you have company-mode installed
;;   (require 'company)
;;   (require 'helm-rtags)
;;   (define-key c-mode-base-map (kbd "M-.")
;;     (function rtags-find-symbol-at-point))
;;   (define-key c-mode-base-map (kbd "M-,")
;;     (function rtags-find-references-at-point))
;;   ;; disable prelude's use of C-c r, as this is the rtags keyboard prefix
;;   ;; (define-key prelude-mode-map (kbd "C-c r") nil)
;;   ;; install standard rtags keybindings. Do M-. on the symbol below to
;;   ;; jump to definition and see the keybindings.
;;   (rtags-enable-standard-keybindings)
;;   ;; comment this out if you don't have or don't use helm
;;   (setq rtags-use-helm t)
;;   ;; company completion setup
;;   (setq rtags-autostart-diagnostics t)
;;   (rtags-diagnostics)
;;   (setq rtags-completions-enabled t)
;;   (push 'company-rtags company-backends)
;;   (global-company-mode)
;;   ;; (define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))
;;   ;; use rtags flycheck mode -- clang warnings shown inline
;;   (require 'flycheck-rtags)
;;   ;; c-mode-common-hook is also called by c++-mode
;;   (add-hook 'c-mode-common-hook #'setup-flycheck-rtags))
;; (cmake-ide-setup)
;; (eval-after-load 'flycheck
;;   '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; ;; (add-hook 'objc-mode-hook 'irony-mode)

;; (defun my-irony-mode-hook ()
;;   (define-key irony-mode-map [remap completion-at-point]
;;     'irony-completion-at-point-async)
;;   (define-key irony-mode-map [remap complete-symbol]
;;     'irony-completion-at-point-async))

;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(require 'company)
(global-company-mode)

;; (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
;; (setq company-backends (delete 'company-semantic company-backends))
;; (require 'company-irony-c-headers)
;; (eval-after-load 'company
;;   '(add-to-list
;;     'company-backends '(company-irony-c-headers company-irony)))

(require 'helm-config)
(helm-mode 1)
(require 'helm-ls-git)
(global-set-key (kbd "C-c C-r f") 'helm-ls-git-ls)
(global-set-key (kbd "C-c C-r a") 'helm-ag)
(global-set-key (kbd "C-c C-r A") 'helm-do-ag)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-x") 'helm-M-x)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(global-flycheck-mode)
(add-hook 'c++-mode-hook
	  (lambda () (setq flycheck-clang-language-standard "c++11")
	    (define-key c++-mode-map (kbd "C-c r <tab>") 'company-complete)))

(load "/usr/share/emacs/site-lisp/clang-format-3.9/clang-format.el")
(global-set-key [C-tab] 'clang-format-region)
(global-set-key (kbd "C-c TAB") 'company-complete)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(clang-format-executable "/usr/lib/llvm-3.9/bin/clang-format")
 '(cmake-ide-compile-command nil)
 '(company-clang-executable "clang-3.9")
 '(company-dabbrev-downcase nil)
 '(company-dcd--flags (quote ("-I/home/ry/dlang/dmd-2.083.0/src/phobos/")))
 '(company-dcd-client-executable "/home/ry/DCD/bin/dcd-client")
 '(company-dcd-compiler "gdc")
 '(company-dcd-server-executable "/home/ry/DCD/bin/dcd-server")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(fci-rule-color "#eee8d5")
 '(flycheck-c/c++-clang-executable "clang-3.9")
 '(flycheck-clang-args
   (quote
    ("-Wall" "-Wextra" "-Wno-pragma-once-outside-header")))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(indent-tabs-mode nil)
 '(irony-additional-clang-options (quote ("-Wno-pragma-once-outside-header")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (company-tern fish-mode company-dcd d-mode matlab-mode markdown-mode markdown-mode+ solarized-theme csharp-mode color-theme-solarized rtags helm-ls-git helm-ag flycheck-irony ess company-irony-c-headers company-irony cmake-project cmake-mode cmake-ide auto-complete)))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
