This exercise will deal with a hard problem of free form text, but the
text can wrap to another line.  Many times we might have data that is not
precise and still need to develop solutions to extract fields.


The goal is to pretend you are H.R.Block and need to grab the mortgage payments
for clients in automation.

See same file `1098.txt` that has `2 values of payments` we need to extract 
and where one entry was split on another line.

Write a program to grab all the `money values for interest paid` and write
it out the stdout.
It should find `2 such values` in the sample data.

If no values are found in the input the program should write nothing to stdout.

You should be able to pull these values out and display on stdout:

```
$3,149.00
$10,132.00
```

As extra credit, you can clean up the numbers if you want to remove any "," or "$" markers.
But that is not critical, the goal is to handle mis-alligned data.
