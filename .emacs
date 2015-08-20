(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(add-to-list 'custom-safe-themes "60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40")
(load-theme 'monokai t)

(scroll-bar-mode 0)
(tool-bar-mode 0)

(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(setq scroll-step 1)

(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)

(set-default-font "Ubuntu Mono-12")

(set-input-method 'russian-computer)
(toggle-input-method)
(global-set-key [f1] 'toggle-input-method)

(column-number-mode t)

(setq tooltip-use-echo-area t)

(electric-indent-mode t)

(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(set-face-attribute 'show-paren-match-face nil
        :weight 'bold :underline t :overline nil
	:slant 'normal :foreground nil :background nil :inverse-video nil)

(require 'evil)
(evil-mode t)
(setq evil-auto-indent t)

(require 'evil-surround)
(global-evil-surround-mode t)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'sql-mode)

(require 'yasnippet)
(yas-global-mode t)

(require 'neotree)
(global-set-key [f12] 'neotree-toggle)

(require 'flx-ido)
(flx-ido-mode t)

;; golang

(add-hook 'before-save-hook #'gofmt-before-save)

(add-hook 'go-mode-hook
	  (lambda ()
	    (setq tab-width 4)))

;; clojure

(add-hook 'cider-mode-hook #'eldoc-mode)
(setq nrepl-hide-special-buffers t)
