We will process data files, and we gave some example these:

```
1099_div_only.txt
1099_int_only.txt
```


Also the money area of the file could have embed-whitespace errors
that you must deal with, e.g. this example:
```
Ordinary Dividend:..........................................................    $225    .   00
```
shows a field that has extra whitespace in the number!



For any file we have a tax statement that is either a:

```
Form 1099-INT
Form 1099-DIV
```
And you can assume the first line will be a valid tax statement form identifier of
the two shown above.


If it is a 1099-INT we want to grab the interest values of each
entry.

```
Interest:......................................................................    $1.00
```
and output in JSON format like for each line:

```
{ "Interest": 1.00 }
```

If it is a 1099-DIV we want to grab the lines:

```
Ordinary Dividend:.................................................................................    ..$1.00
Qualified Dividends:.....................................................................................$0.00
```

and output in JSON format like:

```
{ "Ordinary": 1.00, "Qualified": 0.00 }
```



