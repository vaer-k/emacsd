;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "https://stable.melpa.org/packages/")
                    ("marmalade" . "http://marmalade-repo.org/packages/")
                    ("tromey" . "http://tromey.com/elpa/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(setq package-pinned-packages '((cider . "melpa-stable")
                                (ensime . "melpa-stable")
                                (alchemist . "melpa")
                                (elixir-mode . "melpa")))

;; LOAD and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(use-package paredit :ensure t)                         
(use-package clojure-mode :ensure t)                    
(use-package clojure-mode-extra-font-locking :ensure t) 
(use-package cider :ensure t)
(use-package unicode-fonts :ensure t)
(use-package projectile :ensure t)                      
(use-package rainbow-delimiters :ensure t)              
(use-package tagedit :ensure t)                         
(use-package better-defaults :ensure t)                 
(use-package elpy :ensure t)                            
(use-package flycheck :ensure t)                        
(use-package py-autopep8 :ensure t)
(use-package blacken :ensure t)
(use-package haskell-mode :ensure t)
(use-package ensime :ensure t)                          
(use-package iedit :ensure t)                           
(use-package ivy :ensure t)                             
(use-package counsel :ensure t)                         
(use-package neotree :ensure t)
(use-package all-the-icons :ensure t)                   
(use-package which-key :ensure t)                       
(use-package magit :ensure t)
(use-package smooth-scrolling :ensure t)
(use-package hungry-delete
  :ensure t
  :bind ("C-c <backspace>" . 'hungry-delete-backward)
  :bind ("C-c C-d" . 'hungry-delete-forward))
(use-package doom-themes :ensure t)
(use-package doom-modeline :ensure t)
(use-package alchemist :ensure t)
(use-package web-mode :ensure t)


;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc-personal.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
;; Requires companion setup file in .emacs.d/customizations
(defvar langs '("clojure" "python" "haskell" "js" "elixir"))
(dolist (l langs)
  (load (concat "setup-" l ".el")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-modules
   (quote
    (autoaway hl-nicks completion netsplit fill button match track readonly networks ring autojoin noncommands irccontrols move-to-prompt stamp menu list)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(package-selected-packages
   (quote
    (alchemist web-mode emojify unicode-fonts blacken doom-themes doom-modeline smooth-scrolling erc-hl-nicks hungry-delete magit which-key neotree counsel all-the-icons spacemacs-theme iedit ensime haskell-mode py-autopep8 flycheck elpy better-defaults tagedit rainbow-delimiters projectile cider clojure-mode-extra-font-locking clojure-mode paredit use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
