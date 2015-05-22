(deftheme Casey
  "My Personal Theme! v0.1")

(let (
      (background nil)
      (foreground "light gray")
      (selection  "blue3")
      (comment    "#585858")
      (cursor     "#949494")
      (gray       "#303030")
      (gray-2     "#1c1c1c")
      (gray-3     "#121212")
      (gray-4     "#080808")
      (red        "#d54e53")
      (red-2      "#cd0000")
      (red-3      "#5f0000")
      (yellow     "#e7c547")
      (yellow-2   "#cdcd00")
      (orange     "#e78700")
      (green      "#afd75f")
      (aqua       "#00cdcd")
      (blue       "#5f87d7")
      (purple     "#af87d7"))


  (custom-theme-set-faces
   'Casey

   ;; main stuff
   '(default ((t (:inherit nil
                           :stipple nil
                           :background nil
                           :foreground "light gray"
                           :inverse-video nil
                           :box nil
                           :strike-through nil
                           :overline nil
                           :underline nil
                           :slant normal
                           :weight normal
                           :height 105
                           :width normal
                           ;:foundry "xos4" :family "Terminus"
                           :font "DejaVu Sans Mono-10"))))
   `(region ((t (:background ,selection :foreground "white"))))
   `(fringe ((t (:background ,gray-4))))
   `(minibuffer-prompt ((t (:foreground ,orange :background ,gray-2))))
   `(hl-line ((t (:background ,gray-3))))
   
   ;; fontlock-mode
   '(font-lock-builtin-face ((t (:foreground "LightSteelBlue")))) 
   `(font-lock-comment-face ((t (:foreground ,comment))))
   '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
   '(font-lock-constant-face ((t (:foreground "orange red"))))
   '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
   '(font-lock-function-name-face ((t (:foreground "cyan1"))))
   '(font-lock-keyword-face ((t (:foreground "dark orange"))))
   '(font-lock-negation-char-face ((t nil)))
   '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
   '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
   '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
   '(font-lock-string-face ((t (:foreground "red"))))
   '(font-lock-type-face ((t (:foreground "lawn green"))))
   '(font-lock-variable-name-face ((t (:foreground "light gray"))))
   '(font-lock-warning-face ((t (:inherit error :foreground "red" :weight extra-bold))))

   ;; linum
   `(linum ((t (:background nil :foreground ,gray))))

   ;; show parens mode
   `(show-parens-match ((t (:background ,purple :foreground ,gray-2))))
   `(show-parens-mismatch ((t (:background ,orange :foreground ,gray-2))))

   ;; unorganized below
   '(cursor ((t (:background "white"))))
   '(fixed-pitch ((t (:family "Monospace"))))
   '(variable-pitch ((t (:family "Sans Serif"))))
   '(escape-glyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
   
   
   
   '(highlight ((t (:background "darkolivegreen" :inverse-video t))))
   
   '(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "grey50")) (((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey70")) (((class color) (min-colors 8) (background light)) (:foreground "green")) (((class color) (min-colors 8) (background dark)) (:foreground "yellow"))))
   '(secondary-selection ((((class color) (min-colors 88) (background light)) (:background "yellow1")) (((class color) (min-colors 88) (background dark)) (:background "SkyBlue4")) (((class color) (min-colors 16) (background light)) (:background "yellow")) (((class color) (min-colors 16) (background dark)) (:background "SkyBlue4")) (((class color) (min-colors 8)) (:foreground "black" :background "cyan")) (t (:inverse-video t))))
   '(trailing-whitespace ((((class color) (background light)) (:background "red1")) (((class color) (background dark)) (:background "red1")) (t (:inverse-video t))))
   
   
   ;; UI   
   '(button ((t (:inherit (link)))))
   '(link ((t (:foreground "gold" :underline t))))
   '(link-visited ((default (:inherit (link))) (((class color) (background light)) (:foreground "magenta4")) (((class color) (background dark)) (:foreground "violet"))))
   
   '(header-line ((default (:inherit (mode-line))) (((type tty)) (:underline (:color foreground-color :style line) :inverse-video nil)) (((class color grayscale) (background light)) (:box nil :foreground "grey20" :background "grey90")) (((class color grayscale) (background dark)) (:box nil :foreground "grey90" :background "grey20")) (((class mono) (background light)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "black" :background "white")) (((class mono) (background dark)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "white" :background "black"))))
   '(tooltip ((((class color)) (:inherit (variable-pitch) :foreground "black" :background "lightyellow")) (t (:inherit (variable-pitch)))))
   '(mode-line ((t (:background "gray10" :foreground "green" :box (:line-width -1 :style released-button)))))
   '(mode-line-buffer-id ((t (:foreground "green yellow" :weight bold :height 1.0))))
   '(mode-line-emphasis ((t (:weight bold))))
   '(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
   '(mode-line-inactive ((t (:inherit mode-line :background "grey10" :foreground "slate gray" :box (:line-width -1 :color "grey40") :weight light))))


   '(isearch ((t (:foreground "brown4" :background "palevioletred2" :inverse-video t))))
   '(isearch-fail ((t (:background "red4" :inverse-video t))))
   '(lazy-highlight ((t (:background "paleturquoise4" :underline (:color foreground-color :style line)))))
   '(match ((((class color) (min-colors 88) (background light)) (:background "yellow1")) (((class color) (min-colors 88) (background dark)) (:background "RoyalBlue3")) (((class color) (min-colors 8) (background light)) (:foreground "black" :background "yellow")) (((class color) (min-colors 8) (background dark)) (:foreground "white" :background "blue")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
   '(next-error ((t (:inherit (region)))))
   '(query-replace ((t (:inherit (isearch)))))

   '(org-checkbox ((t (:inherit bold :foreground "RoyalBlue1"))))
   '(org-done ((t (:foreground "forest green" :weight bold))))
   '(org-todo ((t (:foreground "OrangeRed1" :weight bold))))

   '(tool-bar ((t (:background "grey40" :foreground "black" :box (:line-width 1 :style released-button))))))

  ;; variables
  (custom-theme-set-variables
   'Casey
   ;'(fci-rule-color ,gray-2)
   ;'(fci-rule-character-color ,gray-2)
 
   '(ansi-color-names-vector ["#fdf6e3" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 ;;;[,background ,red ,green ,yellow ,blue ,purple ,blue ,foreground]
   `(ansi-term-color-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [unspecified ,background ,red ,green ,yellow ,blue ,purple ,blue ,foreground])
   '(fill-column 128)
   '(font-use-system-font t)
   '(org-agenda-files (quote (quote ("~/org/research.org" "~/org/personal.org"))))
   '(tool-bar-mode nil)
   '(fringe-mode 10)
   '(Linum-format "%7i ")
   '(show-paren-mode t)))

(provide-theme 'Casey)
