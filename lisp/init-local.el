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
;; (global-set-key "\C-h" `delete-backward-char)

;; (provide 'init-local)
