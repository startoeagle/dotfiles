(require 'package)
(add-to-list 'package-archives				  
 	     '("emlpa" . "https://melpa.org/packages/"))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'helm)
(package-initialize)
;; (package-refresh-contents)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(setq org-log-done 'time)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t))) ; this line activates dot

(with-eval-after-load 'ob
  ;; Optional for syntax highlight of napkin-puml src block.
  ;; (require 'plantuml)
  (require 'ob-napkin)
  (require 'ob-python)
  )

(setq default-tab-width 4)
