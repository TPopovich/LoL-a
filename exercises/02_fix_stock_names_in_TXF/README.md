Goal here is to fix file `sample_TXF.txf` by replacing the
marker such as:
```
P447.00 sh ((ticker ADVANCE AUTO PARTS))
```
carefully.  NOTE some languages like sed and awk might have different
regex metachars that you need to deal with.

Replace ADVANCE AUTO with its stock symbol
and do the same for the rest.

If you need a hint in SED see a partial solution.
In the folder provided.


Also see another - sub exercise to teach about associative arrays in awk
see folder
```
extra_credit_look_at_emacs/deeper_dive/solution
```

There in `extra_credit_look_at_emacs` we look at building a tool that helps
a person write the emacs solution by crafting elisp lines based on the
extracted ((ticker ... )) text.
This `deeper_dive` also shows usage of a "makefile" that can nicely express
some parts of processing.  We have "2 stages" and the `make program` can
run all or just part one and is also a good way to document examples. 

