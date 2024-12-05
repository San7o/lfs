;; #############################################
;; Emacs configs
;; by Giovanni Santini
;; #############################################
;;
;; Use M-x load-file to load this configuration
;; you can also use eval-buffer if you are editing
;; this file


;; ############ REPOSITORIES BEGIN ##############
;; Onlline package repository

(require 'package)
(setq package-archives '(
	     ("GNU" . "http://elpa.gnu.org/packages/")
	     ("MELPA" . "http://melpa.org/packages/")
	     ))
(unless package--initialized (package-initialize))
;; You may need to do package-refresh-contents once
;; in a while
;; ############# REPOSITORIES END ################


;; ############### THEME BEGIN ###################

;; Zerodark theme
;;(load-theme 'zerodark t)
;;(zerodark-setup-modeline-format)

;; Modus themes (built in)
;; This theme was designed with the goal
;; of producing a set of color themes tha t
;; conform to the high standards of the
;; Web Content Accessibility Guidelines AAA
;; color contrast rules. They are also highly
;; customizable
(load-theme 'modus-vivendi t)
;; you can run modus-themes-toggle to toggle
;; between light and dark themes
;; Modus customization:
(customize-set-variable 'modus-themes-common-palette-overrides
			`(
			  ;; Make the mode-line borderless
			  (bg-mode-line-active bg-inactive)
			  (fg-mode-line-active fg-main)
			  (bg-mode-line-inactive bg-inactive)
			  (fg-mode-line-inactive fg-dim)
			  (border-mode-line-active bg-inactive)
			  (border-mode-line-inactive bg-nactive)
			  ))
;; ################ THEME END #################


;; ############### EVIL BEGIN #################
;; :q

(require 'evil)
(evil-mode 1)
;; ################## EVIL END ################


;; ############## WHICH KEY BEGIN #############
;; Display the key bindings following
;; an incomplete command

(require 'which-key)
(which-key-mode)
;; ############## WHICH KEY END ###############


;; @@@########## MARKDOWN BEGIN ###############
;; Similar to org-mode, markdown-mode
;; enables markdown highlights on emacs

(require 'markdown-mode)
;; ############## MARKDOWN END ################


;; ############### IVY BEGIN ##################
;; Ivy is a generic completition mechanism for
;; Emacs
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; ################ IVY END ###################


;; ################ AVY END ###################
;; Jump to bisible text using a char-based
;; decision tree

(require 'avy)
(global-set-key (kbd "C-:") 'avy-goto-char)
;; ################## AVY END #################


;; ############### DIFF-HL BEGIN ##############
;; Highlights uncommitted changes on the left of
;; the window

(require 'diff-hl)
(global-diff-hl-mode)
;; ################ DIFF-HL END ################


;; ############## UNDO-TREE BEGIN ##############
;; Show and manage history has a tree of changes
;; Try undo-tree-visualize

(require 'undo-tree)
(global-undo-tree-mode)
;; ############### UNDO-TREE END ###############


;; ################ EMMS BEGIN #################
;; Emms is an emacs music player

(require 'emms)
(emms-all)
(setq emms-player-list '(emms-player-vlc)
      emms-info-functions '(emms-info-native))
;; ################# EMMS END ##################


;; ############ OBSIDIAN BEGIN ################
;; Obsidian for emacs is a package aiming to
;; provide many functionalities from obsidian
;; like jumping between file references. it keeps
;; a database of all the files that needs to be
;; initialized once.

(require 'obsidian)
(obsidian-specify-path "~/ObsidianVault")
;; ############# OBSIDIAN END #################


;; ######## EMACS CUSTOMIZATION BEGIN #########
;; Here are emacs customizations that do
;; not require external packages

;; Cleanup the screen
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(display-time-mode 1)

;; Startup Screen
(setq-default inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; Dev
(global-display-line-numbers-mode)
(setq display-line-numbers 'relative)

;; Time
(setq display-time-format "%I:%M")
;; Battery
;; Do not show when the device has no battery
(require 'battery)
(when (and battery-status-function
	   (not (string-match-p "N/A"
				(battery-format "%B"
						(funcall battery-status-function)))))
  (display-battery-mode 1))
;; Fornt size
(set-face-attribute 'default nil :height 130)
;; ######### EMACS CUSTOMIZATION END ##########


;; ############### GAMES BEGIN ################
;; A collection of some games
;; tetris is installed by default

;; Monkey-type game
(require 'typit)
;; ################ GAMES END #################


;; ############### GNUS BEGIN #################
(setq gnus-select-method '(nntp "news.gmane.io"))
;; ################ GNUS END ##################


;; ############# ELFEED BEGIN #################
;; Read rss feeds on emacs

(require 'elfeed)
(require 'elfeed-dashboard)
(setq elfeed-feeds
      '("https://discourse.llvm.org/c/announce/46.rss"
	"https://discourse.llvm.org/c/llvm/5.rss"))
;; ############## ELFEED END #################


;; ############## GNUTLS BEGIN #################
;; Setup TLS

(setq-default gnutls-trustfiles (list "~/.emacs.d/cacert.pem"
                                      "/etc/pki/tls/certs/ca-bundle.pem"))
;; ############### GNUTLS END ##################


;; ############### MISC BEGIN #################
;; General utilty programs

;; Use org-drill for space repetition,
;; it is very nice.

;; PDF Reader
(pdf-tools-install)
(pdf-loader-install)
;; ############### MISC END ###################


;; ############## EXWM BEGIN ##################
;; Emac's X window manager, works fine

(require 'exwm)
  ;; Set the default number of workspaces
  (setq exwm-workspace-number 5)

  ;; When window "class" updates, use it to set the buffer name
  ;; (add-hook 'exwm-update-class-hook #'efs/exwm-update-class)

  ;; These keys should always pass through to Emacs
  (setq exwm-input-prefix-keys
    '(?\C-x
      ?\C-u
      ?\C-h
      ?\M-x
      ?\M-`
      ?\M-&
      ?\M-:
      ?\C-\M-j  ;; Buffer list
      ?\C-\ ))  ;; Ctrl+Space

  ;; Ctrl+Q will enable the next key to be sent directly
  (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

  ;; Set up global key bindings.  These always work, no matter the input state!
  ;; Keep in mind that changing this list after EXWM initializes has no effect.
  (setq exwm-input-global-keys
        `(
          ;; Reset to line-mode (C-c C-k switches to char-mode via exwm-input-release-keyboard)
          ([?\s-r] . exwm-reset)

          ;; Move between windows
          ([s-left] . windmove-left)
          ([s-right] . windmove-right)
          ([s-up] . windmove-up)
          ([s-down] . windmove-down)

          ;; Launch applications via shell command
          ([?\s-&] . (lambda (command)
                       (interactive (list (read-shell-command "$ ")))
                       (start-process-shell-command command nil command)))

          ;; Switch workspace
          ([?\s-w] . exwm-workspace-switch)

          ;; 's-N': Switch to certain workspace with Super (Win) plus a number key (0 - 9)
          ,@(mapcar (lambda (i)
                      `(,(kbd (format "s-%d" i)) .
                        (lambda ()
                          (interactive)
                          (exwm-workspace-switch-create ,i))))
                    (number-sequence 0 9))

          ;; Audio keys
          ([XF86AudioRaiseVolume] . (lambda ()
				      (interactive)
				      (shell-command "amixer set Master 5%+")))
          ([XF86AudioLowerVolume] . (lambda ()
				      (interactive)
				      (shell-command "amixer set Master 5%-")))
	   
          ([XF86AudioMute] . (lambda()
			       (interactive)
			       (shell-command "amixer set Master toggle")))
          ([XF86AudioMicMute] . (lambda()
				   (interactive)
				   (shell-command "amixer set Master toggle")))
          ;; Brightness
          ([XF86MonBrightnessUp] . (lambda()
				   (interactive)
				   (shell-command "echo $(( $(cat /sys/class/backlight/intel_backlight/brightness) + 10000)) > /sys/class/backlight/intel_backlight/brightness")))
          ([XF86MonBrightnessDown] . (lambda()
				   (interactive)
				   (shell-command "echo $(( $(cat /sys/class/backlight/intel_backlight/brightness) - 10000)) > /sys/class/backlight/intel_backlight/brightness")))
      ))

  (exwm-enable)
;; ############### EXWM END ##################


;; ############# AUTOGENERATED ###############

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(sudoku elfeed-dashboard elfeed bundler nndiscourse undo-tree diff-hl avy ivy pdf-tools org-drill typit which-key obsidian ## markdown-mode zerodark-theme vterm magit flycheck exwm evil))
 '(warning-suppress-types '((modus-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
