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
 'solarized-theme
 'ace-jump-mode
 'key-chord
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
(set-face-attribute 'default nil :font (font-candidate '"Menlo-15:weight=normal" "Consolas-15:weight=normal" "Ubuntu Mono-15:weight=normal"))

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

(custom-set-variables
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 )

;;(load-theme 'tango-dark)
(load-theme 'solarized-dark)
