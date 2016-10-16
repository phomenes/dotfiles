;; packages

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
(setq package-enable-at-startup nil)

(unless package-archive-contents
  (package-refresh-contents))

(let ((packages '(ergoemacs-mode clojure-mode cider go-mode markdown-mode smex gruvbox-theme)))
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))))

;; ergoemacs-mode

(require 'ergoemacs-mode)
(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "us")
(ergoemacs-mode 1)

;; font

(set-default-font
 (pcase system-type
   (`gnu/linux "Ubuntu Mono-12")
   (`windows-nt "Consolas-12")))

;; golang

(add-hook 'before-save-hook #'gofmt-before-save)

(add-hook 'go-mode-hook
	  (lambda ()
	    (setq tab-width 4)))

;; clojure

(add-hook 'cider-mode-hook #'eldoc-mode)
(setq nrepl-hide-special-buffers t)

(defun cider ()
  "Connects to nREPL server"
  (interactive
   (cider-connect
    (getenv "LEIN_REPL_HOST")
    (string-to-number (getenv "LEIN_REPL_PORT")))))

;; smex

(smex-initialize)
(global-set-key (kbd "M-a") #'smex)

;; settings

(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)

(setq make-backup-files nil)

(scroll-bar-mode 0)
(tool-bar-mode 0)

(setq scroll-step 1)

;; (set-input-method 'russian-computer)
;; (toggle-input-method)
;; (global-set-key [f1] 'toggle-input-method)

(column-number-mode t)
(setq tooltip-use-echo-area t)

(electric-indent-mode t)

(show-paren-mode t)

;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (add-to-list 'ac-modes 'sql-mode)

;; (require 'helm-config)
;; (helm-mode t)
;; (setq helm-mode-fuzzy-match t)

;; (global-set-key (kbd "M-x") #'helm-M-x)
;; (global-set-key (kbd "C-x b") #'helm-mini)
;; (global-set-key (kbd "C-x C-f") #'helm-find-files)

;; (projectile-global-mode)
;; (setq projectile-completion-system 'helm)
;; (helm-projectile-on)

(load-theme 'gruvbox t)
