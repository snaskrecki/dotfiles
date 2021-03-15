;; -*- mode: elisp -*-

;; ****************************************************************************
;; PACKAGES
;; ****************************************************************************

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; ****************************************************************************
;; CUSTOM VARIABLES
;; ****************************************************************************

;; emacs's automatically set variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fill-column 80)
 '(org-directory "~/Dropbox/orgwiki")
 '(org-agenda-files 
    (directory-files-recursively "~/Dropbox/orgwiki" "\\.org$")
    '("~/tmp/org-tut/2.org" "~/tmp/org-tut/4.org")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVuSansMono Nerd Font Mono" :foundry "PfEd" :slant normal :weight normal :height 128 :width normal)))))

;; ****************************************************************************
;; ORG MODE
;; ****************************************************************************

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

;; org mode guide recommended key bindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; extra to-do keywords
(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

;; ****************************************************************************
;; COLOR THEME
;; ****************************************************************************

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized t)

;; ****************************************************************************
;; MISCELLANEOUS
;; ****************************************************************************

;; break lines when the break column is reached
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook
	  (lambda ()
	    (set-fill-column 80)))

(add-hook 'text-mode-hook (lambda ()
  (display-fill-column-indicator-mode)))

;; disable emacs's automatic backup~ file
(setq make-backup-files nil)

;; stop creating those #auto-save# files
(setq auto-save-default nil)

;; enable line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; relative line numbers
(setq display-line-numbers 'relative)

;; turn off bells
(setq ring-bell-function 'ignore)

;; set the initial window size
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 88) ; chars
              (height . 43) ; lines
              (left . 50)
              (top . 50)
              (font . "DejaVu Sans Mono-13")))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 88)
              (height . 43)
              (left . 50)
              (top . 50)
              (font . "DejaVu Sans Mono-13"))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))

;; set the default font for new frames
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-13"))

;; open on startup
(find-file "~/Dropbox/orgwiki/misc.org") 
