;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 01 Emacs package management
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/"))
      gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Ensure use-package is there
(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (setq use-package-always-ensure t)
   (require 'use-package)))

;; Put all Emacs customize variables & faces in its own file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 02 Name and email
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq user-full-name "Luis E. Fernandez de la Vara"
      user-mail-address "luis@lefv.io")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 10 Appearance
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Highlight current line.
(global-hl-line-mode t)
(menu-bar-mode 1)
(setq column-number-mode t)
(line-number-mode t)
(setq global-display-line-numbers t)

(when window-system
  (set-cursor-color "red")
  (tool-bar-mode 0)
  (set-face-attribute 'default nil
                      :family "Source Code Pro"
                      :height 110
                      :weight 'medium
                      :width 'normal))

(load-theme 'modus-vivendi)

(use-package doom-modeline
  :hook
  (after-init . doom-modeline-mode))

(use-package lisp
  :bind (("C-c <up>" . windmove-up)
	 ("C-c <down>" . windmove-down)
	 ("C-c <left>" . windowmove-left)
        ("C-c <right>" . windmove-right)))

(use-package lisp
  :bind (("C-c -" . split-window-below)
         ("C-c |" . split-window-right)))

;; https://irreal.org/blog/?p=6645
;; define super and hyper keys
;; Navigate between visible buffers (windows in emacs speak)
(defun other-window-backward (&optional n)x
  (interactive "p")
  (if n
      (other-window (- n))
    (other-frame -1)))
(global-set-key "\M->" 'other-window)
(global-set-key "\M-<" 'other-window-backward)

;; Revert
(global-set-key  [ C-u ] 'revert-buffer)
(global-auto-revert-mode 1)
(setq revert-without-query (list "\\.png$" "\\.svg$")
      auto-revert-verbose nil)

;; hippie expand
(global-set-key "\C- " 'hippie-expand)

;; join line
(global-set-key "\M-r" 'join-line)

;; Currently not used
;; Minimising & quitting Emacs way too many times without wanting to.
;; (global-unset-key "\C-z")
;; (global-unset-key "\C-x\C-c")

;; Treat 'y' or <CR> as yes, 'n' as no.
(fset 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 25 Reading & writing files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tell emacs to skip backup files
(setq make-backup-files nil)
;; Yes, I want large files
(setq large-file-warning-threshold 150000000)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 30 White space
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq tab-width 2)
(setq-default indent-tabs-mode nil)

;; This disables bidirectional text to prevent "trojan source"
;; exploits, see https://www.trojansource.codes/
(setf (default-value 'bidi-display-reordering) nil)


;; ws-butler cleans up whitespace only on the lines you've edited,
;; keeping messy colleagues happy ;-) Important that it doesn't clean
;; the whitespace on currrent line, otherwise, eclim leaves messy
;; code behind.
(use-package ws-butler
  :init
  (setq ws-butler-keep-whitespace-before-point nil)
  :config
  (ws-butler-global-mode))

(defun tkj-indent-and-fix-whitespace()
  (interactive)
  (delete-trailing-whitespace)
  (untabify (point-min) (point-max))
  (indent-region (point-min) (point-max)))
(global-set-key "\C-\M-\\" 'tkj-indent-and-fix-whitespace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prefer UTF 8, but don't override current encoding if specified
;; (unless you specify a write hook).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(prefer-coding-system 'utf-8-unix)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 50 Text buffers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Rename current buffer, as well as doing the related version control
;; commands to rename the file.
(defun rename-this-buffer-and-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message
           "File '%s' successfully renamed to '%s'"
           filename
           (file-name-nondirectory new-name))))))))
(global-set-key (kbd "C-x C-r") 'rename-this-buffer-and-file)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 40 Version control
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Editing VC log messages
(add-hook 'log-edit-hook (lambda () (flyspell-mode 1)))

(use-package magit
  :config
  (setq magit-log-arguments '("-n256" "--graph" "--decorate" "--color")
        ;; Show diffs per word, looks nicer!
        magit-diff-refine-hunk t))

(use-package git-gutter+
  :ensure t
  :config
  (setq git-gutter+-disabled-modes '(org-mode))
  ;; Move between local changes
  (global-set-key (kbd "M-<up>") 'git-gutter+-previous-hunk)
  (global-set-key (kbd "M-<down>") 'git-gutter+-next-hunk))

;; Tell emacs to skip backup files
(setq make-backup-files nil)
;; Yes, I want large files
(setq large-file-warning-threshold 150000000)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 60 Programming buffers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Highlight blocks of code in bold
(setq show-paren-style 'expression)
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

;; Don't ask before killing the current compilation. This is useful if
;; you're running servers after compiling them, so that the
;; compilation never finishes.
(setq compilation-ask-about-save nil
      compilation-always-kill t
      compile-command "~/bin/tc")
;; Convert shell escapes to color
(add-hook 'compilation-filter-hook
          (lambda () (ansi-color-apply-on-region (point-min) (point-max))))

;; Taken from
;; https://emacs.stackexchange.com/questions/31493/print-elapsed-time-in-compilation-buffer/56130#56130
(make-variable-buffer-local 'my-compilation-start-time)

(add-hook 'compilation-start-hook #'my-compilation-start-hook)
(defun my-compilation-start-hook (proc)
  (setq my-compilation-start-time (current-time)))

(add-hook 'compilation-finish-functions #'my-compilation-finish-function)
(defun my-compilation-finish-function (buf why)
  (let* ((elapsed  (time-subtract nil my-compilation-start-time))
         (msg (format "Compilation took: %s" (format-time-string "%T.%N" elapsed t))))
    (save-excursion (goto-char (point-max)) (insert msg))
    (message "Compilation %s: %s" (string-trim-right why) msg)))

(defun tkj/goto-compilation()
  (interactive)
  (switch-to-buffer
   (get-buffer-create "*compilation*")))
(global-set-key (kbd "C-c C-c") 'tkj/goto-compilation)

(unless (display-graphic-p)
  (xterm-mouse-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 65 Shells
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Excellent shell where just about everything works like in a regular
;; terminal.
;; (use-package vterm
;;   :config
;;   (global-set-key (kbd "C-c i") 'vterm))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 70 LSP and dependent packages
;; As listed on https://github.com/emacs-lsp/lsp-java#quick-start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package projectile)
(use-package counsel-projectile
  :after projectile
  :bind
  (("C-c p f" . counsel-projectile-find-file)))
(use-package flycheck)
(use-package yasnippet
  :config
  (setq yas/root-directory '("~/src/my-little-friends/emacs/.emacs.d/snippets")
        yas-indent-line 'fixed)
  (yas-global-mode)
  )

(use-package lsp-mode
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config
  (setq
   lsp-enable-file-watchers nil
   lsp-headerline-breadcrumb-enable nil
   )

  ;; Performance tweaks, see
  ;; https://github.com/emacs-lsp/lsp-mode#performance
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-idle-delay 0.500))

(use-package company
  :config
  (global-set-key (kbd "<C-return>") 'company-complete)
  (global-company-mode 1))

;; Get auto completion of :emoji: names.
(use-package company-emoji
  :after company-mode
  :config
  (add-to-list 'company-backends 'company-emoji))

(use-package lsp-ui)
(use-package which-key :config (which-key-mode))
(use-package lsp-treemacs)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 83 XML
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq nxml-slash-auto-complete-flag t)

(defun tkj/tidy-up-xml()
  "Pretty print XML that's all on one line."
  (interactive)
  (goto-char 0)
  (replace-string "><" ">
<")
  (indent-region (point-min) (point-max)))
(global-set-key (kbd "C-x t") 'tkj/tidy-up-xml)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 84 YAML
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package yaml-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 85 Org
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun tkj/org-file-of-the-day()
  (interactive)
  (let ((daily-name (format-time-string "%Y/%Y-%m-%d")))
    (find-file
     (expand-file-name
      (concat "~/org/agenda/" daily-name ".org")))))

(defun tkj/org-update-agenda-files()
  (interactive)
  (setq org-agenda-files
        (list
         (concat "~/org/agenda" (format-time-string "%Y") "/agenda.org")
         (concat "~/org/agenda" (format-time-string "%Y") "/home.org")
         (concat "~/org/agenda" (format-time-string "%Y") "/" (format-time-string "%Y-%m-%d") ".org")
         )))
(defun tkj/jira-key-at-point-to-link-on-kill-ring()
  "Creates a Jira link out of the issue key at point. The function
then inserts it into your kill ring so you can paste/yank it
where you need it."
  (interactive)
  (let ((issue (thing-at-point 'filename 'no-properties)))
    (kill-new (concat "https://jira.stibodx.com/browse/" issue))))

;; Open Jira issue references in the browser
(setq bug-reference-bug-regexp "\\b\\(\\([A-Za-z][A-Za-z0-9]\\{1,10\\}-[0-9]+\\)\\)"
      bug-reference-url-format "https://jira.stibodx.com/browse/%s")
(add-hook 'org-mode-hook 'bug-reference-mode)

(use-package org
  :init
  (setq org-clock-mode-line-total 'today
        org-fontify-quote-and-verse-blocks t
        org-indent-mode t
        org-return-follows-link t
        org-startup-folded 'content
        org-todo-keywords '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "PR(p)" "|" "MERGED(m)" "DONE(d)" "CANCELLED(c)" "DELEGATED(g)"))
        )

  :config
  (add-hook 'org-mode-hook 'org-indent-mode)

  :bind
  (("\C-coa" . org-agenda)
   ("\C-coc" . org-capture)
   ("\C-cod" . tkj/org-file-of-the-day))
   ("\C-cou" . tkj/org-update-agenda-files))

(use-package org-bullets
  :init
  (setq org-bullets-bullet-list '("❯" "❯❯" "❯❯❯" "❯❯❯❯" "❯❯❯❯❯"))

  :config
  (add-hook 'org-mode-hook 'org-bullets-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 82 BASH
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package lsp-mode
  :commands lsp
  :hook
  (sh-mode . lsp)

  :bind
  (:map lsp-mode-map
        (("\C-\M-g" . lsp-find-implementation)
         ("M-RET" . lsp-execute-code-action)))
  )

(setq sh-basic-offset 2
      sh-indentation 2)


;; add mac-specific configs here

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)


;; snippets, please
(add-hook 'sh-mode-hook 'yas-minor-mode)

;; on the fly syntax checking
(add-hook 'sh-mode-hook 'flycheck-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs autogenerated
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
