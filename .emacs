(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(require 'ox-reveal)
(org-export-backends (quote (ascii beamer html icalendar latex man md org texinfo confluence deck freemind groff koma-letter rss s5 taskjuggler reveal)))
;;; activate ecb
(require 'ecb)
(require 'ecb-autoloads)
(setq ecb-layout-name "left-dir-plus-speedbar")
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-compile-window-height 12)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
(global-visual-line-mode t)
(inhibit-startup-screen t)
;;; yasnippet
;;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
(yas-global-mode 1)
;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(spice-output-local "Gnucap")
(spice-simulator "Gnucap")
(spice-waveform-viewer "Gwave")
(tab-width 2)
(truncate-lines 80))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
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
(global-linum-mode)
(server-start)
