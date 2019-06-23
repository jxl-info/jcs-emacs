;;; jcs-scala-mode.el --- Scala mode. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(require 'scala-mode)


(defun jcs-scala-mode-hook ()
  "Scala mode hook."
  (abbrev-mode 1)
  (electric-pair-mode 1)
  (goto-address-mode 1)
  (auto-highlight-symbol-mode t)

  (when buffer-file-name
    (cond ((file-exists-p buffer-file-name) t)
          ((string-match "[.]scala" buffer-file-name)
           (jcs-insert-header-if-empty 'jcs-insert-scala-template))
          ))

  ;; Normal

  ;; comment block
  (define-key scala-mode-map (kbd "RET") #'jcs-smart-context-line-break)
  (define-key scala-mode-map (kbd "*") #'jcs-c-comment-pair)
  )
(add-hook 'scala-mode-hook 'jcs-scala-mode-hook)


(provide 'jcs-scala-mode)
;;; jcs-scala-mode.el ends here
