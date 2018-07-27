;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(react
     windows-scripts
     sql
     ;; lsp
     python
     csv
     elm
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     docker
     ruby
     yaml
     javascript
     html
     typescript
     helm
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     org
     csharp
     ;; racket
     spotify
     (mu4e :variables
           mu4e-enable-notifications t
           mu4e-enable-mode-line t
           mu4e-use-maildirs-extension t
           mu4e-compose-keep-self-cc nil
           mu4e-compose-dont-reply-to-self t
           mu4e-user-mail-address-list '("simon@altschuler.dk" "altschuleren@gmail.com" "simon.altschuler@groupm.com"))
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'eshell)
     (spell-checking :variables
                     spell-checking-enable-by-default nil)
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     ;; magithub
     prettier-js
     graphql-mode
     )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the lastest
   ;; version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa t
   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal)
   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil

   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil

   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil

   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil

   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom

   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always

   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun my-setup-indent (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq configuration-layer-elpa-archives
        '(("melpa" . "melpa.org/packages/")
          ("org" . "orgmode.org/elpa/")
          ("gnu" . "elpa.gnu.org/packages/")))
  (my-setup-indent 4)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (global-flycheck-mode t)

  (setq neo-hidden-regexp-list '("\\.meta$" "^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$")
        neo-window-width 35)
  (setq prettier-js-args '(
                           "--trailing-comma" "all"
                           "--tab-width" "4"
                           "--single-quote" "true"
                           ))
  ;; (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'typescript-mode-hook 'prettier-js-mode)
  (setq evil-cross-lines t)

  ;; Org mode
  (setq org-capture-templates
        '(("t" "todo" entry (file+headline "todo.org" "Tasks")
           "* TODO %^{Title}\n%U\n%?" :clock-in t :clock-resume t)
          ("j" "journal" entry (file+datetree "diary.org")
           "* %?\n%U\n" :clock-in t :clock-resume t)
          ("a" "appointment" entry (file+headline "todo.org" "Appointments")
           "* APPT %^{Title}\nSCHEDULED: %^T\n%?" :clock-in t :clock-resume t)
          ("b" "brain" entry (file+headline "brain/brain.org" "All")
           "* %^{Title}\n%?")
          ("w" "work todo" entry (file+headline "todo.org" "Work")
           "* TODO %^{Title} %^G\n%U\n%^{Description}\n" :clock-in t :clock-resume t)))
  (setq org-agenda-files '("~/org/todo.org"))
  (setq org-log-into-drawer t) ; Log state change notes into LOGBOOK drawer
  (setq org-agenda-custom-commands
        `(("u" "unscheduled tasks"
           alltodo ""
           ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done 'scheduled 'deadline))
            (org-agenda-overriding-header "Unscheduled tasks")))
          ("n" "Agenda and all TODOs"
           ((agenda "")
            (alltodo ""
                     ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done 'scheduled 'deadline))
                      (org-agenda-overriding-header "Unscheduled tasks")))))))
  (setq org-todo-keyword-faces
        '(
          ("APPT" . (:foreground "white" :background "black" :weight bold))
          ))
  (setq org-clock-out-remove-zero-time-clocks t)
  (setq org-clock-out-when-done t)
  (setq org-agenda-clockreport-parameter-plist
        (quote (:link t :maxlevel 2 :fileskip0 t :compact t :narrow 80)))
  (setq org-refile-targets '((org-agenda-files :maxlevel . 2)))
  (setq org-refile-use-outline-path t) ; use 'file to include file name
  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-allow-creating-parent-nodes 'confirm)

  ;; mu4e
  (setq mu4e-maildir "~/.mail"
        mu4e-get-mail-command "mbsync -a"
        mu4e-update-interval 300
        mu4e-compose-signature-auto-include nil
        mu4e-view-show-images t
        mu4e-view-show-addresses t
        mu4e-context-policy 'pick-first
        mu4e-view-show-addresses t
        mu4e-headers-skip-duplicates t
        mu4e-headers-auto-update t
        mu4e-compose-context-policy 'ask-if-none
        mu4e-view-show-images t
        mu4e-view-image-max-width 800
        mu4e-attachment-dir "~/Downloads"
        message-send-mail-function 'smtpmail-send-it
        smtpmail-smtp-service 587
        smtpmail-stream-type 'starttls

        mu4e-maildir-shortcuts '(("/altschuler/INBOX" . ?a))

        mu4e-maildirs-extension-custom-list
        '("/altschuler/Inbox"
          ;; "/altschuler/Inbox.Sent"
          ;; "/altschuler/Inbox.Drafts"
          ;; "/altschuler/Inbox.Trash"

          "/gmail/Inbox"
          ;; "/gmail/[Gmail].Sent Mail"
          ;; "/gmail/[Gmail].Trash"
          ;; "/gmail/[Gmail].All Mail"

          "/groupm/Inbox"
          ;; "/Groupm/Inbox.Drafts"
          )

        mu4e-bookmarks
        `(("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
          ("date:today..now" "Today's messages" ?t)
          ("date:7d..now" "Last 7 days" ?w)
          ("flag:flagged" "Flagged" ?f)
          ("mime:image/*" "Messages with images" ?p)
          (,(mapconcat 'identity
                       (mapcar
                        (lambda (maildir)
                          (concat "maildir:" (car maildir)))
                        mu4e-maildir-shortcuts) " OR ")
           "All inboxes" ?i))
        )

                                        ; Auto-sign messages
  (add-hook 'message-send-hook 'mml-secure-message-sign-pgpmime)

  (require 'mu4e) ; hmm

  (setq mu4e-contexts
        `( ,(make-mu4e-context
             :name "Altschuler"
             :enter-func (lambda () (mu4e-message "Switched to Altschuler context"))
             :match-func (lambda (msg)
                           (when msg
                             (string-match-p "^/Altschuler" (mu4e-message-field msg :maildir))))
             :vars '( (user-mail-address            . "simon@altschuler.dk")
                      (user-full-name               . "Simon Altschuler")
                      (mu4e-trash-folder            . "/altschuler/Trash")
                      (mu4e-drafts-folder           . "/altschuler/Drafts")
                      (mu4e-sent-folder             . "/altschuler/Sent")
                      (mu4e-sent-messages-behavior  . sent)
                      (smtpmail-default-smtp-server . "mail.altschuler.dk")
                      (smtpmail-smtp-server         . "mail.altschuler.dk")
                      ;; ( mu4e-compose-signature .
                      ;;                          (concat
                      ;;                           "Alice Derleth\n"
                      ;;                           "Lauttasaari, Finland\n"))
                      ))

           ,(make-mu4e-context
             :name "GroupM"
             :enter-func (lambda () (mu4e-message "Switched to GroupM context"))
             :match-func (lambda (msg)
                           (when msg
                             (string-match-p "^/GroupM" (mu4e-message-field msg :maildir))))
             :vars '( (user-mail-address            . "simon.altschuler@groupm.com")
                      (user-full-name               . "Simon Altschuler")
                      (mu4e-trash-folder            . "/groupm/Trash")
                      (mu4e-drafts-folder           . "/groupm/Drafts")
                      (mu4e-sent-folder             . "/groupm/Sent")
                      (mu4e-sent-messages-behavior  . sent)
                      (smtpmail-default-smtp-server . "smtp.office365.com")
                      (smtpmail-smtp-server         . "smtp.office365.com")
                      ;; ( mu4e-compose-signature .
                      ;;                          (concat
                      ;;                           "Alice Derleth\n"
                      ;;                           "Lauttasaari, Finland\n"))
                      ))


           ,(make-mu4e-context
             :name "Gmail"
             :enter-func (lambda () (mu4e-message "Switched to  Gmail context"))
             :match-func (lambda (msg)
                           (when msg
                             (string-match-p "^/Gmail" (mu4e-message-field msg :maildir))))
             :vars '( (user-mail-address            . "altschuleren@gmail.com")
                      (user-full-name               . "Simon Altschuler")
                      (mu4e-trash-folder            . "/gmail/[Gmail]/.Trash")
                      (mu4e-trash-folder            . "/gmail/[Gmail]/.Drafts")
                      (mu4e-sent-folder             . "/gmail/[Gmail]/.Sent Mail")
                      (mu4e-sent-messages-behavior  . delete)
                      (smtpmail-default-smtp-server . "smtp.gmail.com")
                      (smtpmail-smtp-server         . "smtp.gmail.com")
                      ;; ( mu4e-compose-signature  .
                      ;;                           (concat
                      ;;                            "Prof. Alice Derleth\n"
                      ;;                            "Miskatonic University, Dept. of Occult Sciences\n"))
                      ))))

  (defvar my-mu4e-mailing-lists
    '(("builds@circleci.com" . "/altschuler/CircleCI")
      ("noreply@information.dk" . "/altschuler/News"))
    "List of mailing list addresses and folders where
   their messages are saved.")

  (defun my-mu4e-refile-folder-function (msg)
    "Set the refile folder for MSG."
    (let ((maildir (mu4e-message-field msg :maildir))
          (subject (mu4e-message-field msg :subject))
          folder)
      (cond
       ((string-match "Altschuler" maildir)
        (setq folder (or (catch 'found
                           (dolist (mailing-list my-mu4e-mailing-lists)
                             (if (mu4e-message-contact-field-matches
                                  msg :to (car mailing-list))
                                 (throw 'found (cdr mailing-list)))))
                         "/altschuler/Inbox")))
       ((string-match "Gmail" maildir)
        (setq folder "/Gmail/All Mail"))
       ;; ((string-match "Account2" maildir)
       ;;  (setq folder (or (cdar (member* subject my-mu4e-subject-alist
       ;;                                  :test #'(lambda (x y)
       ;;                                            (string-match
       ;;                                             (car y) x))))
       ;;                   "/Account2/General")))
       )
      folder))

  (setq mu4e-refile-folder 'my-mu4e-refile-folder-function)

  ;; Enable Desktop notifications
  (with-eval-after-load 'mu4e-alert
    (mu4e-alert-set-default-style 'libnotify))

  ;; (defun astyle-format-before-save ()
  ;;   (when (eq major-mode 'csharp-mode)
  ;;     (shell-command-on-region
  ;;      (point-min) (point-max)
  ;;      "astyle --style=kr --add-braces --break-closing-braces --pad-oper --pad-comma --indent-after-parens --indent-continuation=1 --indent-namespaces"
  ;;      (current-buffer) t
  ;;      (get-buffer-create "*Astyle Errors*") t) ))

  ;; (add-hook 'before-save-hook #'astyle-format-before-save)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (racket-mode faceup sql-indent yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic csv-mode spotify helm-spotify-plus multi yaml-mode xterm-color shell-pop rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake prettier-js org-mime multi-term minitest graphql-mode let-alist eshell-z eshell-prompt-extras esh-help chruby bundler inf-ruby web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode mu4e-maildirs-extension mu4e-alert ht omnisharp shut-up magithub ghub+ apiwrap ghub csharp-mode org-category-capture smartparens iedit anzu evil goto-chg undo-tree highlight f s company-web dash bind-map packed helm avy helm-core async popup web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode web-completion-data unfill org-projectile org-present org-pomodoro alert log4e gntp org-download mwim mmm-mode markdown-toc markdown-mode htmlize gnuplot gh-md flyspell-correct-helm flyspell-correct auto-dictionary smeargle orgit magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter fuzzy flycheck-pos-tip pos-tip evil-magit magit magit-popup git-commit with-editor diff-hl company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete tide typescript-mode flycheck ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode bind-key auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ivy racket-mode faceup sql-indent yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic csv-mode spotify helm-spotify-plus multi yaml-mode xterm-color shell-pop rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake prettier-js org-mime multi-term minitest graphql-mode let-alist eshell-z eshell-prompt-extras esh-help chruby bundler inf-ruby web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode mu4e-maildirs-extension mu4e-alert ht omnisharp shut-up magithub ghub+ apiwrap ghub csharp-mode org-category-capture smartparens iedit anzu evil goto-chg undo-tree highlight f s company-web dash bind-map packed helm avy helm-core async popup web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode web-completion-data unfill org-projectile org-present org-pomodoro alert log4e gntp org-download mwim mmm-mode markdown-toc markdown-mode htmlize gnuplot gh-md flyspell-correct-helm flyspell-correct auto-dictionary smeargle orgit magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter fuzzy flycheck-pos-tip pos-tip evil-magit magit magit-popup git-commit with-editor diff-hl company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete tide typescript-mode flycheck ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode bind-key auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
