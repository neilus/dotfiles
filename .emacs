(load-theme 'wombat)
;; fontify code in code blocks
(setq org-src-fontify-natively t)
(global-visual-line-mode)
(global-linum-mode)
(global-hl-line-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "gray21" :underline nil))))
 ;'(whitespace-empty ((t (:foreground "firebrick"))))
 ;'(whitespace-hspace ((t (:background "grey24" :foreground "white smoke"))))
 ;'(whitespace-indentation ((t (:foreground "firebrick"))))
 '(whitespace-space-after-tab ((t (:foreground "firebrick"))))
 '(whitespace-space-before-tab ((t (:foreground "dark orange"))))
 )
(setenv "PATH" (concat (getenv "PATH") ":~/bin"))
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/org-reveal")
(setq org-plantuml-jar-path "~/bin/plantuml.jar")
(setq org-ditaa-jar-path "~/bin/ditaa.jar")
(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
	 (emacs-lisp . t)
	 (awk . t)
   ;(sed . t)
	 (dot . t)
	 (ditaa . t)
	 (R . t)
	 (python . t)
	 (ruby . t)
	 (gnuplot . t)
	 (clojure . t)
	 (sh . t)
	 (ledger . t)
	 (org . t)
	 (plantuml . t)
	 (latex . t)
   ;(prolog . t)
   (perl . t)
   (octave . t)
   (matlab . t)
   (haskell . t)
   (gnuplot . t)
   ;(F90 . t)
   ;(ebnf . t)
   (css . t)
   (clojure . t)
   (sass . t)
	 (js . t)
	 (java . t)
   ;(processing . t)
   ;(groovy . t)
   (sql . t)
   ;(sqlite . t)
   ;(mongo . t)
   (makefile .t)
	 (C . t)
   ;(cpp . t)
   ;(http . t)
  )
 )
(require 'ox-reveal)
;(require 'org-latex)
;(unless (boundp 'org-export-latex-classes)
;  (setq org-export-latex-classes nil))
;(add-to-list 'org-export-latex-classes
;             '("article"
;               "\\documentclass{article}"
;               ("\\section{%s}" . "\\section*{%s}")))
(defun update-diff-colors ()
  "update the colors for diff faces"
  (set-face-attribute 'diff-added nil
                      :foreground "white" :background "blue")
  (set-face-attribute 'diff-removed nil
                      :foreground "white" :background "red3")
  (set-face-attribute 'diff-changed nil
                      :foreground "white" :background "purple"))
(eval-after-load "diff-mode"
  '(update-diff-colors))
;; -- Display images in org mode
;; enable image mode first
;(iimage-mode)
;; add the org file link format to the iimage mode regex
;(add-to-list 'iimage-mode-image-regex-alist
;(cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex "\\)\\]") 1))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
