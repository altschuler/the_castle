(require 'mu4e)
(require 'mu4e-contrib)

;; Common defaults

(setq mu4e-maildir "~/Maildir"
      smtpmail-stream-type 'starttls
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 587 )

;; Contexts

(setq mu4e-contexts
      `( ,(make-mu4e-context
           :name "Altschuler"
           :enter-func (lambda () (mu4e-message "Switched to the ALTSCHULER context"))
           ;; leave-func not defined
           :match-func (lambda (msg)
                         (when msg
                           (mu4e-message-contact-field-matches msg
                                                               :to "simon@altschuler.dk")))
           :vars '(  ( user-mail-address            . "simon@altschuler.dk"  )
                     ( user-full-name               . "Simon Altschuler" )

                     ( mu4e-drafts-folder           . "/altschuler/INBOX.Drafts" )
                     ( mu4e-sent-folder             . "/altschuler/INBOX.Sent" )
                     ( mu4e-trash-folder            . "/altschuler/INBOX.Trash" )

                     ( mu4e-sent-messages-behavior  . sent )

                     ( smtpmail-default-smtp-server . "mail.altschuler.dk" )
                     ( smtpmail-smtp-server         . "mail.altschuler.dk" )

                     ( mu4e-maildir-shortcuts . (("/altschuler/INBOX"        . ?i)
                                                 ("/altschuler/INBOX.Sent"   . ?s)
                                                 ("/altschuler/INBOX.Trash"  . ?t)))))
         ,(make-mu4e-context
           :name "Gmail"
           :enter-func (lambda () (mu4e-message "Switch to the GMAIL context"))
           ;; leave-fun not defined
           :match-func (lambda (msg)
                         (when msg
                           (mu4e-message-contact-field-matches msg
                                                               :to "altschuleren@gmail.com")))
           :vars '(  ( user-mail-address            . "altschuleren@gmail.com" )
                     ( user-full-name               . "Simon Altschuler" )

                     ( smtpmail-default-smtp-server . "smtp.gmail.com" )
                     ( smtpmail-smtp-server         . "smtp.gmail.com" )

                     ( mu4e-drafts-folder           . "/gmail/[Gmail].Drafts" )
                     ( mu4e-sent-folder             . "/gmail/[Gmail].Sent Mail" )
                     ( mu4e-trash-folder            . "/gmail/[Gmail].Trash" )

                     ( mu4e-sent-messages-behavior  . delete )

                     ( mu4e-maildir-shortcuts       . (("/gmail/INBOX"               . ?i)
                                                       ("/gmail/[Gmail].Sent Mail"   . ?s)
                                                       ("/gmail/[Gmail].Trash"       . ?t)
                                                       ("/gmail/[Gmail].All Mail"    . ?a)))))))



;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; update every 5 minutes
(setq mu4e-update-interval 300)
(setq mu4e-headers-auto-update t)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; attempt to show images when viewing messages
(setq mu4e-view-show-images t)

;; show html as text
(setq mu4e-html2text-command 'mu4e-shr2text)
(setq shr-color-visible-luminance-min 80)

;; enable maildirs extension
(require 'mu4e-maildirs-extension)
(mu4e-maildirs-extension)
(setq mu4e-maildirs-extension-custom-list '("/altschuler/INBOX"
                                            "/altschuler/INBOX.Sent"
                                            "/altschuler/INBOX.Drafts"
                                            "/altschuler/INBOX.Trash"

                                            "/gmail/INBOX"
                                            "/gmail/[Gmail].Sent Mail"
                                            "/gmail/[Gmail].Trash"
                                            "/gmail/[Gmail].All Mail"))
;; Refiling

;; (setq mu4e-refile-folder
;;       (lambda (msg)
;;         (cond
;;          ;; messages to the mu mailing list go to the /mu folder
;;          ((mu4e-message-contact-field-matches msg :to
;;                                               "mu-discuss@googlegroups.com")
;;           "/mu")
;;          ;; messages sent directly to me go to /archive
;;          ;; also `mu4e-user-mail-address-p' can be used
;;          ((mu4e-message-contact-field-matches msg :to "me@example.com")
;;           "/private")
;;          ;; messages with football or soccer in the subject go to /football
;;          ((string-match "football\\|soccer"
;;                         (mu4e-message-field msg :subject))
;;           "/football")
;;          ;; messages sent by me go to the sent folder
;;          ((find-if
;;            (lambda (addr)
;;              (mu4e-message-contact-field-matches msg :from addr))
;;            mu4e-user-mail-address-list)
;;           mu4e-sent-folder)
;;          ;; everything else goes to /archive
;;          ;; important to have a catch-all at the end!
;;          (t  "/archive"))))

(require 'mu4e-alert)
(mu4e-alert-set-default-style 'libnotify)
(setq mu4e-alert-interesting-mail-query "flag:unread AND NOT flag:trashed")

(mu4e-alert-enable-notifications)
