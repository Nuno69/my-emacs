;; -*- lexical-binding: t; -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(package-initialize)
;; (setq custom-file "~/.emacs.d/easy.el")

(use-package emacs
  :ensure nil
  :custom
  (echo-keystrokes 0)
  (inhibit-startup-screen t)
  (inhibit-startup-echo-area-message "")
  (inhibit-startup-buffer-menu t)
  (initial-scratch-message nil)
  (user-mail-address "arkadiusz@swietnicki.dev")
  (confirm-kill-processes nil)
  (auto-save-no-message t)
  (what-cursor-show-names t)
  (custom-buffer-verbose-help nil)
  (warning-suppress-types '((emacs)))
  (minibuffer-visible-completions t)
  (ns-right-alternate-modifier 'none))

(use-package ido
  :ensure nil
  :custom
  (ido-mode 'both nil (ido))
  (ido-everywhere t)
  (ido-enable-flex-matching t)
  (ido-create-new-buffer 'always)
  (ido-use-filename-at-point 'guess))

(use-package autoinsert
  :ensure nil
  :custom
  (auto-insert-mode t))

(use-package dired
  :ensure nil
  :custom
  (dired-kill-when-opening-new-dired-buffer t)
  (dired-recursive-copies 'always)
  (dired-recursive-deletes 'top))

(use-package dired-x
  :ensure nil
  :after dired)

(use-package apropos
  :ensure nil
  :custom
  (apropos-do-all t)
  (apropos-compact-layout t))

(use-package calendar
  :ensure nil
  :custom
  (calendar-christian-all-holidays-flag t))

(use-package imenu
  :ensure nil
  :custom
  (imenu-use-popup-menu nil))

(use-package outline
  :ensure nil
  :custom
  (outline-blank-line t))

(use-package org
  :ensure nil
  :custom
  (org-confirm-babel-evaluate nil)
  (org-html-html5-fancy t))

(use-package org2blog
  :ensure t
  :after org)

(use-package auctex
  :ensure t
  :custom
  (TeX-auto-save t)
  (TeX-parse-self t))

(use-package erc
  :ensure nil
  :custom
  (erc-nick "TheNunonical")
  (erc-away-nickname "TheNunonical (AFK)")
  (erc-email-userid "arkadiusz@swietnicki.dev"))

(use-package gnus
  :ensure nil
  :custom
  (gnus-init-file "~/.emacs.d/gnus.el"))

(use-package emacspeak-setup
  :load-path "~/emacspeak/lisp"
  :init
  (setopt dtk-program "swiftmac")
  (setopt swiftmac-default-voice-string "[{voice :com.apple.voice.super-compact.pl-PL.Zosia}] [[pitch 1]]")
  (setopt tts-notification-device "right")
  :custom
  (emacspeak-speak-tooltips t)
  (emacspeak-play-program sox-play)
  (emacspeak-eww-inhibit-images t)
  (emacspeak-speak-time-brief-format "%l:%M")
  (emacspeak-speak-time-format "%l:%M%p on %A %B %_e")
  (emacspeak-erc-speak-all-participants t)
  (swiftmac-default-speech-rate 0.8)
  :config
  (dtk-set-punctuations 'none 4)
  (emacspeak-toggle-character-echo 4)
  (emacspeak-toggle-word-echo 4)
  (load "~/.emacs.d/voice-definitions.el"))

(use-package gdscript-mode
  :ensure t
  :hook (gdscript-mode . eglot-ensure))

(use-package telega
  :ensure t
  :bind-keymap ("C-c t" . telega-prefix-map)
  :custom
  (telega-server-libs-prefix "/opt/homebrew/Cellar/tdlib/HEAD-dd1b761")
  (telega-chat-show-avatars nil)
  (telega-animation-play-inline nil)
  (telega-use-images nil)
  (telega-active-locations-show-avatars nil)
  (telega-brackets nil)
  (telega-help-messages nil)
  (telega-recognize-voice-message-mode t)
  (telega-user-show-relationship t)
  (telega-appindicator-use-label t)
  (telega-auto-translate-probe-language-codes '("ru"))
  :config
  (load "~/.emacs.d/telega-voice-definitions.el"))

(use-package empv
  :ensure t
  :bind ("C-x ," . empv-map)
  :custom
  (empv-invidious-instance "https://yewtu.be/api/v1")
  (empv-audio-dir '("'/Users/nuno/Library/Mobile Documents/com~apple~CloudDocs/Muzyka'")))

(use-package hippie-expand
  :ensure nil
  :bind ([remap dabbrev-expand] . hippie-expand))

(use-package nov
  :ensure t
  :mode ("\\.epub\\'" . nov-mode))

(use-package tmr
  :ensure t
  :custom
  (tmr-sound-file "~/.emacs.d/data/success.wav")
  :config
  (defun tmr-notification-notify (timer)
    "Dispatch a notification for TIMER.
Read Info node `(elisp) Desktop Notifications' for details."
    (if (featurep 'dbusbind)
        (let ((title "TMR May Ring (Emacs tmr package)")
              (body (tmr--long-description-for-finished-timer timer)))
          (unless (fboundp 'notifications-notify)
            (require 'notifications))
          (notifications-notify
           :title title
           :body body
           :app-name "GNU Emacs"
           :app-icon 'emacs
           :urgency tmr-notification-urgency
           :sound-file tmr-sound-file))
      (display-warning 'tmr "Emacs has no DBUS support, TMR notifications unavailable"))))

(use-package md4rd
  :ensure t
  :custom
  (md4rd-subs-active '(emacs Swift+iOSProgramming polska+askpoland)))

(use-package consult-gh
  :ensure t
  :custom
  (consult-gh-default-clone-directory "~/Documents/Projekty/")
  (consult-gh-preview-key "C-o")
  (consult-gh-file-action 'consult-gh--files-view-action)
  (consult-gh-repo-action 'consult-gh--repo-browse-files-action)
  (consult-gh-pr-action 'consult-gh--pr-view-action)
  (consult-gh-discussion-action 'consult-gh--discussion-browse-url-action)
  (consult-gh-favorite-orgs-list '("nuno69" "tvraman" "adirh3")))

(use-package wid-edit
  :ensure nil
  :custom
  (widget-image-enable nil)
  (widget-choice-toggle t)
  (widget-skip-inactive t))

(use-package tree-widget
  :ensure t
  :custom
  (tree-widget-image-enable nil))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode +1))

(use-package swift-mode
  :ensure t
  :mode
  "\\.swift\\'"
  :interpreter
  "swift")
(use-package lsp-mode
  :ensure t
  :bind-keymap
  ("C-c l" . lsp-command-map)
  :commands
  lsp
  :hook
  ((swift-mode . lsp)))
(use-package lsp-ui
  :ensure t)

(use-package lsp-sourcekit
  :ensure t
  :after lsp-mode
  :custom
  (lsp-sourcekit-executable "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"))

(use-package alert
  :ensure t)

(use-package applescript-mode
  :ensure t)

(use-package company
  :ensure t
  :config
  (global-company-mode +1))

(use-package flycheck
  :ensure t)

(use-package magit
  :ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(alert applescript-mode auctex company consult-gh empv flycheck
	   gdscript-mode lsp-mode lsp-sourcekit lsp-ui magit md4rd nov
	   org2blog swift-mode telega tmr)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
