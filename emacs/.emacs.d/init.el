;; ---------------------------------------------------------------------------
;; org-mode
;; ---------------------------------------------------------------------------

;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;; Enable Org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen;; Set a Color Theme Permanently

;; add workflow states for todos
(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

;; enable speed keys
(setq org-use-speed-commands t)

;; ---------------------------------------------------------------------------
;; melpa
;; ---------------------------------------------------------------------------

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; ---------------------------------------------------------------------------
;; color theme
;; ---------------------------------------------------------------------------

;; set permanent color theme
(load-theme 'atom-one-dark t)

;; disable emacs's automatic backup~ file
(setq make-backup-files nil)

;; stop creating those #auto-save# files
(setq auto-save-default nil)
      
;; insert a space after line number
;; (setq linum-format "%d ")

;; disable emacs's automatic backup ~ file
(setq make-backup-files nil)

;; stop creating those #auto-save# files
(setq auto-save-default nil)

;; Enable mouse support in a terminal
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

;; build agenda view from given files
(setq org-agenda-files (list "~/Dropbox/notes/"))
  (add-to-list 'org-agenda-files (expand-file-name "~/Dropbox/notes/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d1af5ef9b24d25f50f00d455bd51c1d586ede1949c5d2863bef763c60ddf703a" "f56eb33cd9f1e49c5df0080a3e8a292e83890a61a89bceeaa481a5f183e8e3ef" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default))
 '(org-agenda-files
   '("~/Dropbox/notes/rainer-konig-org-tut/e03s01-schedule-deadlines-and-agenda-views/after/mylife.org" "/home/simon/Dropbox/notes/" "~/Dropbox/notes/"))
 '(package-selected-packages '(atom-one-dark-theme zenburn-theme solarized-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; turn off bells
(setq ring-bell-function 'ignore)

;; set the initial window size
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 81) ; chars
              (height . 42) ; lines
              (left . 50)
              (top . 50)
              (font . "DejaVu Sans Mono-13")))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 80)
              (height . 42)
              (left . 50)
              (top . 50)
              (font . "DejaVu Sans Mono-13"))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))

;; set the default font for new frames
;; (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-13"))

;; enable line numbers
;; (when (version<= "26.0.50" emacs-version )
;;   (global-display-line-numbers-mode))

;; relative line numbers
;; (setq display-line-numbers 'relative)
