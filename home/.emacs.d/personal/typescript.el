(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(setq typescript-indent-level 4)

;; ;; sample config
;; (add-hook 'typescript-mode-hook
;;           (lambda ()
;;             (tide-setup)
;;             (flycheck-mode +1)
;;             (yas-minor-mode +1)
;;             (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;             (eldoc-mode +1)
;;             (company-mode-on)))


(defun ts-mode-map ()
  (local-set-key (kbd "C-c C-t r") 'tide-rename-symbol)
  )

;; (add-hook 'tide-mode-hook 'ts-mode-map)

;; add to hooks
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (yas-minor-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1)
  (ts-mode-map))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
;; (add-hook 'js2-mode-hook (lambda ()
;;                            (setup-tide-mode)
;;                            (setq tide-format-options
;;                                  '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions
;;                                    t
;;                                    :placeOpenBraceOnNewLineForFunctions
;;                                    nil
;;                                    :insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis
;;                                    t
;;                                    :insertSpaceAfterKeywordsInControlFlowStatements
;;                                    t
;;                                    :insertSpaceAfterCommaDelimiter
;;                                    t
;;                                    :indentSize
;;                                    2
;;                                    :insertSpaceAfterSemicolonInForStatements
;;                                    t
;;                                    :insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets
;;                                    t
;;                                    :insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces
;;                                    t
;;                                    ))))

;; format options

;; InsertSpaceAfterCommaDelimiter: boolean;
;; InsertSpaceAfterSemicolonInForStatements: boolean;
;; InsertSpaceBeforeAndAfterBinaryOperators: boolean;
;; InsertSpaceAfterKeywordsInControlFlowStatements: boolean;
;; InsertSpaceAfterFunctionKeywordForAnonymousFunctions: boolean;
;; InsertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis: boolean;
;; InsertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets: boolean;
;; InsertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces: boolean;
;; InsertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces?: boolean;
;; PlaceOpenBraceOnNewLineForFunctions: boolean;
;; PlaceOpenBraceOnNewLineForControlBlocks: boolean;
