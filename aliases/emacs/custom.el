;; (find-file "global-map_currently_in_use.el.txt-generated.el")
;; (eval-buffer)
;; (eval-current-buffer)
(require 'cl)
 
;;  ;; (setq debug-on-error  t)
;; (setq stack-trace-on-error t)
;; (dired "c:/xfer-vmware/java/ClojureBox/emacs/emacs/lisp/")
;; (load "ido")

;; do this to fix problem with using our own version of ido that breaks
;; emacs find file prompting  ==>  Do this load after this file is
;; executed when you do a eval-current-buffer
;; (load "c:/xfer-vmware/java/ClojureBox/emacs/emacs/lisp/ido")
;;
;;  Then you need to also do:
;;  (ido-mode t)

;;; --------------------------------
;;; --- ido setup as recommended by gregory grubbs
;;; --------------------------------

(progn
  (require 'ido)
  (ido-mode t)

  ;; good emacs tips on ido mode and yasnippet
  ;; 
  ;; orig @url: http://gregorygrubbs.com/
  ;; 
  ;; Another excellent post by the guy is to allow access to mysql on any wordpress system see @url: http://gregorygrubbs.com/wordpress/emacs-power-remote-servers-and-shell-commands/
  ;; 
  ;; 
  ;; ** for ido
  ;; 
  ;; do not confirm a new file or buffer

  ;; when I originally eval it ... we get an undefined error
  ;;(setq confirm-nonexistent-file-or-buffer   nil) ;; BUGBUG : tpop I dont think this variable is used

  (require 'ido)
;;  (let ((b_use_ido_default_settings  nil)) )
  (if nil
  (let ((b_use_ido_default_settings  t))
    (if  b_use_ido_default_settings

	(progn				; using factory ido settings

	  (setq ido-enable-flex-matching nil)
	  (setq ido-create-new-buffer 'prompt) ;; tpop: default is 'prompt
	  (setq ido-enable-tramp-completion  t)
	  (setq ido-enable-last-directory-history t)  
	  (setq ido-confirm-unique-completion nil) ;; wait for RET, even for unique?
	  (setq ido-show-dot-for-dired nil) ;; put . as the first item
	  (setq ido-use-filename-at-point nil) ;; prefer file names near point
	  )
   
      (progn   				; using guys ido settings
	(ido-mode 1)
	(ido-everywhere 1)

	(setq ido-enable-flex-matching t)
	(setq ido-create-new-buffer 'always) ;; tpop: default is 'prompt
	(setq ido-enable-tramp-completion nil)
	(setq ido-enable-last-directory-history nil)
	(setq ido-confirm-unique-completion nil) ;; wait for RET, even for unique?
	(setq ido-show-dot-for-dired t) ;; put . as the first item
	(setq ido-use-filename-at-point t) ;; prefer file names near point

	)))
       )
 )



;;; --------------------------------
;;; --- keyboard macros - misc
;;; --------------------------------


;; Command: tjp/macro/reload-ffap-find-file-at-start-of-line_till_\,_then_revert
;; Key: none
;; 
;; Macro:
;; 
;; C-a			;; move-beginning-of-line
;; C-SPC			;; set-mark-command
;; C-s			;; isearch-forward
;; ,			;; self-insert-command
;; <left>			;; backward-char
;; C-w			;; kill-region
;; C-y			;; yank
;; <<find-file>>		;; find-file
;; C-y			;; yank
;; RET			;; newline
;; 
(fset 'tjp/macro/reload-ffap-find-file-at-start-of-line_till_\\\,_then_revert
   [?\C-a ?\C-  ?\C-s ?, left ?\C-w ?\C-y ?\M-x ?f ?i ?n ?d ?- ?f ?i ?l ?e ?\C-m ?\C-y ?\C-m])

    


(defun tjp/query-replace_comma-to-comma-newline ()
  (interactive)
  (query-replace "," ",
"))


(put 'narrow-to-region 'disabled nil)

;; Some logic to find folder of home user if you use an env that does not match your home folder
;; also (and x y z)   does short circut logic like C boolean expression evaluation
(let ((d "C:/Users/tpopovich"))
  (and (setq d "C:/Users/tpopovich") (file-directory-p d) (setenv "HOME" d)(message d))
  (and (setq d "C:/Users/thpopovi") (file-directory-p d) (setenv "HOME" d)(message d))
  (and (setq d "C:/Users/tompo") (file-directory-p d) (setenv "HOME" d)(message d))
  )

(getenv "HOME")
;; we assume you use ~/.xemacs as the folder for setup files
(add-to-list 'load-path  (expand-file-name  "~/.xemacs"))


(progn
  (global-set-key (quote [C-f12]) (quote compare-windows))

  (defalias 'insert-string 'insert) ;; emacs26 alias
  ;; ff is used to quickly find files
  (defalias 'ff 'find-file)
  (defalias 'ff2 'find-file)
  ;; (ff "/work/real_linux_hm.real/sites/hm/index.php")

  ;; Make all "yes or no" prompts "y-or-n"
  (fset 'yes-or-no-p 'y-or-n-p)
)
    
    
