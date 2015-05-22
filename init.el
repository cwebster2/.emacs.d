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

(package-initialize)

(setq autoload-dir (expand-file-name "autoload.d" user-emacs-directory))
(add-to-list 'load-path autoload-dir)

(scroll-bar-mode -1)

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

(set-frame-parameter (selected-frame) 'alpha '(85 80))
(add-to-list 'default-frame-alist '(alpha 85 80))

;; fix colors for terminal emacs
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))
    (set-background-color nil)
    (menu-bar-mode -1)))
    

(add-hook 'window-setup-hook 'on-after-init)


;;; Auto-generated stuff below here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (Casey)))
 '(custom-safe-themes
   (quote
    ("de6499d0b856efd99e789d0231c0c1920793152bc7c49345bdb1e59e984bf937" "53788b9b4aeee9c9ce2c271272bfee98bb556ace653159d3b220457dcbaa7f51" "c76d01b885057834f7852702f0d9bbd8312c88eb05ea8f6ce70a57d37a593f00" "b380f6457c0402e95175404ad389360cb3d6e66597f5f69bdd8e216c087fd694" "45e385ba0de50aa8d84dc73ac4c367f1d8c978270ab4e7bdeac9d707865121ec" "febb4cb705efa4c593c8df1f75127f7a2778e8eaf6d778ad2496442921d11ce7" "e43be2fe61570b82342856caf385553ecbeaa21ddc005ddf6a8c20540a8fe005" "a5325d384eb0a51eb9434a592ea61e631835ad0a1308c110ed48a5d735b62890" "4649b267049652533e1df90b015c7dc9d612206c352eacebb174eb495b482280" "f60b41269b6487674daa2f14533e71a4ab8c99646a16ef0fb7928c9d86580704" "bd0ea0c555e2adac37984ebe499ab2e5862bd75458f6c45b4faf42ef3be1d67d" "b484408a8e65868a528f575b487bf21ef9f9423ca0e36575bfda5cb18987cf65" "68481369f066ffbbf0a9b63db91cb54ddedd4405b2cda92a0a47b5f59e8648b5" "dfee265113cf432c806dd10968ac686daba99db38cebebe0ae88f66770bc0ffc" "bf0731db5f7332d275b8ce34aba666b56bd995b8aed51cec3788303d90bf8efb" "f3cac73dbec34908b0d96ff5956ed6d35989113666f321921b38ae83df185b0e" "e0c52331434bee7ecb33970d7eec64e52ec8f153bf6907b5141f611fcf2a4479" "19f346766d1a908cef9c8c59b8cc66cbac65baa01748f51894c74be87ebf9ef3" "b23ebbf966b416b846a852d4ee56f4f834ab967421c7ee18854f12c507d8668d" default)))
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
 '(powerline-color1 "#29282E")
 '(powerline-color2 "#292A24")
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
 '(default ((t (:background nil)))))
