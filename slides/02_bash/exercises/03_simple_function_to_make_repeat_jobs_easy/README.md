## Use simple functions to make life easy

In this example we create a simple to `type` and `remember`
function called `uu` that can lookup via `grep` some matching
lines to find the machines that have that text.

Consider that we have test machines in various azure regions and
they have names like `rel-val-southcentralus` and those names
are in a file called  `rel_val_formationId.csv`

We can use this helper function:

```
function uu { grep "$1" rel_val_formationId.csv; }
```

Then use it like this:
```
uu eastus
uu southcentralus
```

This is a lot easier than repeating a grep command, and you can easily
remember a `uu` `"does yoU lookup for yoU"`.
