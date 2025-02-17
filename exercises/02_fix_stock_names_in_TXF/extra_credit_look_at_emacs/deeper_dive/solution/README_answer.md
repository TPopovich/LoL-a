Running the tool with awk on sample data we get, in FIRST pass to just extract tokens:

```
tpop$ awk -f extract_ticker_text.awk < sample_stock_records.txt
((ticker JPMORGAN EQUITY PREMIUM INCOME ETF))
((ticker CF INDUSTRIES HLDG))
```


So the first part is to get a list of line like this:
```
((ticker JPMORGAN EQUITY PREMIUM INCOME ETF))
((ticker CF INDUSTRIES HLDG))
```

Next we will generate a simple awk program to write out lisp code called
post processing.


The flow is as follows, given a stream of lines like we extracted... we do this

```
(1) the line=$0 holds the line,
(2) we write with printf("(tjp-replace-a-string \"%s\" \"???\")", line);
```

Complete solution will "chain" our 2 simple awk programs together:
```
tpop$ awk -f extract_ticker_text.awk < sample_stock_records.txt | awk -f postprocess.awk
```

Running the complete solution looks like:
```
$ awk -f extract_ticker_text.awk < sample_stock_records.txt | awk -f postprocess.awk

(tjp-replace-a-string "((ticker CF INDUSTRIES HLDG))" "???")
(tjp-replace-a-string "((ticker JPMORGAN EQUITY PREMIUM INCOME ETF))" "???")
```


We also show a makefile, where you can type `make`  or `make part` to run the
examples.
