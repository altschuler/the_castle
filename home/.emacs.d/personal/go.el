(require 'go-autocomplete)
(require 'auto-complete-config)

(eval-after-load 'go-mode
  (lambda ()
    ((define-key go-mode-map (kbd "C-c C-c") 'go-run))))
