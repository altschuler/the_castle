(fset 'convert-requirejs-import
      (lambda (&optional arg)
        "Keyboard macro."
        (interactive "p")
        (kmacro-exec-ring-item (quote ([105 109 112 company-dummy-event 111 114 116 32 24 114 32 49 19 102 117 110 99 6 2 19 40 6 2 67108896 19 44 2 23 4 4 24 114 106 49 25 32 61 32 114 101 113 company-dummy-event 117 105 114 101 67108896 134217734 40 4 59 14 1] 0 "%d")) arg)))

(fset 'convert-function-ts
      (lambda (&optional arg)
        "Keyboard macro."
        (interactive "p")
        (kmacro-exec-ring-item (quote ([67108896 134217830 6 backspace 134217830 67108896 19 40 2 backspace 19 123 2 134217734 4 14 14 1] 0 "%d")) arg)))

(fset 'convert-requirejs-import-last
      (lambda (&optional arg)
        "Keyboard macro."
        (interactive "p")
        (kmacro-exec-ring-item (quote ([105 109 112 company-dummy-event 111 114 116 32 24 114 32 49 19 102 117 110 6 19 40 6 2 67108896 19 41 2 23 24 114 106 49 25 32 61 32 114 101 113 company-dummy-event 117 105 114 101 67108896 5 40 59] 0 "%d")) arg)))


(fset 'convert-base-class-extends
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([67108896 6 134217830 6 backspace 134217830 134217826 99 108 97 115 115 32 134217830 32 101 116 101 110 100 backspace backspace backspace backspace 120 116 company-dummy-event 101 110 100 115 4 4 19 46 101 120 2 2 2 67108896 19 123 2 32 134217734 4 4 134217730 19 99 111 110 115 6 134217830 67108896 19 40 2 backspace 19 123 2] 0 "%d")) arg)))

(fset 'convert-public-fn
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([112 117 98 108 105 99 32 67108896 19 46 2 6 backspace 19 102 117 110 99 2 2 2 2 67108896 19 40 2 backspace 134217734 32 61 62 19 123 2 134217734 4 19 102 117 110 99 1] 0 "%d")) arg)))

(fset 'convert-vlab-type
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([3 114 2 backspace 116 return 67108896 19 114 101 6 6 6 6 101 120 112 company-dummy-event 111 114 116 32 61 19 123 2 134217734 5 67108896 14 backspace 24 104 tab 24 19] 0 "%d")) arg)))

(fset 'convert-lambda-to-method
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([67108896 134217830 6 backspace 134217830 67108896 19 40 2 backspace 134217734 67108896 5 2 32 134217734 19 112 117 98 108 105 99 1] 0 "%d")) arg)))


(global-set-key (kbd "C-c C-r C-i") 'convert-requirejs-import)
(global-set-key (kbd "C-c C-r C-l") 'convert-requirejs-import-last)
(global-set-key (kbd "C-c C-r C-f") 'convert-function-ts)
(global-set-key (kbd "C-c C-r C-b") 'convert-base-class-extends)
(global-set-key (kbd "C-c C-r C-f") 'convert-lambda-to-method)
(global-set-key (kbd "C-c C-r C-e") 'convert-vlab-type)
