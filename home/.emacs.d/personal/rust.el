(setq racer-rust-src-path "~/dev/rust/src/")
(setq racer-cmd "~/dev/racer/target/release/racer")
(add-to-list 'load-path "~/dev/racer/editors/emacs")

(add-hook 'rust-mode-hook #'racer-mode)

(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(add-hook 'rust-mode-hook
          '(lambda ()
             (racer-activate)
             (local-set-key (kbd "C-c C-c") 'cargo-process-run)
             (local-set-key (kbd "C-c C-t") 'cargo-process-test)
             (local-set-key (kbd "C-c C-b") 'cargo-process-build)))

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(add-hook 'prog-mode-hook
          '(lambda ()
             (when (derived-mode-p 'rust-mode)
               (ggtags-mode 1)
               (define-key ggtags-mode-map (kbd "M-]") 'ggtags-grep)
               )))
