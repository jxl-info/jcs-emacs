;;; .emacs --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.
;;
;; I barely know how to program LISP, and I know
;; even less about ELISP.  So take everything in
;; this file with a grain of salt!
;;
;; - Casey
;; - JenChieh (Modefied)

;;; Code:


;; DEBUG(jenchieh): Debug mode?
;; Produce backtraces when errors occur.
(setq debug-on-error t)

(defvar jcs-reloading-emacs nil
  "Reloading Emacs flag.")

(defvar jcs-init-gc-cons-threshold (* 1024 1024 128)
  "The `GC' threshold during starting up.")
(defvar jcs-normal-gc-cons-threshold (* 1024 1024 20)
  "The `GC' threshold during the normal task.")

;; NOTE(jenchieh): Raise the `GC' threshold when starting Emacs.
(setq gc-cons-threshold jcs-init-gc-cons-threshold)

;; NOTE(jenchieh): Add load path.
(unless jcs-reloading-emacs
  (add-to-list 'load-path "~/.emacs.jcs/")
  (add-to-list 'load-path "~/.emacs.jcs/func/")
  (add-to-list 'load-path "~/.emacs.jcs/mode/"))


;;------------------------------------------------------------------------------------------------------
;; Auto generated by Emacs.
;;------------------------------------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-idle-interval 0.3)
 '(auto-save-default nil)
 '(auto-save-interval 0)
 '(auto-save-list-file-prefix nil)
 '(auto-save-timeout 0)
 '(auto-show-mode t t)
 '(delete-auto-save-files nil)
 '(delete-old-versions (quote other))
 '(flymake-google-cpplint-command "C:/jcs_ide_packages/jcs_win7_packages/cpplint/cpplint.exe")
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
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
    (restart-emacs web-server indicators focus dimmer goto-line-preview transient magit with-editor right-click-context ini-mode htmltagwrap auto-rename-tag indent-info ac-emmet cobol-mode swift-mode rust-mode yaml-mode hydra markdown-mode markdown-preview-mode nhexl-mode sr-speedbar clojure-mode undo-tree tabbar javadoc-lookup typescript-mode haxe-mode yasnippet xcscope wgrep-helm wgrep-ag wgrep websocket vimrc-mode tablist sql-indent skewer-mode simple-httpd scss-mode s request-deferred request popup pkg-info php-mode php-auto-yasnippets pcache multiple-cursors memoize levenshtein json-snatcher json-reformat htmlize highlight-indentation highlight helm-core helm-ag google-translate google-this google-maps git-messenger fringe-helper flymake-easy flycheck find-file-in-project f epl emmet-mode diminish deferred cmake-mode bind-key avy auto-complete ace-window ac-php-core pyvenv magit-popup js2-mode ghub ivy helm company apache-mode xwidgete which-key web-mode visual-regexp use-ttf use-package tree-mode togetherly sublimity ssass-mode shader-mode scala-mode rainbow-mode python-mode project-abbrev processing-mode preproc-font-lock powerline pdf-tools package-lint package-build organize-imports-java nasm-mode lua-mode line-reminder json-mode js2-refactor impatient-mode iedit helm-gtags haskell-mode go-mode gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-link flymake-google-cpplint flymake-cursor floobits exec-path-from-shell csharp-mode cpputils-cmake com-css-sort cmake-project cmake-ide better-defaults basic-mode auto-package-update auto-highlight-symbol all-the-icons ag adaptive-wrap actionscript-mode ac-php ac-js2 ac-html)))
 '(send-mail-function (quote mailclient-send-it))
 '(version-control nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-definition-face ((t (:foreground nil :background "#113D6F"))))
 '(ahs-face ((t (:foreground nil :background "#113D6F"))))
 '(ahs-plugin-defalt-face ((t (:foreground nil :background "#123E70")))))

(put 'erase-buffer 'disabled nil)

;;------------------------------------------------------------------------------------------------------
;;;
;; Auto install list of packages i want at the startup of emacs.
;;;

;; Get the list of package dependencies.
(load-file "~/.emacs.jcs/jcs-package.el")

;; make sure to have downloaded archive description.
;; Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Install all packages that this config needs.
(jcs-ensure-package-installed jcs-package-install-list)

;; activate installed packages
(package-initialize)

;;========================================
;;         Manually Install
;;----------------------------------

(load-file "~/.emacs.d/elisp/verilog-mode.el")

;;
;; TEMPORARY(jenchieh): Hopefully melpa will let me push
;; my package `jcs-ex-pkg' to their package system.
;; Then we can remove load file/manually install package system.
;;
(load-file "~/.emacs.d/elisp/jcs-ex-pkg-20180705.001/jcs-ex-pkg.el")

