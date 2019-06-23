;;; jcs-sass-mode.el --- Sass mode. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(require 'ssass-mode)


(defun jcs-sass-mode-hook ()
  "Sass mode hook."
  (abbrev-mode 1)
  (goto-address-mode 1)
  (auto-highlight-symbol-mode t)

  (when buffer-file-name
    (cond ((file-exists-p buffer-file-name) t)
          ((string-match "[.]sass" buffer-file-name)
           (jcs-insert-header-if-empty 'jcs-insert-sass-template))
          ))

  ;; Normal
  (define-key ssass-mode-map (kbd "C-d") #'jcs-kill-whole-line)
  (define-key ssass-mode-map (kbd "C-c C-c") #'kill-ring-save)

  ;; comment block
  (define-key ssass-mode-map (kbd "RET") #'jcs-smart-context-line-break)
  (define-key ssass-mode-map (kbd "*") #'jcs-c-comment-pair)

  ;; Edit
  (define-key ssass-mode-map (kbd "<up>") #'jcs-previous-line)
  (define-key ssass-mode-map (kbd "<down>") #'jcs-next-line)
  )
(add-hook 'ssass-mode-hook 'jcs-sass-mode-hook)


(provide 'jcs-sass-mode)
;;; jcs-sass-mode.el ends here
