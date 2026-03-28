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

;; Font Optimized for 27" 1080p (Pixel density is lower, so 11.3pt is crisp)
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

;; --- Org Mode (For Cybersecurity Notes) ---
(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t) (shell . t) (emacs-lisp . t)))
  (setq org-confirm-babel-evaluate nil
        org-src-fontify-natively t
        org-src-tab-acts-natively t)
  (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
  (require 'org-tempo))

;; --- PDF Tools ---
(with-eval-after-load 'pdf-tools
  (pdf-tools-install))

(provide 'novuchuu)
;;; novuchuu.el ends here
