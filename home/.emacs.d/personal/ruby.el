(add-hook 'ruby-mode-hook 'robe-mode)

;; AC
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; Company
(eval-after-load 'company
  '(push 'company-robe company-backends))
