;; GDB

(setq gdb-many-windows t gdb-show-main t)

;; Keys

(global-set-key (kbd "C-x C-o") 'ff-find-other-file)

;; Use company
(add-hook 'c-mode-hook 'company-mode)
