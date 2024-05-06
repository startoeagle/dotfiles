(load-theme 'wombat)

;; Initialize package sources
(require 'package)

(package-initialize)

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
    (package-install 'use-package)
    (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package company
  :init (company-mode)
  :bind (:map company-active-map
	 ("C-n" . company-select-next)
	 ("C-p" . company-select-previous))
  :config
  (setq company-idle-delay 0.3)
  (global-company-mode t))
(use-package parinfer-rust-mode
  :hook emacs-lisp-mode
  :init
  (setq parinfer-rust-auto-download 1))    
(use-package helm
  :init (helm-mode)
  :bind
  ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files))

(use-package helpful
  :bind
    ("C-h f" . #'helpful-callable)
    ("C-h v" . #'helpful-variable)
    ("C-h k" . #'helpful-key)
    ("C-c C-d" . #'helpful-at-point)
    ("C-h F" . #'helpful-function)
    ("C-h C" . #'helpful-command))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-dracula t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(tool-bar-mode -1)
(scroll-bar-mode -1)

(use-package which-key
   :init (which-key-mode))

(use-package evil
  :init (evil-mode))

(use-package key-chord
  :init
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-mode 1))

(use-package eglot
  :hook '(python-mode-hook))

(use-package kotlin-mode
  :mode ("\\.kt\\'" . kotlin-mode))

(use-package sly)

(use-package php-mode
  :pin non gnu)

(add-hook 'org-mode-hook 'turn-on-flyspell)
(add-hook 'org-mode-hook 'flyspell-buffer)

(defun my-org-confirm-babel-evaluate (lang body)
 (not (string= lang "ditaa")))  ;don't ask for ditaa
(setq org-confirm-babel-evaluate #'my-org-confirm-babel-evaluate)

(use-package ob-kotlin)
(use-package ob-php)
(org-babel-do-load-languages
    'org-babel-load-languages
    '((python . t)
      (kotlin . t)
      (php . t)
      (shell . t)))
