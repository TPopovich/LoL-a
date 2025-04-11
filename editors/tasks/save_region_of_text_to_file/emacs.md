## Emacs - how to save a region to another file

Simulate doing `V` in `vim` and marking the lines and doing `:w filename` in emacs:

```
(defun write-region-to-file (filename)
  "Write the selected region of buffer to a file, prompting for FILENAME in the minibuffer."
  (interactive "FWrite region to file: ")
  (if (use-region-p)
      (write-region (region-beginning) (region-end) filename)
    (message "No region selected.")))

;; This will bind the function the keyboard * key
(global-set-key [(kp-multiply)] #'write-region-to-file)
```
