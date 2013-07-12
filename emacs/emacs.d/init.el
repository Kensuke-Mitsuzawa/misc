;;; load-pathを追加する関数を定義
 (defun add-to-load-path (&rest paths)
   (let (path)
     (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
         (add-to-list 'load-path default-directory)
          (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
              (normal-top-level-add-subdirs-to-load-path))))))
;;; ディレクトリをサブディレクトリごとload-pathに追加
 (add-to-load-path"el-get")
 (add-to-load-path"elisp")
		      

;; ;ロードパスの設定
 (setq load-path(append(list
                        (expand-file-name "~/.emacs")
                        (expand-file-name "/usr/share/emacs/site-lisp")
 		       (expand-file-name "~/.emacs.d/elisp")
                        )
                       load-path))

;; ;octave-modeの設定
(setq auto-mode-alist
(cons
'("\\.m$" . octave-mode)
auto-mode-alist))


;------------------------------------------------------
;この設定を記述すると，emacsが起動しなくなるエラーが出るので，下２行は使わない
;メニューの日本語化に関する設定
(setq menu-tree-coding-system 'utf-8)
;(require 'menu-tree)

;; 日本語表示の設定
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8-unix)
(setq file-name-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)


; 背景と文字色に関するセッティング
;(set-background-color "#98bc98") ;; background color
;(set-foreground-color "black")   ;; font color

; フォントサイズに関する設定150で15pt　なぜか、これ以上でかくすると、メニューは崩れる
;(set-face-attribute 'default nil
;            :family "Menlo" ;; font
;            :height 150)    ;; font size
;------------------------------------------------------
; auto-complete-latexについての設定
;(require 'auto-complete-latex)
;(setq ac-l-dict-directory "/path/to/ac-l-dict/")
;(add-to-list 'ac-modes 'foo-mode)
;(add-hook 'foo-mode-hook 'ac-l-setup)

;------------------------------------------------------
;highlight-indentationに関する記述
(require 'highlight-indentation)

;;------------------------------------------------------
;;aspellに関する記述
(setq ispell-program-name "aspell")

;;------------------------------------------------------
;;install-eplispに関する設定
(require 'install-elisp)
(setq install-elisp-repository-directory"~/.emacs.d/elisp/")

;;------------------------------------------------------
;;auto-completeに関する設定
(add-to-list 'load-path "~/.emacs.d/elisp/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp//ac-dict")
(ac-config-default)

;;emacs jedi
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:ac-setup)

;;------------------------------------------------------
;;el-getの設定
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(el-get 'sync)

;;------------------------------------------------------
;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

