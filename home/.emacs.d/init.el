;;; init.el -- Summary
;;; Commentary:
;;; Code:

(when (eq "1" (getenv "RUNCOM_USE_PROXY"))
  (setq url-proxy-services
	'(("no_proxy" . "^\\(localhost\\|10.*\\)")
	  ("http" . "localhost:3128")
	  ("https" . "localhost:3128")))
  )

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-list '(
		     recentf
		     helm helm-ag
		     evil evil-leader evil-nerd-commenter
		     ace-jump-mode ace-window ace-link
		     key-chord dired+ 
		     smart-mode-line
		     linum-relative
		     smartparens
		     visual-regexp-steroids
		     auto-complete

		     icicles
		     magit
		     flx-ido
		     rainbow-mode

		     flycheck
		     latex-preview-pane
		     markdown-mode+
		     jedi js2-mode haskell-mode go-mode

		     nyan-mode xkcd

		     solarized-theme
		     monokai-theme
		     ))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'evil-leader)
(global-evil-leader-mode)

(require 'evil)
(evil-mode t)

(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  ;;"\\" 'evilnc-comment-operator ; if you prefer backslash key
  )


(require 'recentf)
(setq recentf-max-saved-items 50)

(require 'ido)
(require 'smartparens-config)
(require 'linum-relative)
(require 'flx-ido)
(ido-mode t)
(ido-everywhere t)
(flx-ido-mode t)

;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(ac-config-default)

(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t) ; optional

(tool-bar-mode -1)

;; (require 'icicles)
;; (icy-mode 1)

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
  "Return first existing font from FONTS."
  (find-if (lambda (f) (find-font (font-spec :name f))) fonts))

(set-face-attribute 'default nil :font (font-candidate '"Input Mono-16:weight=light" "Ubuntu Mono derivative Powerline-20:weight=normal"))

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


(show-paren-mode 1)

;;(load-theme 'tango-dark)
(load-theme 'monokai)

(define-key emacs-lisp-mode-map [(f1)] 'describe-foo-at-point)


(provide 'init)
;;; init.el ends here
