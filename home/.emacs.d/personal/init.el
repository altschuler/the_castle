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

(global-set-key (kbd "C-x d") 'diredp-dired-files)

(add-to-list 'load-path "~/.emacs.d/vendor")

(set-face-attribute 'region nil :background "#00CC1F")

;; Haskell
(setenv "PATH" (concat "~/.cabal/bin:" (getenv "PATH")))
(add-to-list 'exec-path "~/.cabal/bin")
(custom-set-variables '(haskell-tags-on-save t))
(add-hook 'haskell-mode-hook
          (lambda () (define-key haskell-mode-map (kbd "M-.") 'haskell-mode-jump-to-def-or-tag)))

;; yasnippet
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)
(global-set-key (kbd "C-<tab>") 'yas-expand)
; unset tab completion
(define-key yas-minor-mode-map [(tab)] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)

;; scss
(setq scss-compile-at-save nil)
(add-hook 'scss-mode-hook 'smartparens-mode)
(add-hook 'scss-mode-hook 'auto-complete-mode)

;; C/C++ dev
(require 'auto-complete-clang)
;(define-key c++-mode-map (kbd "C-S-<return>") 'ac-complete-clang)

;(require 'member-function)
;(setq mf--source-file-extension "cpp")
(add-hook 'before-save-hook 'whitespace-cleanup)
(auto-fill-mode -1)

;; tex
(defun latex-startup ()
  (turn-on-reftex)
  (auto-fill-mode -1))

(add-hook 'LaTeX-mode-hook 'latex-startup)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'latex-startup)   ; with Emacs latex mode

(remove-hook 'text-mode-hook #'turn-on-auto-fill)
(remove-hook 'latex-mode-hook 'turn-on-auto-fill)
(remove-hook 'LaTex-mode-hook 'turn-on-auto-fill)

;; (set-frame-font "SourceCodePro-11")
(set-frame-font "Consolas")

(add-to-list 'load-path "~/.emacs.d/vendor/kite-mode")

(set-mouse-color "dark orange")

(setq dired-listing-switches "-alh")

(add-hook 'web-mode-hook (lambda () (emmet-mode t)))

(require 'llvm-mode)

;; (add-to-list 'load-path "/share/emacs/site-lisp/sage-mode")
;; (require 'sage "sage")
;; (setq sage-command "sage")

;; (add-hook 'sage-startup-after-prompt-hook
;;           (lambda () (interactive)
;;             (sage-view 1)
;;             (sage-view-disable-inline-output)))

;; for c/c++
(global-set-key (kbd "M-RET") 'ac-complete-clang)
(global-set-key (kbd "C-M-RET") 'ac-complete-gtags)
(add-hook 'c++-mode-hook (lambda () (local-set-key (kbd "C-c C-c") 'compile)))

(require 'kite-mode)

;; js2-mode
(add-hook 'js2-mode
          (lambda()
            (setq mode-name "js2")))

;; cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(require 'tramp)

;; projectile
(require 'projectile)
(setq projectile-keymap-prefix (kbd "C-c C-p"))

(global-set-key (kbd "C-x M-w") 'wrap-text)

;; js2 stuff
(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-c C-j")

(require 'js2-imenu-extras)
(js2-imenu-extras-setup)

;; tern
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

;; erc setup
(require 'erc-dcc)
(require 'erc-image)
(add-to-list 'erc-modules 'image)
(erc-update-modules)
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

;; fsharp
(setq inferior-fsharp-program "fsharpi --readline-")
(setq fsharp-compiler "fsharpc")

;; Emmet
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

;; Auto Complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; Emacs flavor
(delete-selection-mode t)
(show-paren-mode t)
; do not make backup files
(setq make-backup-files nil)
; don't keep message buffers around
(setq message-kill-buffer-on-exit t)
; no scrollbars
(scroll-bar-mode 0)
(global-hl-line-mode -1)
(setq sp-autoescape-string-quote nil)

;; mode hooks
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.ko\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.kite\\'" . kite-mode))
