Just to show another way to solve, if you use emacs you can
easily sort of brute force it in a readable manner.

Here we build a "modify" function and a help function that will
move to the beginning of the file, and query replace the replacement
so you can see the changes.

You would open the file in emacs and run this from the menu
M-x fix-TXF-replace-string

Or in lisp code you do:
(fix-TXF-replace-string)
