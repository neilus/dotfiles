(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/org-reveal")
;(setq org-plantuml-jar-path "~/.vim/bundle/eclim/doc/extension/plantuml.jar")
(setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/8002/plantuml.8002.jar")
(require 'ox-reveal)
(load-theme 'wombat)
(global-linum-mode)
(global-visual-line-mode)

(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))
;; -- Display images in org mode
;; enable image mode first
(iimage-mode)
;; add the org file link format to the iimage mode regex
(add-to-list 'iimage-mode-image-regex-alist
(cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex "\\)\\]") 1))
;; add a hook so we can display images on load
(add-hook 'org-mode-hook '(lambda () (org-turn-on-iimage-in-org)))
;; function to setup images for display on load
(defun org-turn-on-iimage-in-org ()
"display images in your org file"
(interactive)
(turn-on-iimage-mode)
(set-face-underline-p 'org-link nil))
;; function to toggle images in a org bugger
(defun org-toggle-iimage-in-org ()
"display images in your org file"

(define-key org-mode-map (kbd "C-M-i") 'turn-off-iimage-mode)


(interactive)
(if (face-underline-p 'org-link)
(set-face-underline-p 'org-link nil)
(set-face-underline-p 'org-link t))
(call-interactively 'iimage-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(delete-selection-mode nil)
 '(global-hl-line-mode t)
 '(global-whitespace-mode t)
 '(inhibit-startup-screen t)
 '(mark-even-if-inactive t)
 '(org-export-backends (quote (ascii beamer html icalendar latex man md org texinfo confluence deck freemind groff koma-letter rss s5 taskjuggler reveal)))
 '(scroll-bar-mode (quote right))
 '(spice-output-local "Gnucap")
 '(spice-simulator "Gnucap")
 '(spice-waveform-viewer "Gwave")
 '(tab-width 2)
 '(transient-mark-mode 1)
 '(truncate-lines 80)
 '(whitespace-display-mappings (quote ((space-mark 32 [183] [46]) (space-mark 160 [164] [95]) (tab-mark 9 [187 9] [92 9]) (newline-mark 10 [182 10]))))
 '(word-wrap t))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t))) ; this line activates ditaa
(setq ediff-split-window-function 'split-window-horizontally
      ediff-window-setup-function 'ediff-setup-windows-plain)
(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (awk . t)
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
         (latex . t))))
(setq org-confirm-babel-evaluate nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "gray21" :underline nil))))
 '(whitespace-empty ((t (:foreground "firebrick"))))
 '(whitespace-hspace ((t (:background "grey24" :foreground "white smoke"))))
 '(whitespace-indentation ((t (:foreground "firebrick"))))
 '(whitespace-space-after-tab ((t (:foreground "firebrick"))))
 '(whitespace-space-before-tab ((t (:foreground "dark orange"))))
 '(whitespace-trailing ((t (:foreground "yellow" :weight bold)))))

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
(server-start)
