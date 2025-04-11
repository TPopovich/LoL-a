## Emacs - how to bind a command to a keychord/keystroke

In emacs you use the bind lisp command like this example shows.

We use `#'` before the function name here to save memory space.  You need the `'` but the '#` is
optional.  The `#` tells lisp to not "cache" the function until it is actually used.
And this is recommended to save space.


For example, consider you have sample function you might to bind to a key like:
```
(defun write-region-to-file (filename)
  "Write the selected region of buffer to a file, prompting for FILENAME in the minibuffer."
  (interactive "FWrite region to file: ")
  (if (use-region-p)
      (write-region (region-beginning) (region-end) filename)
    (message "No region selected.")))

```

Here next is the keyboard keystroke binding step

```
;;----------------------------------------------------
;; This will bind the function the keyboard * key
;; keys can be bound globaly or locally.
;;----------------------------------------------------
(global-set-key [(kp-multiply)] #'write-region-to-file)
```
