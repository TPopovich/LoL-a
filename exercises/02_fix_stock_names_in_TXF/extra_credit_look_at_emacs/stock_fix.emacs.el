
;; This is just a sample that prints 
(defun tjp-show-two-args-and-optional (prompt two &optional three)
  (interactive)
  (message prompt)
  (message two)
  (message three)
  )
; run with (tjp-show-two-args-and-optional "arg1"  "arg2" "arg3")

;; this will move to BEGIN of buffer, then query replace (ask for substitute operations) from the top of file
(defun tjp-replace-a-string (string-to-find  substitute-string)
  (interactive)
  (message string-to-find)
  (message substitute-string)
  (beginning-of-buffer)
  (query-replace  string-to-find substitute-string)
  ;(replace-string  str replaced-string)
  )

;; this will do the TXF replace with a lot of extra company names
(defun fix-TXF-replace-string ()
  (interactive)
  (progn
    (tjp-replace-a-string "((ticker ADVANCE AUTO PARTS))" "AAP")
    (tjp-replace-a-string "((ticker ALPHABET INC.           CLASS                  A))" "GOOGL")
    (tjp-replace-a-string "((ticker EXXON MOBIL CORP))" "XOM")
    (tjp-replace-a-string "((ticker SPDR S&P 500 ETF))" "SPY")
    (tjp-replace-a-string "((ticker VANECK SEMICONDUCTOR    ETF))" "SMH")
    ))
