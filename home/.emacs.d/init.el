(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;(load "~/.emacs.d/modeline.el")

;(setq url-proxy-services
      ;'(("no_proxy" . "^\\(localhost\\|10.*\\)")
      ;("http" . "localhost:3128")
      ;("https" . "localhost:3128")))

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)

(defun ensure-package-installed(&rest packages)
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
     nil
       (if (y-or-n-p (format "Package %s is missing. Install it?" package))
       (package-install package)
     package)))
   packages))

(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(package-initialize)

(ensure-package-installed
 'evil
 'helm
 'linum-relative
 'ace-jump-mode
 'key-chord
 'solarized-theme
 'zenburn-theme
 'monokai-theme
 )

(require 'evil)
(evil-mode t)

(require 'ido)
(ido-mode t)

(require 'linum-relative)

(tool-bar-mode -1)

(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 120))

(global-linum-mode t)
(global-hl-line-mode t)

(display-time)

(setq next-line-add-newlines nil)

(fset 'yes-or-no-p 'y-or-n-p)

(setq inhibit-splash-screen t)
;;(switch-to-buffer "**")

(require 'cl)
(defun font-candidate (&rest fonts)
  "Return existing font which first match."
  (find-if (lambda (f) (find-font (font-spec :name f))) fonts))

;; Emacs23 style font setting.
(set-face-attribute 'default nil :font (font-candidate '"Ubuntu Mono derivative Powerline-20:weight=normal"))

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

;; Remap org-mode meta keys for convenience
(mapcar (lambda (state)
      (evil-declare-key state org-mode-map
        (kbd "M-l") 'org-metaright
        (kbd "M-h") 'org-metaleft
        (kbd "M-k") 'org-metaup
        (kbd "M-j") 'org-metadown
        (kbd "M-L") 'org-shiftmetaright
        (kbd "M-H") 'org-shiftmetaleft
        (kbd "M-K") 'org-shiftmetaup
        (kbd "M-J") 'org-shiftmetadown))
    '(normal insert))

(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
  (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

;;(load-theme 'tango-dark)
(load-theme 'monokai)
