(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(setq typescript-indent-level 4)

;; sample config
(add-hook 'typescript-mode-hook
          (lambda ()
            (tide-setup)
            (flycheck-mode +1)
            (setq flycheck-check-syntax-automatically '(save mode-enabled))
            (eldoc-mode +1)
            ;; company is an optional dependency. You have to
            ;; install it separately via package-install
            (company-mode-on)))


(defun ts-mode-map ()
  (local-set-key (kbd "C-c C-t r") 'tide-rename-symbol)
  )

;; add to hook
(add-hook 'tide-mode-hook 'ts-mode-map)
