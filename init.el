;;; init.el -- my emacs init file
;;; Commentary:
;;; Code:
(setq emacs-load-start-time (current-time))

;(setq package-enable-at-startup nil)
;(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/init"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/themes"))
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes"))

(require 'package)
(add-to-list 'package-archives
  '("marmalade" .  "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)

(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Couldn't install package `%s': %S" package err)
     nil)))


(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'init-evil)
(require 'init-flycheck)

(require 'git-commit)

; Allows the frame to be truly maximised, regardless of font choice
(setq frame-resize-pixelwise t)

(setq autoload-dir (expand-file-name "autoload.d" user-emacs-directory))
(add-to-list 'load-path autoload-dir)

(scroll-bar-mode -1)

(defmacro with-system (type &rest body)
  "Evaluate body if `system-type' equals type."
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))
  
(with-system darwin            
             (defadvice yes-or-no-p (around prevent-dialog activate)
               "Prevent yes-or-no-p from activating a dialog"
               (let ((use-dialog-box nil))
                 ad-do-it))
             (defadvice y-or-n-p (around prevent-dialog-yorn activate)
               "Prevent y-or-n-p from activating a dialog"
               (let ((use-dialog-box nil))
                 ad-do-it))
             (setq custom-file "~/.emacs.d/custom-darwin.el"))

(with-system gnu/linux
  (setq custom-file "~/.emacs.d/custom-linux.el"))

(with-system windows-nt
  (setq custom-file "~/.emacs.d/custom-windows.el"))

(require 'init-helm)

(require 'better-defaults)

(require 'git-gutter-fringe)

(require 'epa-file)
(epa-file-enable)

(autoload 'f90-mode "f90" "Fortran 90 mode" t)
(add-hook 'f90-mode-hook 'my-f90-mode-hook)

;; This highlights OMP sentinals and compiler directives of the form !$something 
(add-hook 'f90-mode-hook 
	  (lambda ()
	    (font-lock-add-keywords nil
	      '(("!\\(\\$[^ ]+\\) " 1
		 font-lock-keyword-face t)))))

;; Give  !TODO: comments a little more visibility
(add-hook 'f90-mode-hook 
	  (lambda ()
	    (font-lock-add-keywords nil
	      '(("!\\(TODO:\\)" 1
		 font-lock-warning-face t)))))


;; Turn on syntax highlighting for fortran 90 mode
(defun my-f90-mode-hook ()
  (setq f90-font-lock-keywords f90-font-lock-keywords-3)
  (abbrev-mode 1)
  (turn-on-font-lock)
  (auto-fill-mode 0)
  (linum-mode 1)
  (git-gutter-mode 1))

(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(add-hook 'python-mode-hook 'my-python-mode-hook)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(defun my-python-mode-hook ()
  (linum-mode 1)
  (git-gutter-mode 1))

;(require 'evil)
;(evil-mode 1)

(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;(require 'org)
;(add-to-list  'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'flyspell-mode)

(setq 
 backup-by-copying t
 backupt-directory-alist
  '(("." . "~/saves"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)


(require 'init-auctex)
(require 'init-org)

(when (require 'time-date nil t)
   (message "Emacs startup time: %d seconds."
    (time-to-seconds (time-since emacs-load-start-time)))
   )

;; This stuff sets the background to transparent
(add-to-list 'default-frame-alist '(background-color . "black"))

;(set-frame-parameter (selected-frame) 'alpha '(75 75))
;(add-to-list 'default-frame-alist '(alpha 75 75))

;; fix colors for terminal emacs
;(defun on-after-init ()
(defun on-after-clientframe-init (&optional frame)
  (select-frame frame)
  (message (format "%s" window-system))
  (message (format "%s" (display-graphic-p)))
  (unless (display-graphic-p)
    (set-face-background 'default nil) ; selected-frame
    (set-background-color nil)
    (setq-default left-fringe 10)
    (setq linum-format "%d ")
    (xterm-mouse-mode 1)))

(defun contextual-menubar (&optional frame)
  "Display the menubar in FRAME (default: selected frame) if on a graphical display, but hide it if in terminal."
  (interactive)
  (set-frame-parameter frame 'menu-bar-lines (if (display-graphic-p frame) 1 0)))

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default nil (selected-frame))
    ;(set-face-background 'default "unspecified-bg" (selected-frame))
    (set-background-color nil)
    (setq-default left-fringe 10)
    (setq linum-format "%d ")
    (xterm-mouse-mode 1)))

(add-hook 'window-setup-hook 'on-after-init)
(add-hook 'after-make-frame-functions 'on-after-clientframe-init)
(add-hook 'after-make-frame-functions 'contextual-menubar)
(add-hook 'after-init-hook 'contextual-menubar)

(load custom-file)
