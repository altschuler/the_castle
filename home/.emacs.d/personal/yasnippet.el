(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)
(global-set-key (kbd "C-<tab>") 'yas-expand)
; unset tab completion
(define-key yas-minor-mode-map [(tab)] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
