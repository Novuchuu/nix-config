;;; novuchuu.el --- novuchuu's personal Emacs configuration -*- lexical-binding: t; -*-

;; --- Visuals & UI ---
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq frame-title-format nil)
(add-to-list 'default-frame-alist '(undecorated . t))
(global-display-line-numbers-mode t)
(set-frame-parameter nil 'internal-border-width 0)

;; Font Optimized for 27" 1080p
(set-face-attribute 'default nil 
                    :family "JetBrainsMono Nerd Font" 
                    :height 113 
                    :weight 'regular)

;; --- Core Packages Behavior ---
(require 'which-key)
(which-key-mode)

(require 'org-journal)
(require 'vterm)
(require 'magit)

;; --- EMMS (Music Player) ---
(with-eval-after-load 'emms
  (emms-all)
  (setq emms-player-list '(emms-player-mpv))
  (setq emms-source-file-default-directory "~/Music/"))

;; --- Org Mode ---
(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t) (shell . t) (emacs-lisp . t) (clojure . t)))
  (setq org-confirm-babel-evaluate nil
        org-src-fontify-natively t
        org-src-tab-acts-natively t)
  (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
  (require 'org-tempo))

;; --- PDF Tools ---
(with-eval-after-load 'pdf-tools
  (pdf-tools-install))

;; --- Eglot (Minimalist LSP) ---
(use-package eglot
  :ensure nil
  :hook ((python-mode . eglot-ensure)
         (go-mode . eglot-ensure)
         (clojure-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs
               '(clojure-mode . ("clojure-lsp")))
  (add-to-list 'eglot-server-programs
               '(python-mode . ("pyright-langserver" "--stdio")))
  ;; Keep the echo area clean
  (setq eglot-ignored-server-capabilities '(:hoverProvider)))

;; --- Clojure & CIDER ---
(use-package clojure-mode
  :ensure nil
  :mode ("\\.clj\\'" "\\.edn\\'"))

(use-package cider
  :ensure nil
  :after clojure-mode
  :bind (("C-c C-z" . cider-switch-to-repl-buffer)
         ("C-c C-k" . cider-load-buffer)
         ("C-c C-c" . cider-eval-defun-at-point))
  :config
  (setq cider-clojure-cli-command "clojure" ; Use standard CLI, not Babashka
        cider-repl-display-help nil
        cider-repl-pop-to-buffer-on-connect nil
        cider-repl-use-pretty-printing t
        ;; Let Eglot handle documentation/navigation
        cider-eldoc-display-for-symbol-at-point nil
        cider-use-xref nil))

;; --- Structural Editing (Paredit) ---
(use-package paredit
  :ensure nil
  :hook ((clojure-mode . enable-paredit-mode)
         (emacs-lisp-mode . enable-paredit-mode)
         (cider-repl-mode . enable-paredit-mode))
  :config
  (show-paren-mode 1))

;; --- Modern Completion (Corfu) ---
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 1)
  (corfu-auto-delay 0.1)
  (corfu-separator ?\s)
  (corfu-quit-at-boundary nil)
  (corfu-quit-no-match t)
  (corfu-preview-current nil)
  (corfu-preselect 'prompt)
  :config
  (setq tab-always-indent 'complete))

(provide 'novuchuu)
;;; novuchuu.el ends here