;;
;; TEMPORARY(jenchieh): Hopefully melpa will let me push
;; my package `jayces-mode' to their package system.
;; Then we can remove load file/manually install package system.
;;
(load-file "~/.emacs.d/elisp/jayces-mode-20190205.001/jayces-mode.el")

;;========================================
;;      JENCHIEH FILE LOADING
;;----------------------------------

(if jcs-reloading-emacs
    (progn
      ;; Environment.
      (load-file "~/.emacs.jcs/jcs-face.el")
      (load-file "~/.emacs.jcs/jcs-dev.el")
      (load-file "~/.emacs.jcs/jcs-env.el")
      (load-file "~/.emacs.jcs/jcs-plugin.el")

      ;; Customization
      (load-file "~/.emacs.jcs/jcs-theme.el")

      ;; Initialize
      (load-file "~/.emacs.jcs/jcs-before-init.el")

      ;; Utilities
      (load-file "~/.emacs.jcs/jcs-log.el")
      (load-file "~/.emacs.jcs/jcs-function.el")
      (load-file "~/.emacs.jcs/jcs-corresponding-file.el")
      (load-file "~/.emacs.jcs/jcs-mode.el")
      (load-file "~/.emacs.jcs/jcs-file-info-format.el")
      (load-file "~/.emacs.jcs/jcs-helm.el")

      ;; Modes
      (load-file "~/.emacs.jcs/mode/jcs-elisp-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-cs-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-nasm-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-batch-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-sh-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-cc-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-c-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-c++-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-jayces-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-java-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-actionscript-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-python-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-web-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-js-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-json-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-lua-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-message-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-xml-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-shader-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-sass-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-scss-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-sql-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-go-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-vimscript-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-cbl-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-re-builder-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-txt-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-cmake-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-scala-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-perl-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-basic-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-processing-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-shell-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-haskell-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-haxe-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-typescript-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-clojure-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-lisp-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-verilog-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-markdown-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-ruby-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-rust-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-swift-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-objc-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-yaml-mode.el")
      (load-file "~/.emacs.jcs/mode/jcs-ini-mode.el")

      ;; Add hook to all Emacs' events.
      (load-file "~/.emacs.jcs/jcs-hook.el")

      ;; Set default font.
      (load-file "~/.emacs.jcs/jcs-font.el")

      ;; Do stuff after initialize.
      (load-file "~/.emacs.jcs/jcs-after-init.el"))
  (progn
    ;; Environment.
    (require 'jcs-face)
    (require 'jcs-dev)
    (require 'jcs-env)
    (require 'jcs-plugin)

    ;; Customization
    (require 'jcs-theme)

    ;; Initialize
    (require 'jcs-before-init)

    ;; Utilities
    (require 'jcs-log)
    (require 'jcs-function)
    (require 'jcs-corresponding-file)
    (require 'jcs-mode)
    (require 'jcs-file-info-format)
    (require 'jcs-helm)

    ;; Modes
    (require 'jcs-elisp-mode)
    (require 'jcs-cs-mode)
    (require 'jcs-nasm-mode)
    (require 'jcs-batch-mode)
    (require 'jcs-sh-mode)
    (require 'jcs-cc-mode)
    (require 'jcs-c-mode)
    (require 'jcs-c++-mode)
    (require 'jcs-jayces-mode)
    (require 'jcs-java-mode)
    (require 'jcs-actionscript-mode)
    (require 'jcs-python-mode)
    (require 'jcs-web-mode)
    (require 'jcs-js-mode)
    (require 'jcs-json-mode)
    (require 'jcs-lua-mode)
    (require 'jcs-message-mode)
    (require 'jcs-xml-mode)
    (require 'jcs-shader-mode)
    (require 'jcs-sass-mode)
    (require 'jcs-scss-mode)
    (require 'jcs-sql-mode)
    (require 'jcs-go-mode)
    (require 'jcs-vimscript-mode)
    (require 'jcs-cbl-mode)
    (require 'jcs-re-builder-mode)
    (require 'jcs-txt-mode)
    (require 'jcs-cmake-mode)
    (require 'jcs-scala-mode)
    (require 'jcs-perl-mode)
    (require 'jcs-basic-mode)
    (require 'jcs-processing-mode)
    (require 'jcs-shell-mode)
    (require 'jcs-haskell-mode)
    (require 'jcs-haxe-mode)
    (require 'jcs-typescript-mode)
    (require 'jcs-clojure-mode)
    (require 'jcs-lisp-mode)
    (require 'jcs-verilog-mode)
    (require 'jcs-markdown-mode)
    (require 'jcs-ruby-mode)
    (require 'jcs-rust-mode)
    (require 'jcs-swift-mode)
    (require 'jcs-objc-mode)
    (require 'jcs-yaml-mode)
    (require 'jcs-ini-mode)

    ;; Add hook to all Emacs' events.
    (require 'jcs-hook)

    ;; Set default font.
    (require 'jcs-font)

      ;;; Do stuff after initialize.
    (require 'jcs-after-init)))


;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; .emacs ends here
