(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/org-reveal")
(require 'ox-reveal)
(load-theme 'wombat)
(global-linum-mode)
(global-visual-line-mode )


(set-cursor-color "yellowgreen")
(set-mouse-color "green")


(server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(global-highlight-changes-mode t)
 '(global-hl-line-mode t)
 '(inhibit-startup-screen t)
 '(org-export-backends (quote (ascii beamer html icalendar latex man md org texinfo confluence deck freemind groff koma-letter rss s5 taskjuggler reveal)))
 '(spice-output-local "Gnucap")
 '(spice-simulator "Gnucap")
 '(spice-waveform-viewer "Gwave")
 '(tab-width 2)
 '(truncate-lines 80)
 '(word-wrap t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

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
