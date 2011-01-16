;;M-g go to line
(global-set-key [(meta g)] 'goto-line)
;;numeric bake up
(setq make-backup-files t)
(setq version-control t)
;;备份最后三次改动
(setq kept-new-versions 3)
;;让覆盖备份不被提示
;;(setq delete-old-versions t)
;; 备份统一到一个文件
;; (require 'backup-dir)
;; (setq bkup-backup-directory-info
;;       '((t "/data/tmp/backups" ok-create full-path)))
;;To use sams-lib.el  library
;;(load "sams-lib")            
(autoload 'all "all" nil t)
(setq bookmark-save-flag 1)
;;showing mathing parenthneses in emacs
(setq show-paren-mode t)
(setq show-paren-style 'expression)
;;发生错误响铃
;;(setq visible-bell t)
;;字体模式
;;(add-hook 'html-helper-mode-hook 'turn-on-font-lock)
;;(add-hook 'c-mode-hook 'turn-on-font-lock)
;;(add-hook 'c++-mode-hook 'turn-on-font-lock)
;;(add-hook 'emacs-lisp-mode-hook 'turn-on-font-lock)
(put 'narrow-to-region 'disabled nil)
;;outline minor mode is bound to C-o
;;open-line function is bound to M-o
(global-set-key [(meta o)] 'open-line)
(setq outline-minor-mode-prefix [(control o)])
;;automate  start emacs server
;;(start-server)
;;load redo lib
;;(require 'redo)
;;(global-set-key [(f5)] 'undo)
;;To cause the *compilation* buffer to automatically scroll to the end of new output
(setq compilation-scroll-output t)
(put 'set-goal-column 'disabled nil)
;;watch points on the expression on which the cursor sits
;; (add-hook 'gdb-mode-hook
;;                  (lambda ()
;;                   (gud-def my-watch "watch %e"
;;                            "\C-w" "Watch my variables.")
;;                    )
;;)


;;set c-default-style to k&r
(setq c-default-style "k&r")
(setq c++-default-style "k&r")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("left8" (0.21138211382113822 . 0.22916666666666666) (0.21138211382113822 . 0.25) (0.21138211382113822 . 0.2708333333333333) (0.21138211382113822 . 0.16666666666666666)))))
 '(ecb-options-version "2.32")
 '(gdb-max-frames 100)
 '(gud-jdb-classpath "$WORKING/ToDoList/src:$WORKING/ToDoList/bin/classes")
 '(gud-jdb-sourcepath "$WORKING/ToDoList/src")
 '(gud-jdb-use-classpath t)
 '(gud-pdb-command-name "/usr/bin/pdb")
 '(inhibit-startup-screen t)
 '(jde-jdk-registry (quote (("java-6-sun" . "/usr/lib/jvm/java-6-sum"))))
 '(show-paren-mode t)
 '(speedbar-mode-specific-contents-flag t)
 '(speedbar-use-images t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
)

;;(require 'erc)

;; 浏览器支持
(require 'w3m-load)

;;F5 for speederbar
(global-set-key [(f6)] 'speedbar)

;;cedet配置
(require 'cedet)

(semantic-add-system-include "/usr/include/qt4" 'c++-mode)
(add-to-list 'auto-mode-alist (cons "/usr/include/qt4" 'c++-mode))
;;(add-to-list 'semantic-lex-c-preprocessor-symbol-file  "/usr/include/qt4/Qt/qconfig.h")
;;(add-to-list 'semantic-lex-c-preprocessor-symbol-file "/usr/include/qt4/Qt/qconfig-dist.h")
;;(add-to-list 'semantic-lex-c-preprocessor-symbol-file  "/usr/include/qt4/Qt/qglobal.h")

(semantic-add-system-include "/usr/include/c++/4.3" 'c++-mode)
;;(semantic-add-system-include "/usr/include/c++/4.3/i486-linux-gnu" 'c++-mode)
(semantic-add-system-include "/usr/include/c++/4.3/backward" 'c++-mode)
(semantic-add-system-include "/usr/local/include" 'c++-mode)
(semantic-add-system-include "/usr/lib/gcc/i486-linux-gnu/4.3.2/include" 'c++-mode)
(semantic-add-system-include "/usr/lib/gcc/i486-linux-gnu/4.3.2/include-fixed"  'c++-mode)
(semantic-add-system-include "/usr/lib/jvm/java-1.5.0-sun-1.5.0.17/include/" 'c++-mode)
(semantic-add-system-include "/usr/lib/jvm/java-1.5.0-sun-1.5.0.17/include/linux" 'c++-mode)

(setq-mode-local c-mode semanticdb-find-default-throttle
         '(project unloaded system recursive))

(eval-after-load "semantic-complete"
'(setq semantic-complete-inline-analyzer-displayor-class
semantic-displayor-ghost))

(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
(add-hook 'c-mode-common-hook 'my-cedet-hook)

;;(defun my-c-mode-cedet-hook ()
;; (local-set-key "." 'semantic-complete-self-insert)
;; (local-set-key ">" 'semantic-complete-self-insert))
;;(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;; additional features for name completion and ...
(require 'semantic-ia)
;; find system include files
;;(require 'semantic-gcc)

;; 创建一个存放路径
(setq semanticdb-default-save-directory
(expand-file-name "~/.emacs.d/semanticdb"))

(require 'semanticdb)
(global-semanticdb-minor-mode 1)
(setq semanticdb-project-roots (list "/"))


;; 功能属性，从上到下功能越来越少，性能越来越快
;;(semantic-load-enable-semantic-debugging-helpers)
;;(semantic-load-enable-excessive-code-helpers)
;;(semantic-load-enable-gaudy-code-helpers)
(semantic-load-enable-code-helpers)
;;(semantic-load-enable-minimum-features)

(require 'ecb)

(require 'xcscope)

;; (require 'emms-setup)
;; (emms-standard)
;; (emms-default-players)

(put 'scroll-left 'disabled nil)

;; (require 'muse-mode)     ; load authoring mode
;; (require 'muse-html)     ; load publishing styles I use
;; (require 'muse-latex)
;; (require 'muse-texinfo)
;; (require 'muse-docbook)

;; android-mode
;;(add-to-list 'load-path "/opt/android-mode")
;;(defcustom android-mode-sdk-dir "/opt/android")
;;(require 'android-mode)

(global-set-key "\C-ci" 'android-ant-install)
(global-set-key "\C-cr" 'android-ant-reinstall)
(global-set-key "\C-cu" 'android-ant-uninstall)
(global-set-key "\C-cs" 'android-start-emulator)
(global-set-key "\C-cc" 'android-ant-compile)


;;(set-background-color "powder blue")
;;(set-background-color "PaleTurquoise3")


(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode) 
(put 'downcase-region 'disabled nil)

(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
(autoload 'javascript-mode "javascript" nil t)

;;(custom-set-variables
;;'(gud-jdb-use-classpath t)
;;'(gud-jdb-classpath "$WORKING/src:$WORKING/bin/classes")
;;'(gud-jdb-sourcepath "$WORKING/src")
;;'(gud-pdb-command-name "~/bin/pdb.py"))

(require 'color-theme)
 (eval-after-load "color-theme"
   '(progn
      (color-theme-initialize)
      (color-theme-jianjun-2)))
;      (color-theme-scintilla)))
;      (color-theme-katester)))
;      (color-theme-deep-blue)))
;      (color-theme-high-contrast)))
;      (color-theme-dark-blue2 )))

;; 随机选择一个预先设置好的页面颜色
;(setq pagecolor '("#f9fdfc" "#d5d5d7" "#e9e9e9" "#f1f1f1"))
;(random t) 
;(setq num (random (length pagecolor)))
;(set-background-color (nth num pagecolor) )
;(set-background-color "#d5d5d7" )
;;(set-background-color "gray80" )
;(blink-cursor-mode)