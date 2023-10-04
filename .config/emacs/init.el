(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

(setq inhibit-startup-message t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

(set-frame-font "Fira Code 12")

(global-set-key (kbd "C-x C-b") 'ibuffer)

;;
;; MELPA.
;;

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; You can install package-selected-packages by package-install-selected-packages.
(setq package-selected-packages '(ligature undo-tree rust-mode eglot company zenburn-theme))

;;
;; Fira Code ligatures via ligature.el.
;; Instructions: https://github.com/tonsky/FiraCode/wiki/Emacs-instructions.
;;

;; Enable the www ligature in every possible major mode
(ligature-set-ligatures 't '("www"))

;; Enable ligatures in programming modes                                                           
(ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                     ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                     "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                     "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                     "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                     "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                     "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                     "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                     "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                     "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

(global-ligature-mode 't)

;;
;; undo-tree
;;

(require 'undo-tree)
(global-undo-tree-mode)

;;
;; eglot
;;

(add-hook 'rust-mode-hook 'eglot-ensure)

;;
;; company
;;

(add-hook 'rust-mode-hook 'company-mode)

;; theme

(load-theme 'zenburn t)
