(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/init"))

(require 'package)
(add-to-list 'package-archives
  '("marmalade" .  "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(setq autoload-dir (expand-file-name "autoload.d" user-emacs-directory))
(add-to-list 'load-path autoload-dir)

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

(add-hook 'python-mode-hook 'my-python-mode-hook)

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

(require 'org)
(add-to-list  'auto-mode-alist '("\\.org$" . org-mode))
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

(set-frame-parameter (selected-frame) 'alpha '(85 80))
(add-to-list 'default-frame-alist '(alpha 85 80))

;;; Auto-generated stuff below here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%5i ")
 '(ansi-color-names-vector
   ["#fdf6e3" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(ansi-term-color-vector
   [unspecified "#081724" "#ff694d" "#68f6cb" "#fffe4e" "#bad6e2" "#afc0fd" "#d2f1ff" "#d3f9ee"])
 '(column-number-mode t)
 '(fci-rule-character-color "#202020")
 '(fci-rule-color "#eee8d5")
 '(fill-column 130)
 '(font-use-system-font t)
 '(fringe-mode 10 nil (fringe))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(main-line-color1 "#29282E")
 '(main-line-color2 "#292A24")
 '(main-line-separator-style (quote chamfer))
 '(markdown-enable-math t)
 '(minimap-window-location (quote left))
 '(org-agenda-files (quote ("~/org/research.org" "~/org/personal.org")))
 '(powerline-color1 "#29282E")
 '(powerline-color2 "#292A24")
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#586e75")
 '(vc-annotate-color-map
   (quote
    ((20 . "#990A1B")
     (40 . "#FF6E64")
     (60 . "#cb4b16")
     (80 . "#7B6000")
     (100 . "#b58900")
     (120 . "#DEB542")
     (140 . "#546E00")
     (160 . "#859900")
     (180 . "#B4C342")
     (200 . "#3F4D91")
     (220 . "#6c71c4")
     (240 . "#9EA0E5")
     (260 . "#2aa198")
     (280 . "#69CABF")
     (300 . "#00629D")
     (320 . "#268bd2")
     (340 . "#69B7F0")
     (360 . "#d33682"))))
 '(vc-annotate-very-old-color "#93115C"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "light gray" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-comment-face ((t (:foreground "DodgerBlue3"))))
 '(font-lock-constant-face ((t (:foreground "orange red"))))
 '(font-lock-function-name-face ((t (:foreground "cyan1"))))
 '(font-lock-keyword-face ((t (:foreground "dark orange"))))
 '(font-lock-string-face ((t (:foreground "red"))))
 '(font-lock-type-face ((t (:foreground "lawn green"))))
 '(font-lock-variable-name-face ((t (:foreground "light gray"))))
 '(font-lock-warning-face ((t (:inherit error :foreground "red" :weight extra-bold))))
 '(link ((t (:foreground "gold" :underline t))))
 '(linum ((t (:inherit (shadow default) :background "black" :foreground "DarkOrange2"))))
 '(mode-line ((t (:background "gray10" :foreground "green" :box (:line-width -1 :style released-button)))))
 '(mode-line-buffer-id ((t (:foreground "green yellow" :weight bold :height 1.0))))
 '(mode-line-inactive ((t (:inherit mode-line :background "grey10" :foreground "slate gray" :box (:line-width -1 :color "grey40") :weight light))))
 '(org-checkbox ((t (:inherit bold :foreground "RoyalBlue1"))))
 '(org-done ((t (:foreground "forest green" :weight bold))))
 '(org-todo ((t (:foreground "OrangeRed1" :weight bold))))
 '(tool-bar ((t (:background "grey75" :foreground "black" :box (:line-width 1 :style released-button))))))
