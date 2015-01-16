;; init-auctex.el
;; Casey Webster

(require 'tex)
(TeX-global-PDF-mode t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t)

(setq Tex-output-view-style
      (quote
       (("^pdf$" "." "okular %o"))))

;(define-abbrev-table 'TeX-mode-abbrev-table (make-abbrev-table))
;(add-hook 'LaTeX-mode-hook (lambda ()
;			   (setq abbrev-mode t)
;			   (setq local-abbrev-table TeX-mode-abbrev-table)))

;                                         (active inactive)

(provide 'init-auctex)
