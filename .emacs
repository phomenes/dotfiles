;; packages

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
(setq package-enable-at-startup nil)

(unless package-archive-contents
  (package-refresh-contents))

(let ((packages '(evil auto-complete clojure-mode cider go-mode helm projectile helm-projectile solarized-theme monokai-theme gruvbox-theme)))
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

;; clojure

(add-hook 'cider-mode-hook #'eldoc-mode)
(setq nrepl-hide-special-buffers t)

;; settings

(scroll-bar-mode 0)
(tool-bar-mode 0)

(setq scroll-step 1)

(set-input-method 'russian-computer)
(toggle-input-method)
(global-set-key [f1] 'toggle-input-method)

(column-number-mode t)
(setq tooltip-use-echo-area t)

(electric-indent-mode t)

(show-paren-mode t)

(require 'evil)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x b") #'helm-mini)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(evil-mode t)
(setq evil-auto-indent t)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'sql-mode)

(require 'helm-config)
(helm-mode t)
(setq helm-mode-fuzzy-match t)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(load-theme 'gruvbox t)
