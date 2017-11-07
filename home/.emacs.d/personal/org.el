;; MobileOrg
(setq org-directory "~/org")
(setq org-mobile-directory "/simon@4be.dk#1337:/home/simon/org")
(setq org-mobile-inbox-for-pull (concat org-directory "/index.org"))
(setq org-src-fontify-natively t)

(setq org-mobile-files (list
                        "~/org/todo.org"
                        "~/org/school.org"
                        "~/org/pakkeliste.org"
                        "~/org/notes.org"
                        "~/org/food.org"))

;; Colors
(setq org-todo-keyword-faces
      '(("CANCELLED"  . "cyan")
        ("DELEGATED" . "cyan")
        ("STARTED"   . "yellow")
        ("WAITING"   . "yellow")

        ;; packing list
        ("READY"     . "yellow")
        ("PREPARE"   . "yellow")))

;; Keys
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-M-f") 'org-shiftright)
            (local-set-key (kbd "C-M-b") 'org-shiftleft)))
