(require 'flycheck);

(add-hook 'after-init-hook #'global-flycheck-mode)

(global-set-key (kbd "C-c C-n C-c") 'flycheck-next-error)

(flycheck-add-mode 'typescript-tslint 'html-mode)
