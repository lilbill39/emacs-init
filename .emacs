;;; .emacs -- ry
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(cmake-ide-setup)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(require 'company)
(global-company-mode)

(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(setq company-backends (delete 'company-semantic company-backends))
(require 'company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

(require 'helm-config)
(helm-mode 1)
(require 'helm-ls-git)
(global-set-key (kbd "C-c r f") 'helm-ls-git-ls)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(global-flycheck-mode)
(add-hook 'c++-mode-hook
	  (lambda () (setq flycheck-clang-language-standard "c++11")
	    (define-key c++-mode-map (kbd "C-c r <tab>") 'company-complete)))

(load "/usr/share/emacs/site-lisp/clang-format-3.9/clang-format.el")
(global-set-key [C-tab] 'clang-format-region)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(clang-format-executable "/usr/lib/llvm-3.9/bin/clang-format")
 '(company-clang-executable "clang-3.9")
 '(company-dabbrev-downcase nil)
 '(flycheck-c/c++-clang-executable "clang-3.9")
 '(flycheck-clang-args
   (quote
    ("-Wall" "-Wextra" "-Wno-pragma-once-outside-header")))
 '(indent-tabs-mode nil)
 '(irony-additional-clang-options (quote ("-Wno-pragma-once-outside-header"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
