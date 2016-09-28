(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-backends (delete 'company-semantic company-backends))
(add-to-list 'company-backends 'company-c-headers)
(global-set-key (kbd "C-.") 'company-complete)
;(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.9.2/")
(setq company-idle-delay 0.0)

(setq company-tooltip-align-annotations t)
