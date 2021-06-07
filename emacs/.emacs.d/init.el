;; -*- mode: elisp -*-

;; ****************************************************************************
;; PACKAGES
;; ****************************************************************************

;; enable using MELPA
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
 '(custom-safe-themes
   '("c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" default))
 '(fill-column 80)
 '(org-agenda-files
   '("~/Dropbox/org/school/jnp22021.org" "~/Dropbox/org/capture/tasks.org" "~/Dropbox/org/capture/work.org" "~/Dropbox/org/school/index.org" "~/Dropbox/org/school/io2021.org" "~/Dropbox/org/school/jao2021.org" "~/Dropbox/org/school/sk2021.org" "~/Dropbox/org/school/so2021.org" "~/Dropbox/org/school/www2021.org" "~/Dropbox/org/about.org" "~/Dropbox/org/elisp.org" "~/Dropbox/org/grammar.org" "~/Dropbox/org/gurus.org" "~/Dropbox/org/misc.org" "~/Dropbox/org/note.org" "~/Dropbox/org/passwords.org" "~/Dropbox/org/playground.org"))
 '(org-link-frame-setup
   '((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame)
     (gnus . org-gnus-no-new-news)
     (file . find-file)
     (wl . wl-other-frame)))
 '(package-selected-packages '(org-roam helm spacemacs-theme evil solarized-theme org)))

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
(global-set-key (kbd "C-c b") 'org-switchb)

;; follow link with RET
(setq org-return-follows-link nil)

;; extra to-do keywords
(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "CANCELLED" "DONE")))

(setq org-startup-folded t)

(setq org-log-done 'time)

(setq org-directory "~/Dropbox/org/")

;; add all the files located in subdirs of 'org-directory to the
;; 'org-agenda-files, there is a problem with new files. fix by adding on save
;; hook?  source:
;; https://stackoverflow.com/questions/11384516/how-to-make-all-org-files-under-a-folder-added-in-agenda-list-automatically
(setq org-agenda-files 
      (seq-filter (lambda(x) (not (string-match "/excluded/" (file-name-directory x)))) 
       (directory-files-recursively org-directory "\\.org$")))
					;
;; auxiliary directory for captured notes
(setq org-capture-directory (concat (file-name-as-directory org-directory) "capture"))

;; defines where captured notes should go
(setq org-default-notes-file (concat (file-name-as-directory org-capture-directory) "tasks.org"))

;; ****************************************************************************
;; ORG-ROAM
;; ****************************************************************************

;; require sqlite3
(add-to-list 'exec-path "path/to/sqlite3")

;; these need to be set up before any of the roam cmds is issued
;; (make-directory "~/Dropbox/org/org-roam")
(setq org-roam-directory "~/Dropbox/org/org-roam")

;; recommended in the manual
(add-hook 'after-init-hook 'org-roam-mode)

;; make find quick
;; (global-set-key (kbd "C-c C-f") 'org-roam-find-file)

;; capture template specific to org-roam
(setq org-roam-capture-templates
      '(("d" "default" plain (function org-roam--capture-get-point)
             "%?"
             :file-name "%<%Y%m%d%H%M%S>-${slug}"
             :head "#+title: ${title}\n"
             :unnarrowed t)))

(setq org-roam-index-file "~/Dropbox/org/org-roam/20210410003122-index.org")

;;; Recommendation for Windows users for performance
;;; https://github.com/org-roam/org-roam/issues/1289#issuecomment-744046148
(setq org-roam-db-update-method 'immediate)

;; open org-roam index file
(global-set-key (kbd "C-c x") 'org-roam-jump-to-index)
(global-set-key (kbd "C-c f") 'org-roam-find-file)
(global-set-key (kbd "C-c i") 'org-roam-insert)
(global-set-key (kbd "C-c t") 'org-roam-buffer-toggle-display)

;; ****************************************************************************
;; EVIL-MODE
;; ****************************************************************************

;; options
(setq evil-want-C-u-delete t)
(setq evil-want-C-u-scroll t)

;; enable evil mode
(require 'evil)
(evil-mode 1)

;; ****************************************************************************
;; HELM
;; ****************************************************************************

;; minimal config
;; (require 'helm-config)

;; list buffers (Emacs way)
;; (global-set-key (kbd "C-x C-b") 'helm-buffers-list)

;; list buffers (Vim way)
;; (define-key evil-ex-map "b" 'helm-buffers-list)

;; find files
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)

;; run extended command
;; (global-set-key (kbd "M-x") 'helm-M-x)

;; (helm-mode 1)

;; ****************************************************************************
;; COLOR THEME
;; ****************************************************************************

;; solarized by altercation
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;; (load-theme 'solarized t)

;; Don't change the font for some headings and titles
(setq solarized-use-variable-pitch nil)

;; make the modeline high contrast
(setq solarized-high-contrast-mode-line nil)

;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines nil)

;; Avoid all font-size changes
(setq solarized-height-minus-1 1.0)
(setq solarized-height-plus-1 1.0)
(setq solarized-height-plus-2 1.0)
(setq solarized-height-plus-3 1.0)
(setq solarized-height-plus-4 1.0)

;; solarized by bbatsov
(load-theme 'solarized-dark t)

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
;; (when (version<= "26.0.50" emacs-version )
;;   (global-display-line-numbers-mode))

;; relative line numbers
;; (setq display-line-numbers 'relative)

;; turn off bells
(setq ring-bell-function 'ignore)

;; set the initial window size
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 85) ; chars
              (height . 43) ; lines
              (left . 50)
              (top . 50)
              (font . "DejaVu Sans Mono-13")))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 85)
              (height . 43)
              (left . 50)
              (top . 50)
              (font . "DejaVu Sans Mono-13"))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))

;; set the default font for new frames
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-13"))

;; open init file
(global-set-key (kbd "C-c n") 
                (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

;; open main org file
(global-set-key (kbd "C-c o") 
                (lambda () (interactive) (find-file "~/Dropbox/org/misc.org")))

(delete-selection-mode 1)
(put 'upcase-region 'disabled nil)
