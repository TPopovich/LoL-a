The solution runs and builds elisp,
can you modify the program with a different POST process so that it will emit
not lines like:
```
(tjp-replace-a-string "((ticker CF INDUSTRIES HLDG))" "???")
```

Instead it should emit lines like:
```
CF INDUSTRIES HLDG;???
```


Notice we stip the ((ticker  and ending )) and also have a semicolon as shown

You might save the new post process program in a file called `postprocess2.awk`
and maybe edit the makefile to allow that to run by doing `make alt`
