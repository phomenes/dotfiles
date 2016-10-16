;; packages

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
(setq package-enable-at-startup nil)

(unless package-archive-contents
  (package-refresh-contents))

(let ((packages '(clojure-mode cider go-mode markdown-mode smex)))
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))))

;; font

(set-default-font
 (pcase system-type
   (`gnu/linux "Ubuntu Mono-12")
   (`windows-nt "Consolas-12")))

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

(add-hook 'go-mode-hook
	  (lambda ()
	    (setq tab-width 4)))

;; smex

(smex-initialize)
(global-set-key (kbd "M-x") #'smex)

;; settings

(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)

(setq make-backup-files nil)

(scroll-bar-mode 0)
(tool-bar-mode 0)

(setq scroll-step 1)

(column-number-mode t)
(setq tooltip-use-echo-area t)

(electric-indent-mode t)

(show-paren-mode t)
