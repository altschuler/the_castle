;;; init.el --- Prelude's configuration entry point.
;;
;; Copyright (c) 2011 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: http://batsov.com/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This file simply sets up the default load path and requires
;; the various modules defined within Emacs Prelude.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar prelude-dir (file-name-directory load-file-name)
  "The root dir of the Emacs Prelude distribution.")
(defvar prelude-core-dir (expand-file-name "core" prelude-dir)
  "The home of Prelude's core functionality.")
(defvar prelude-modules-dir (expand-file-name  "modules" prelude-dir)
  "This directory houses all of the built-in Prelude modules.")
(defvar prelude-personal-dir (expand-file-name "personal" prelude-dir)
  "This directory is for your personal configuration.

Users of Emacs Prelude are encouraged to keep their personal configuration
changes in this directory.  All Emacs Lisp files there are loaded automatically
by Prelude.")
(defvar prelude-vendor-dir (expand-file-name "vendor" prelude-dir)
  "This directory houses packages that are not yet available in ELPA (or MELPA).")
(defvar prelude-savefile-dir (expand-file-name "savefile" prelude-dir)
  "This folder stores all the automatically generated save/history-files.")
(defvar prelude-modules-file (expand-file-name "prelude-modules.el" prelude-dir)
  "This files contains a list of modules that will be loaded by Prelude.")

(unless (file-exists-p prelude-savefile-dir)
  (make-directory prelude-savefile-dir))

(defun prelude-add-subfolders-to-load-path (parent-dir)
 "Add all first level PARENT-DIR subdirs to the `load-path'."
 (dolist (f (directory-files parent-dir))
   (let ((name (expand-file-name f parent-dir)))
     (when (and (file-directory-p name)
                (not (equal f ".."))
                (not (equal f ".")))
       (add-to-list 'load-path name)))))

;; add Prelude's directories to Emacs's `load-path'
(add-to-list 'load-path prelude-core-dir)
(add-to-list 'load-path prelude-modules-dir)
(add-to-list 'load-path prelude-vendor-dir)
(prelude-add-subfolders-to-load-path prelude-vendor-dir)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; the core stuff
(require 'prelude-packages)
(require 'prelude-ui)
(require 'prelude-core)
(require 'prelude-mode)
(require 'prelude-editor)
(require 'prelude-global-keybindings)

;; OSX specific settings
;; (when (eq system-type 'darwin)
;;   (require 'prelude-osx))

;; the modules
(when (file-exists-p prelude-modules-file)
  (load prelude-modules-file))

;; config changes made through the customize UI will be store here
;(setq custom-file (expand-file-name "custom.el" prelude-personal-dir))

;; load the personal settings (this includes `custom-file')
(when (file-exists-p prelude-personal-dir)
  (message "Loading personal configuration files in %s..." prelude-personal-dir)
  (load (concat prelude-personal-dir "/init.el"))
  ;; (mapc 'load (directory-files prelude-personal-dir 't "^[^#].*el$"))
  )


;; (prelude-eval-after-init
;;  ;; greet the use with some useful tip
;;  (run-at-time 5 nil 'prelude-tip-of-the-day))

(message "Godspeed")

;;; init.el ends here
(put 'set-goal-column 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(android-mode-sdk-dir "~/opt/android-sdk-linux")
 '(haskell-tags-on-save t)
 '(jedi:environment-virtualenv nil)
 '(js-switch-indent-offset 4)
 '(js2-strict-trailing-comma-warning nil)
 '(js2r-prefered-quote-type 2)
 '(neo-window-width 30)
 '(org-agenda-files (quote ("~/org/energy.org" "~/org/todo.org")))
 '(package-selected-packages
   (quote
    (prettier-js web-mode folding graphql-mode slack cider clojure-cheatsheet flycheck-clojure aggressive-indent ng2-mode company-tern tern sass-mode yaml-mode flycheck typescript-mode all-the-icons mu4e-alert mu4e-maildirs-extension eslint-fix coffee-mode handlebars-sgml-mode editorconfig zenburn-theme volatile-highlights undo-tree tss toml-mode tide sws-mode smex smartparens scss-mode scala-mode2 rudel robe restclient rainbow-mode python-environment pony-mode pkgbuild-mode paredit omnisharp neotree markdown-mode+ magit less-css-mode key-chord jsx-mode js2-refactor jade-mode ido-ubiquitous icicles helm-themes helm-swoop helm-spotify helm-projectile-all helm-projectile helm-make helm-gtags helm-company helm-anything helm-ag haskell-mode handlebars-mode guru-mode grizzl gotest golint go-snippets go-autocomplete gitignore-mode gitconfig-mode gist ggtags function-args fsharp-mode flymake-rust flycheck-rust flycheck-hdevtools flx-ido expand-region ess erc-image epc emmet-mode elisp-slime-nav dired-filter dired-details+ dired+ diminish d-mode csv-mode company-c-headers clojure-snippets clojure-mode-extra-font-locking cargo bookmark+ bison-mode auto-complete-rst auto-complete-clang auctex-latexmk android-mode ace-jump-mode ace-jump-buffer ac-racer ac-cider 4clojure)))
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-I~/school/bachelor/mini")
     (company-clang-arguments "-I/home/simon/dev/c-demo-project/include1/" "-I/home/simon/dev/c-demo-project/include2/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
