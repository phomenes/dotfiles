;; packages

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
(setq package-enable-at-startup nil)

(unless package-archive-contents
  (package-refresh-contents))

(let ((packages '(evil auto-complete neotree flx-ido clojure-mode cider go-mode go-eldoc go-autocomplete)))
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))))

;; font

(set-default-font
 (cond ((string-equal system-type "gnu/linux") "Ubuntu Mono-12")
       ((string-equal system-type "windows-nt") "Consolas-12")))

;; golang

(add-hook 'before-save-hook #'gofmt-before-save)

(add-hook 'go-mode-hook
	  (lambda ()
	    (setq tab-width 4)))

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)

(require 'go-autocomplete)

;; clojure

(add-hook 'cider-mode-hook #'eldoc-mode)
(setq nrepl-hide-special-buffers t)

;; settings

(scroll-bar-mode 0)
(tool-bar-mode 0)

(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(setq scroll-step 1)

(set-input-method 'russian-computer)
(toggle-input-method)
(global-set-key [f1] 'toggle-input-method)

(column-number-mode t)
(setq tooltip-use-echo-area t)

(electric-indent-mode t)

(show-paren-mode t)

(require 'evil)
(evil-mode t)
(setq evil-auto-indent t)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'sql-mode)

(require 'neotree)
(global-set-key [f12] 'neotree-toggle)

(require 'flx-ido)
(flx-ido-mode t)
