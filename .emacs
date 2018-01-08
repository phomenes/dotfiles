;(setq custom-file "~/.emacs-custom.el")
;(load custom-file 'noerror)

;; packages

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
;(setq package-enable-at-startup nil)

(unless package-archive-contents
  (package-refresh-contents))

(let ((packages '(monokai-theme clojure-mode cider go-mode markdown-mode smex magit)))
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))))

;; font

(set-default-font
 (pcase system-type
   (`gnu/linux "Ubuntu Mono-12")
   (`windows-nt "Consolas-12")))

;; emacs

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(global-linum-mode t)
(global-hl-line-mode t)
(set-default 'truncate-lines t)
(column-number-mode t)

(setq make-backup-files nil)
(setq scroll-step 1)
(setq tooltip-use-echo-area t)

(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(put 'dired-find-alternate-file 'disabled nil)
(electric-indent-mode t)
(show-paren-mode t)

;; theme

(load-theme 'monokai t)

;; clojure

(add-hook 'cider-mode-hook #'eldoc-mode)
(setq nrepl-hide-special-buffers t)

(defun cider ()
  "Connects to nREPL server"
  (interactive
   (cider-connect
    (getenv "LEIN_REPL_HOST")
    (string-to-number (getenv "LEIN_REPL_PORT")))))

;; golang

(add-hook 'before-save-hook #'gofmt-before-save)

;(add-hook 'go-mode-hook
;	  (lambda ()
;	    (setq tab-width 4)))

;; smex

(smex-initialize)
(global-set-key (kbd "M-x") #'smex)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (smex markdown-mode go-mode cider clojure-mode monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

