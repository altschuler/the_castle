(add-hook 'js2-mode
          (lambda()
            (setq mode-name "js2")))

(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-c C-j")

(require 'js2-imenu-extras)
(js2-imenu-extras-setup)

;; tern
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-to-list 'company-backends 'company-tern)
(setq company-tern-meta-as-single-line t)
