;; .emacs.d/init.el

;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    elpy                            ;; Emacs Lisp Python Environment
    material-theme                  ;; Theme
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; ===================================
;; Basic Customization
;; ===================================

(setq inhibit-startup-message t)    ;; Hide the startup message
(load-theme 'material t)            ;; Load material theme
(global-linum-mode t)               ;; Enable line numbers globally
(global-unset-key (kbd "C-z"))      ;; Disable c-z

;; ====================================
;; Development Setup
;; ====================================
;; Enable elpy
;; (elpy-enable)

;; My terminal stuff
;; (defvar counter 0)
;; (defun my/open-terminal ()
;;   "Open a new terminal and rename the buffer"
;;   (interactive)
;;   (setq counter (+ counter 1))
;;   (setq title (concat "Terminal-" (number-to-string counter)))
;;   (setq buf-title (concat "*" title "*"))
;;   (message buf-title)
;;   (set-buffer (make-term title "/bin/zsh"))
;;   (term-mode)
;;   (term-char-mode)
;;   (switch-to-buffer buf-title)
;; )

;; multi-term
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'multi-term)

(autoload 'multi-term "multi-term" nil t)
(autoload 'multi-term-next "multi-term" nil t)

(setq multi-term-program "/bin/zsh")

(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term) ;; create a new one

;; clipboard
(setq x-select-enable-clipboard t)

;; User-Defined init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(material-theme better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
