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

;; ;; "after" macro definition
;; (if (fboundp 'with-eval-after-load)
;;     (defmacro after (feature &rest body)
;;       "After FEATURE is loaded, evaluate BODY."
;;       (declare (indent defun))
;;       `(with-eval-after-load ,feature ,@body))
;;   (defmacro after (feature &rest body)
;;     "After FEATURE is loaded, evaluate BODY."
;;     (declare (indent defun))
;;     `(eval-after-load ,feature
;;        '(progn ,@body))))


(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-list '(
                     recentf
                     ag
                     helm helm-ag
                     evil evil-leader evil-nerd-commenter
                     ace-jump-mode ace-window ace-link
                     key-chord
                     dired+
                     smart-mode-line
                     linum-relative
                     smartparens
                     visual-regexp-steroids
                     auto-complete

                     smooth-scrolling

                     flx-ido

                     magit
                     rainbow-mode
                     flycheck
                     ;;latex-preview-pane
                     markdown-mode+
                     jedi js2-mode haskell-mode go-mode

                     nyan-mode
                     ;;xkcd

                     color-theme-approximate
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

;; If leader key doesn't work
;; http://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/
;;(setq evil-leader/in-all-states 1)

(evil-leader/set-key
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

(evil-leader/set-key
  "c SPC" 'evilnc-comment-or-uncomment-lines
  ;; "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  ;; "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  ;; "cc" 'evilnc-copy-and-comment-lines
  ;; "cp" 'evilnc-comment-or-uncomment-paragraphs
  ;; "cr" 'comment-or-uncomment-region
  ;; "cv" 'evilnc-toggle-invert-comment-line-by-line
  ;; "\\" 'evilnc-comment-operator ; if you prefer backslash key
  )

(require 'recentf)
(setq recentf-max-saved-items 50)

(require 'ido)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

(require 'smartparens-config)
(require 'linum-relative)

;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(ac-config-default)

(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t) ; optional

(tool-bar-mode -1)
(setq inhibit-splash-screen t)

(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 120))

(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

(global-linum-mode t)
(column-number-mode 1)
(global-hl-line-mode t)
(display-time-mode 1)
(setq display-time-24hr-format t)
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq next-line-add-newlines nil)
(fset 'yes-or-no-p 'y-or-n-p)

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

;; Make C-u behave as in vim
;; http://stackoverflow.com/questions/14302171/ctrl-u-in-emacs-when-using-evil-key-bindings
;; (setq evil-want-C-u-scroll t)
;;(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

;; Let's go with C-j/k for now instead.
(define-key evil-normal-state-map (kbd "C-k") (lambda ()
                    (interactive)
                    (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-j") (lambda ()
                        (interactive)
                        (evil-scroll-down nil)))

;; http://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/
;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)


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

;; Save cursor position between invocations
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

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

(load-theme 'monokai)
(color-theme-approximate-on)

(provide 'init)
;;; init.el ends here
