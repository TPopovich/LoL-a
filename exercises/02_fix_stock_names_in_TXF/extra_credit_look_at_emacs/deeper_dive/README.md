Next as extra credit, see if you can `generate` the emacs lisp
program after doing a pass on the raw TXF data file.

Our goal is to generate lines that look like:
```
(tjp-replace-a-string "((ticker EXXON MOBIL CORP))" "???")
```

Leaving the `???` marker as one that needs to be filled in.

We have a job where an associative array can help!

HINT:

In awk and bash we can do this task by scanning for the lines that have:
```
((ticker
```

And in those line we want to find the regular expression that matches
` "((ticker EXXON MOBIL CORP))" `

REGEX hint
In regular expressions `(` and `)` have special meaning of a defining a group.
If you want to use them litterally, you need to escape them.

If you did this: on the proper lines you would extract the text
such as 
` "((ticker EXXON MOBIL CORP))" `
that we want to grab.

Then you can get the text out of `arr` by using `arr[0]`

Can you figure out how to add the matching text to an associative
arry and then in an `END` block write a `for i in` loop to print out
all the collected text.  We have a working solution in the subfolder
called solution if you need to peek for hints along the way, but try
to look up an example of AWK associative array first

```
# To get you started here is
# code that will grab any text starting with ((ticker ... )) and
# store in arr[0] the answer
match($0, /\(\(ticker [^)]*\)\)/, arr)
ticker = arr[0]
```



