(defun latex-startup ()
  (turn-on-reftex)
  (auto-fill-mode -1))

(add-hook 'LaTeX-mode-hook 'latex-startup)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'latex-startup)   ; with Emacs latex mode

(remove-hook 'text-mode-hook #'turn-on-auto-fill)
(remove-hook 'latex-mode-hook 'turn-on-auto-fill)
(remove-hook 'LaTex-mode-hook 'turn-on-auto-fill)
