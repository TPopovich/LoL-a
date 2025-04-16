## Vim  - how to save a region to another file


- mark the region by doing `V` in `vim` and marking the lines by moving the cursor to end of region
- then write by doing `:w filename`  (in the `:` minibuffer of vim)

FYI: to simulate this simple action from `vim` in emacs you need to write code in lisp:

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
