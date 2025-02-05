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


