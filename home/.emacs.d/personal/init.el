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

;; Config

(setenv "PATH" (concat (getenv "PATH") ":/home/simon/.local/bin"))
(setq exec-path (append exec-path '("/home/simon/.local/bin")))

;; Emacs flavor

(set-face-attribute 'region nil :background "#0034CC")
(setq-default c-basic-offset 4)
(setq sgml-basic-offset 4)

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

;; Mode specifics

(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")

(load-file "~/.emacs.d/personal/company.el")
;(load-file "~/.emacs.d/personal/auto-complete.el")
(load-file "~/.emacs.d/personal/neotree.el")
(load-file "~/.emacs.d/personal/rust-setup.el")
(load-file "~/.emacs.d/personal/helm.el")
(load-file "~/.emacs.d/personal/ggtags.el")
(load-file "~/.emacs.d/personal/c.el")
;;(load-file "~/.emacs.d/personal/ruby.el")
;;(load-file "~/.emacs.d/personal/yasnippet.el")
(load-file "~/.emacs.d/personal/haskell.el")
(load-file "~/.emacs.d/personal/scss.el")
(load-file "~/.emacs.d/personal/tex.el")
(load-file "~/.emacs.d/personal/dired.el")
;;(load-file "~/.emacs.d/personal/erc.el")
(load-file "~/.emacs.d/personal/flycheck.el")
(load-file "~/.emacs.d/personal/python.el")
;;(load-file "~/.emacs.d/personal/csharp.el")
(load-file "~/.emacs.d/personal/eshell.el")
;;(load-file "~/.emacs.d/personal/go.el")
(load-file "~/.emacs.d/personal/org.el")
(load-file "~/.emacs.d/personal/typescript.el")
;;(load-file "~/.emacs.d/personal/stack.el")
(load-file "~/.emacs.d/personal/js2.el")
(load-file "~/.emacs.d/personal/emmet.el")
(load-file "~/.emacs.d/personal/fsharp.el")
(load-file "~/.emacs.d/personal/mu4e.el")

;; projectile
(require 'projectile)
(setq projectile-keymap-prefix (kbd "C-c C-p"))

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
;; LISP

;; mode hooks
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.ko\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . paredit-mode))
(add-to-list 'auto-mode-alist '("\\.amb\\'" . hexl-mode))
;(add-to-list 'auto-mode-alist '("\\.el\\'" . paredit-mode))
