(require 'org)

;; Load the actual configuration file
(org-babel-load-file
    (expand-file-name (concat user-emacs-directory "init/init.org")))
