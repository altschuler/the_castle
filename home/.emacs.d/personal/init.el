;; the keys
(global-set-key (kbd "C-c b") 'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c p") 'windmove-up)
(global-set-key (kbd "C-c n") 'windmove-down)

(global-set-key (kbd "M-n") 'scroll-up-line)
(global-set-key (kbd "M-p") 'scroll-down-line)

(global-set-key (kbd "C-S-n") 'move-line-down)
(global-set-key (kbd "C-S-p") 'move-line-up)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)

(global-set-key (kbd "C-c C-k")     'comment-region)
(global-set-key (kbd "C-c C-u")     'uncomment-region)

(global-set-key (kbd "M-s-n")     '(lambda () (interactive) (shrink-window -1)))
(global-set-key (kbd "M-s-p")     '(lambda () (interactive) (shrink-window 1)))
(global-set-key (kbd "M-s-f")     '(lambda () (interactive) (shrink-window-horizontally -1)))
(global-set-key (kbd "M-s-b")     '(lambda () (interactive) (shrink-window-horizontally 1)))

(add-to-list 'load-path "~/.emacs.d/vendor")

(set-face-attribute 'region nil :background "#0034CC")

;;; Mode specifics

;(load-file "~/.emacs.d/personal/company.el")
(load-file "~/.emacs.d/personal/auto-complete.el")

(load-file "~/.emacs.d/personal/rust.el")
(load-file "~/.emacs.d/personal/helm.el")
(load-file "~/.emacs.d/personal/ggtags.el")
(load-file "~/.emacs.d/personal/c.el")
(load-file "~/.emacs.d/personal/ruby.el")
;(load-file "~/.emacs.d/personal/yasnippet.el")
(load-file "~/.emacs.d/personal/haskell.el")
(load-file "~/.emacs.d/personal/scss.el")
(load-file "~/.emacs.d/personal/tex.el")
(load-file "~/.emacs.d/personal/dired.el")
(load-file "~/.emacs.d/personal/erc.el")
(load-file "~/.emacs.d/personal/flycheck.el")
(load-file "~/.emacs.d/personal/python.el")
(load-file "~/.emacs.d/personal/csharp.el")
(load-file "~/.emacs.d/personal/eshell.el")
(load-file "~/.emacs.d/personal/go.el")
(load-file "~/.emacs.d/personal/setup-org-mode.el")

(require 'setup-org-mode)

(setenv "PATH" (concat (getenv "PATH") ":/home/simon/.local/bin"))
(setq exec-path (append exec-path '("/home/simon/.local/bin")))
(load-file "~/dev/stack-ide/stack-mode/fifo.el")
(load-file "~/dev/stack-ide/stack-mode/stack-mode.el")


;; Common

(setq-default c-basic-offset 4)
(setq sgml-basic-offset 4)

;; Doxy
;; (require 'doxymacs)
;; (add-hook 'c-mode-common-hook 'doxymacs-mode)
;; (defun my-doxymacs-font-lock-hook ()
;;   (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
;;       (doxymacs-font-lock)))
;; (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

;; Emacs flavor
(add-hook 'before-save-hook 'whitespace-cleanup)
(auto-fill-mode -1)

;;(set-frame-font "Consolas")
(set-frame-font "SourceCodePro-11")
(set-mouse-color "dark orange")

(delete-selection-mode t)
(show-paren-mode t)
(setq make-backup-files nil)
(setq message-kill-buffer-on-exit t)
(scroll-bar-mode 0)
(global-hl-line-mode -1)
(setq sp-autoescape-string-quote nil)


(add-hook 'web-mode-hook (lambda () (emmet-mode t)))

;; js2-mode
(add-hook 'js2-mode
          (lambda()
            (setq mode-name "js2")))

;(require 'tramp)

;; projectile
(require 'projectile)
(setq projectile-keymap-prefix (kbd "C-c C-p"))

;; js2 stuff
(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-c C-j")

(require 'js2-imenu-extras)
(js2-imenu-extras-setup)

;; tern
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;; fsharp
(setq inferior-fsharp-program "fsharpi --readline-")
(setq fsharp-compiler "fsharpc")


;; Emmet
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

;; TypeScript
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(setq typescript-indent-level 4)

;; (require 'tss)

;; (setq tss-popup-help-key "C-:")
;; (setq tss-jump-to-definition-key "M-.")
;; (setq tss-implement-definition-key "C-c i")

;; (tss-config-default)

;; LISP

;; mode hooks
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.ko\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . paredit-mode))
(add-to-list 'auto-mode-alist '("\\.amb\\'" . hexl-mode))
;(add-to-list 'auto-mode-alist '("\\.el\\'" . paredit-mode))
