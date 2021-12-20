(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))
(require 'evil)
(evil-mode 1)
;; remove all keybindings from insert-state keymap,it is VERY VERY important
(setcdr evil-insert-state-map nil)

;;;把emacs模式下的按键绑定到Insert模式下
(define-key evil-insert-state-map
  (read-kbd-macro evil-toggle-key) 'evil-emacs-state)

;; but [escape] should switch back to normal state
(define-key evil-insert-state-map [escape] 'evil-normal-state)
;;将C-h改为退格
(global-set-key "\C-h" `delete-backward-char)

(load-theme 'tango-dark)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))


(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package doom-themes)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Org-mode
(defun efs/org-mode-setup ()
  (visual-line-mode 1))
(use-package org
  :hook (org-mode . efs/org-mode-setup))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column-mode
  :hook (org-mode . efs/org-mode-visual-fill))

;;Org-mode End

(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "s-SPC")

  (rune/leader-keys
    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")))

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(rune/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))





(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (lsp-java . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
;; (use-package lsp-mode
;;   :commands (lsp lsp-deferred)
;;   :hook (lsp-mode . efs/lsp-mode-setup)
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
;;   :config
;;   (lsp-enable-which-key-integration t))
;; ;; (rune/leader-keys
;; ;;  "l" '(lsp-keymap-prefix :which-key "lsp"))

;; (require 'lsp-java)
;; (add-hook 'java-mode-hook #'lsp)





;; (require 'use-package)

;; ;; (use-package lsp-mode
;; ;;              :commands (lsp lsp-deferred)
;; ;;              :init
;; ;;              (setq lsq-keymap-prefix "C-c e")
;; ;;              :config
;; ;;              (lsp-enable-which-key-integration t))

;; ;; (require 'lsp-java-boot)
;; ;; to enable the lenses
;; ;;(add-hook 'lsp-mode-hook #'lsp-lens-mode)
;; ;;(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)

;; ;;----------------------------------------------------------------------------
;; (setq display-line-numbers-type 'relative)
;; (global-display-line-numbers-mode 1)
;; ;; (require 'evil)
;; ;; (evil-mode 1)
;; (use-package evil
;;   :init
;;   (setq evil-want-integration t)
;;   (setq evil-want-keybinding nil)
;;   (setq evil-want-C-u-scroll t)
;;   (setq evil-want-C-i-jump nil)
;;   :config
;;   (evil-mode 1)
;;   (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
;;   (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

;;   ;; Use visual line motions even outside of visual-line-mode buffers
;;   (evil-global-set-key 'motion "j" 'evil-next-visual-line)
;;   (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

;;   (evil-set-initial-state 'messages-buffer-mode 'normal)
;;   (evil-set-initial-state 'dashboard-mode 'normal))

;; ;; remove all keybindings from insert-state keymap,it is VERY VERY important
;; (setcdr evil-insert-state-map nil)

;; ;;;把emacs模式下的按键绑定到Insert模式下
;; (define-key evil-insert-state-map
;;   (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
;; ;;将C-h改为退格
;; (Global-set-key "\C-h" `delete-backward-char)


(provide 'init-preload-local)
