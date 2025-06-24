## Task format build job

Take the file `sample-guid.formations.txt` and use it to grab
all lines that are not the "header" and look for entry
that have the middle sub token of `abcd` as shown.  And
only if it is in surrounded by `-` characters as shown.

E.g. consider this guid:

```
9190feba-abcd-4888-8cfb-d7c81dd04cc0
```

That record has a "-abcd-" marker so it is one of the 
guid that we need to process.


Process such lines by emiting this as a job to STDOUT

```
build --config=9190feba-abcd-4888-8cfb-d7c81dd04cc0
```
