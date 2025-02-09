;; You can execute code in comments by putting your cursor
;; at the end of the line and running:
;; M-x eval-last-sexp

;; ...  M-x eval-last-sexp the next line  to eval this buffer, i.e. execute it in emacs
;; (eval-buffer)
;; (eval-current-buffer)
;; If you put most of your custom setup code in custom.el you can just edit it by M-x eval-last-sexp the next line
;; (find-file "custom.el")

(if nil
  (global-set-key [(f10)] (ilam
			       (query-replace-regexp "^[[:space:]][[:space:]][[:space:]]*" "")))

  ;; saves typing M-^ that is hard to do
  (global-set-key [(f9)] 'delete-indentation)
  
  )


;;(query-replace-regexp "   *" "")

;; do whitespace-mode to turn on 
(setq whitespace-line-column 118)
(setq whitespace-line-column 88)
;;; 
;;  Code to help convert the raw dump of the key bindings to valid lisp code
;;;
;;  ;; find entry below that has (kbd S-xxx) and convert to [(shift xxx)]
;;  (fset 'tjp-macro-fix-SHIFT-entry-below
;;     [?\C-s ?( ?k ?b ?d ?  ?S ?- ?\C-m backspace backspace backspace backspace backspace backspace left ?[ right ?s ?h ?i ?f ?t ?  ?\C-s ?) left right ?] ?\C-a down])
;;  
;;  ;; find entry below that has [(meta xxx)] and convert to [(meta xxx)]
;;  (fset 'tjp-macro-fix-SHIFT-entry-below
;;     [?\C-s ?( ?k ?b ?d ?  ?M ?- ?\C-m backspace backspace backspace backspace backspace backspace left ?[ right ?m ?e ?t ?a ?  ?\C-s ?) left right ?] ?\C-a down])
;;  
;;  (global-set-key [(f8)]  #'tjp-macro-fix-SHIFT-entry-below)
;;  
;;  
(defun warren/*/msft ()
  (interactive)
  (message "hi there"))


(global-set-key [(control left)] #'backward-word)
(global-set-key [(control right)] #'forward-word)

(progn				    ; for Gnu Emacs to act like XEmacs


  (global-set-key (quote [M-up]) (quote backward-paragraph))
  (global-set-key (quote [M-down]) (quote forward-paragraph))

  (global-set-key (quote [M-left]) (quote backward-sexp))
  (global-set-key (quote [M-right]) (quote forward-sexp))


  (global-set-key  '[ tab ] 'hippie-expand)
  (global-set-key  '[ (shift tab) ] 'hippie-expand) ;does not seem to work

  )



(defmacro ilam (&rest body) 
  "lisp macro to convert body into (interactive) lambda"
  `(lambda () (interactive) ,@body))

;; example
;;
;; define a new key to suck off part of a filename on the screen from a TAGS file
;; that will look like:
;;    addimages.php,0
;; and form a filename e.g. put cursor in addimages above and it (current-word) => "addimages"
;; as it skips the .php part
;;  then append .php to get addimages.php  and do a find-file on it
;;;;;;;;;;;;
;; We are using it to suck in any changed files on disk that is in the TAGS file that we want to cherry pick
;;;;;;;;;;;;;
(global-set-key [(kp-4)] (ilam
               (find-file (concat (current-word) ".php"))))

(defmacro ilam-switch-to-buffer (buffer-name)
  `(lambda () (interactive) 
     (switch-to-buffer ,buffer-name)))

(global-set-key [(kp-4)] #'tjp-tags-toggle-TAGS-file-name)
(global-set-key [(kp-7)] (ilam-switch-to-buffer "*ruby*"))

(global-set-key [(meta f13)] (ilam (insert-string "if (g.Debug.GDEBUG)  ")))

;(global-set-key [(alt u)] #'tjp-invoke-m4-groovy-it-on-region) ;; unknown key A-u
;(global-set-key [(alt j)] #'tjp-invoke-jatha-preprocessor-on-region) ;; A-j
;(global-set-key [(alt mouse-3)] #'execute-keyboard-macro-here)  ; do by hand manual as kbd can not map
(global-set-key [(kp-6)] #'gid)
(global-set-key [(f5)] #'goto-line)
;(global-set-key [(control kp-plus)] #'(lambda nil (interactive) (clipboard-kill-ring-save) (cua-set-mark)))
(global-set-key [(control kp-plus)] #'(lambda nil (interactive) (clipboard-kill-ring-save) (cua-set-mark)))
(global-set-key [(kp-8)] #'(lambda nil (interactive) (switch-to-buffer "diffing-tools.el")))
(global-set-key [(kp-5)] #'(lambda nil (interactive) (select-frame-by-name "Ediff")))
(global-set-key [(control kp-decimal)] #'eval-print-last-sexp)
(global-set-key [(control kp-insert)] #'(lambda nil (interactive) (message (int-to-string (length (current-word))))))



(global-set-key [(f12)] #'ido-switch-buffer) ; old #'switch-to-buffer
(global-set-key [(f11)] #'other-window)

;; claroread takes over F7 thru F12
(progn
(global-set-key [(shift f12)] #'ido-switch-buffer) ; old #'switch-to-buffer
(global-set-key [(shift f11)] #'other-window)

(global-set-key [(kp-subtract)] #'ido-switch-buffer)
)

(progn
(global-set-key [(f8)] #'call-last-kbd-macro)
(global-set-key [(f7)] #'end-kbd-macro)
(global-set-key [(f6)] #'start-kbd-macro)
)

(global-set-key [(control kp-delete)] #'eval-print-last-sexp) ; or maybe we should use eval-expression ?
(global-set-key [(control kp-enter)] #'eval-last-sexp)
;(global-set-key [(67108910)] #'(lambda nil (interactive) (dot-mode 1) (message Dot mode activated.))) ;; unknown key

(global-set-key [(meta kp-divide)] #'electric-command-history)
(global-set-key [(tab)] #'hippie-expand)
(global-set-key [(shift tab)] #'hippie-expand)
;; (global-set-key [(shift kp-tab)] #'hippie-expand)
(global-set-key [(shift kp-enter)] #'electric-command-history) ; was #'revert-buffer
(global-set-key [(shift kp-enter)] #'revert-buffer)
(global-set-key [(shift kp-add)] #'(lambda nil (interactive) (kill-buffer *Help*)))
(global-set-key [(kp-enter)] #'clipboard-yank)
(global-set-key [(kp-add)] #'clipboard-kill-ring-save)
(global-set-key [(shift mouse-3)] #'kmacro-end-call-mouse)
(global-set-key [(control tab)] #'minibuffer-complete)
(global-set-key [(meta f10)] #'tmm-menubar)
(global-set-key [(meta f5)] #'tjp-m-sort-buffer)
(global-set-key [(control kp-5)] #'tjp-macro-take-current-word--make-into--wrapped-pp-call)
(global-set-key [(control kp-0)] #'tags-search)
(global-set-key [(kp-0)] #'tags-loop-continue)

(global-set-key [(kp-decimal)] #'point-to-register)        ; same as (describe-key (kbd "C-x r SPC"))
(global-set-key [(meta kp-decimal)] #'jump-to-register)    ; same as (describe-key (kbd "C-x r j"))

(global-set-key [(control kp-divide)] (ilam-switch-to-buffer "custom.el"))
(global-set-key [(control kp-multiply)] (ilam-switch-to-buffer "*shell*"))

(global-set-key [(kp-5)]
  (lambda ()
    (interactive)
    (select-frame-by-name "Ediff")))

;; Set keypad 8  to get focus in the Ediff control panel
;; We found the frame name by using the above find-all-frame-names logic
(global-set-key [(kp-8)]      (ilam-switch-to-buffer "diffing-tools.el"))

(global-set-key [(control kp-2)]      (ilam-switch-to-buffer "sql.shell"))
(global-set-key [(        kp-2)]      (ilam
				       ;; insert the following text and move the cursor to the location of the hat (^) below
				       ;; select * from "^" limit 4;
				       (insert "select * from \"\" limit 4;")
				       (backward-char 10)
				       ))

(global-set-key [(kp-3)]      (ilam-switch-to-buffer "work.txt"))

(global-set-key [(control kp-add)] #'hs-show-block)
(global-set-key [(control kp-subtract)] #'hs-hide-block)
(global-set-key [(control clear)] #'electric-command-history)
(global-set-key [(control kp-4)] #'string-rectangle)

(global-set-key [(control kp-7)] #'electric-command-history) ;; C-kp-7 is not working on keyboard, you press it and get C-g instead
(global-set-key [(control pause)] #'electric-command-history)

(global-set-key [(toggle-frame-toolbar)] #'handle-toggle-tool-bar)
(global-set-key [(meta S-left)] #'backward-word-mark)
(global-set-key [(meta S-right)] #'forward-word-mark)
;(global-set-key [(alt down-mouse-1)] #'mouse-drag-secondary)  ; do by hand manual as kbd can not ma
;(global-set-key [(alt drag-mouse-1)] #'mouse-set-secondary)  ; do by hand manual as kbd can not ma
;(global-set-key [(alt mouse-1)] #'mouse-start-secondary)  ; do by hand manual as kbd can not ma
;(global-set-key [(alt S-down-mouse-1)] #'mouse-extend-secondary)  ; do by hand manual as kbd can not ma
(global-set-key [(mac-application-quit)] #'save-buffers-kill-emacs)
(global-set-key [(shift prior)] #'pager-page-up-extend-region)
(global-set-key [(shift next)] #'pager-page-down-extend-region)


;(global-set-key [(alt C-left)] #'shrink-frame-horizontally)
;(global-set-key [(alt C-up)] #'shrink-frame)
;(global-set-key [(alt C-right)] #'enlarge-frame-horizontally)
;(global-set-key [(alt C-down)] #'enlarge-frame)


(global-set-key [(control M-S-left)] #'backward-sexp-mark)
(global-set-key [(control M-S-right)] #'forward-sexp-mark)

(global-set-key [(alt delete)] #'kill-visual-line)
(global-set-key [(alt backspace)] #'kill-whole-visual-line)
(global-set-key [(alt S-backspace)] #'kill-whole-line)

(global-set-key [(alt S-backspace)] #'kill-whole-line)

(global-set-key [(meta up)] #'backward-paragraph)
(global-set-key [(meta down)] #'forward-paragraph)
(global-set-key [(alt up)] #'beginning-of-buffer)
(global-set-key [(alt down)] #'end-of-buffer)
(global-set-key [(alt left)] #'beginning-of-line)
(global-set-key [(alt right)] #'end-of-line)
;(global-set-key [(4194343)] #'comment-or-uncomment-region-or-line) ;; unknown key


;; == workaround, we define a keyboard macro to press the PASTE icon, and bind that
;;    to kp-enter!


; keyboard macro - to just press the icon Paste aka in the tool-bar [tool-bar paste]
(fset 'tjp-macro-press-PASTE-menu-icon
   [(tool-bar) paste])

(fset 'tjp-macro-press-COPY-menu-icon
   [(tool-bar) copy])

;(define-key global-map  [(kp-enter)] 'cua-paste) ; this no longer works ??? why? workaround below


; 

(define-key global-map  [(kp-enter)] (ilam (execute-kbd-macro 'tjp-macro-press-PASTE-menu-icon)))
; <kp-add> runs the command clipboard-kill-ring-save
; (global-set-key [(kp-add)] #'clipboard-kill-ring-save)

(global-set-key [(kp-add)] (ilam (execute-kbd-macro 'tjp-macro-press-COPY-menu-icon)))

;; for pc laptop work
(global-set-key [(meta f11)] (ilam (execute-kbd-macro 'tjp-macro-press-COPY-menu-icon)))
(global-set-key [(meta f12)] (ilam (execute-kbd-macro 'tjp-macro-press-PASTE-menu-icon)))



;(define-key global-map  [(f4)] (ilam (execute-kbd-macro 'tjp-macro-press-PASTE-menu-icon)))

