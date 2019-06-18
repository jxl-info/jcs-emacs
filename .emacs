;;; .emacs --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.
;;
;; I barely know how to program LISP, and I know
;; even less about ELISP.  So take everything in
;; this file with a grain of salt!
;;
;; - JenChieh

;;; Code:


;; DEBUG: Debug mode?
;; Produce backtraces when errors occur.
(setq debug-on-error t)


(defconst jcs-init-gc-cons-threshold (* 1024 1024 128)
  "The `GC' threshold during starting up.")
(defconst jcs-normal-gc-cons-threshold (* 1024 1024 20)
  "The `GC' threshold during the normal task.")

;; NOTE: Raise the `GC' threshold when starting Emacs.
(setq gc-cons-threshold jcs-init-gc-cons-threshold)

(defconst jcs-emacs-version-number "5.4.9"
  "JCS-Emacs version.")

;;;###autoload
(defun jcs-emacs-version ()
  "Show JCS-Emacs version info."
  (interactive)
  (message "JCS-Emacs %s" jcs-emacs-version-number))


;;------------------------------------------------------------------------------------------------------
;; Auto generated by Emacs.
;;------------------------------------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(auto-save-interval 0)
 '(auto-save-list-file-prefix nil)
 '(auto-save-timeout 0)
 '(auto-show-mode t t)
 '(delete-auto-save-files nil)
 '(delete-old-versions (quote other))
 '(flymake-google-cpplint-command "C:/jcs_ide_packages/jcs_win7_packages/cpplint/cpplint.exe")
 '(httpd-port 8877)
 '(imenu-auto-rescan t)
 '(imenu-auto-rescan-maxout 500000)
 '(jdee-jdk-registry
   (quote
    (("1.8.0_111" . "C:/Program Files/Java/jdk1.8.0_111"))))
 '(kept-new-versions 5)
 '(kept-old-versions 5)
 '(make-backup-file-name-function (quote ignore))
 '(make-backup-files nil)
 '(mouse-wheel-follow-mouse nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (15)))
 '(package-selected-packages
   (quote
    (dumb-jump ssass-mode region-occurrences-highlighter flycheck yascroll esup swift-mode flycheck-popup-tip dart-mode basic-mode beacon google-this helm-core helm-projectile helm-ag helm right-click-context show-eol csharp-mode haxe-mode isearch-project async hl-todo page-break-lines goto-char-preview elixir-mode erlang multiple-cursors projectile buffer-move dashboard glsl-mode company-quickhelp origami line-reminder yasnippet-snippets dash git-commit move-text cmake-font-lock restart-emacs focus dimmer goto-line-preview transient magit with-editor ini-mode htmltagwrap auto-rename-tag indent-info cobol-mode rust-mode yaml-mode markdown-mode nhexl-mode sr-speedbar clojure-mode undo-tree tabbar javadoc-lookup typescript-mode yasnippet xcscope wgrep-helm wgrep-ag wgrep vimrc-mode sql-indent simple-httpd scss-mode s popup pkg-info json-snatcher json-reformat htmlize google-translate f epl emmet-mode diminish cmake-mode bind-key avy ace-window js2-mode company apache-mode which-key web-mode use-ttf use-package tree-mode togetherly sublimity shader-mode scala-mode rainbow-mode python-mode project-abbrev processing-mode preproc-font-lock powerline package-lint package-build organize-imports-java nasm-mode lua-mode json-mode impatient-mode iedit haskell-mode go-mode gitignore-mode gitconfig-mode gitattributes-mode exec-path-from-shell com-css-sort auto-highlight-symbol ag adaptive-wrap actionscript-mode)))
 '(paradox-github-token t)
 '(send-mail-function (quote mailclient-send-it))
 '(version-control nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "dark gray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-scrollbar-bg ((t (:background "dark gray"))))
 '(company-scrollbar-fg ((t (:background "black"))))
 '(company-tooltip ((t (:background "light gray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steel blue" :foreground "white")))))

(put 'erase-buffer 'disabled nil)


(defun jcs-reload-emacs-reloading-p ()
  "Check if Emacs reloading now."
  (if (boundp 'reload-emacs-reloading) reload-emacs-reloading nil))

;;========================================
;;         Manually Installation
;;----------------------------------

(unless (jcs-reload-emacs-reloading-p)
  (add-to-list 'load-path "~/.emacs.d/elisp/jayces-mode-20190205.001/")
  (add-to-list 'load-path "~/.emacs.d/elisp/jcs-ex-pkg-20190326.001/")
  (add-to-list 'load-path "~/.emacs.d/elisp/reload-emacs-20190326.001/")
  (add-to-list 'load-path "~/.emacs.d/elisp/shift-select-20190423.001/"))

;;========================================
;;      JENCHIEH FILE LOADING
;;----------------------------------

(unless (jcs-reload-emacs-reloading-p)
  (add-to-list 'load-path "~/.emacs.jcs/")
  (add-to-list 'load-path "~/.emacs.jcs/func/")
  (add-to-list 'load-path "~/.emacs.jcs/mode/"))

;;; Auto install list of packages I want at the startup of Emacs.
(require 'jcs-package)  ;; Get the list of package dependencies.

;; Install all packages that this config needs.
(jcs-ensure-package-installed jcs-package-install-list)

(defconst jcs-package-init-time (emacs-init-time)
  "Record down the package initialize time.")

;;; Utilities
(require 'jcs-log)
(require 'jcs-function)

;;; Environment
(require 'jcs-file)
(require 'jcs-dev)
(require 'jcs-env)
(require 'jcs-theme)
(require 'jcs-plugin)

;;; Customize
(require 'jcs-template)
(require 'jcs-mode)

;;; Finalize
(require 'jcs-hook)
(require 'jcs-key)
(require 'jcs-face)


;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; .emacs ends here
