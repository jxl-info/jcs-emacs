;;; jcs-opascal-mode.el --- Object Pascal mode. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(require 'opascal)


(defun jcs-opascal-mode-hook ()
  "Object Pascal mode hook."
  (abbrev-mode 1)
  (electric-pair-mode 1)
  (goto-address-mode 1)
  (auto-highlight-symbol-mode t)

  ;; Treat underscore as word.
  (modify-syntax-entry ?_ "w")

  ;; File Header
  (jcs-insert-header-if-valid '("[.]dpk"
                                "[.]dpr")
                              'jcs-insert-opascal-template)

  ;; Normal
  (define-key opascal-mode-map (kbd "C-d") #'jcs-kill-whole-line)
  (define-key opascal-mode-map (kbd "C-c C-c") #'kill-ring-save)

  (define-key opascal-mode-map "\eq" #'jcs-other-window-prev)
  )
(add-hook 'opascal-mode-hook 'jcs-opascal-mode-hook)


(provide 'jcs-opascal-mode)
;;; jcs-opascal-mode.el ends here
