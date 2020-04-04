;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Customizations ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck flycheck-clojure helm-flycheck helm-rg lsp-java exec-path-from-shell clojure-mode-extra-font-locking helm-company white-theme forge magit cider clj-refactor cljr-helm clojure-mode company helm helm-cider helm-cider-history helm-clojuredocs helm-projectile paredit projectile rainbow-delimiters))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Preferences ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; add MELPA repositorie
(require 'package)
(add-to-list 'package-archives (cons "melpa-stable" "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives (cons "melpa" "http://melpa.org/packages/") t)

;; only use melpa-stable for pinned packages
(setq package-archive-priorities
      '(("melpa" . 20)
        ("gnu" . 10)
        ("melpa-stable" . 0)))
(setq package-pinned-packages '((clj-refactor . "melpa-stable")))

;; load packages
(package-initialize)

;; install any missing packages
(unless (seq-every-p #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (package-install-selected-packages))

;; load theme and font
(load-theme 'white t)
(set-default-font "Operator Mono 16")

;; turn off fancy UI elements
(if (display-graphic-p)
    (progn (menu-bar-mode -1)
           (tool-bar-mode -1)
           (scroll-bar-mode -1))
  (menu-bar-mode -1))

;; don't show the startup screen
(setq inhibit-startup-screen t)

;; start in native full screen on mac, otherwise maximized
(if (eq system-type 'darwin)
    (toggle-frame-fullscreen)
  (toggle-frame-maximized))

;; send backups to ~/.emacs.d/backups
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

;; don't autosave or create lockfiles
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; no bells, never bells
(setq ring-bell-function 'ignore)

;; disable tabs
(setq-default indent-tabs-mode nil)

;; indent 2 spaces in shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; turn on line numbers everywhere
(global-display-line-numbers-mode t)

;; Highlights matching parenthesis
(show-paren-mode 1)

;; enable eldoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; Setup Tramp
(require 'tramp)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

;; setup eshell
(add-hook 'eshell-mode-hook (lambda () (company-mode -1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Keybindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use command as meta in OS X
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; use PATH from shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; always use rainbow delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; living that paredit life
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; enable projectile everywhere
(projectile-global-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; enable company mode everywhere
(global-company-mode t)

;; enable helm
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; enable helm with projectile
(require 'helm-projectile)
(helm-projectile-on)

;; set up java
(add-hook 'java-mode-hook
	  (lambda ()
            (c-set-offset 'statement-cont '++)
            (c-set-offset 'case-label '+)
	    (c-set-offset 'arglist-intro '+)
	    (setq c-basic-offset 2)))

;; set up clojure
(require 'clojure-mode-extra-font-locking)
(require 'clj-refactor)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'eldoc-mode)
(add-hook 'clojure-mode-hook
          (lambda ()
            (enable-paredit-mode)
            (subword-mode)
            
            (clj-refactor-mode 1)
            (yas-minor-mode 1)
            (cljr-add-keybindings-with-prefix "C-c C-r")))
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

