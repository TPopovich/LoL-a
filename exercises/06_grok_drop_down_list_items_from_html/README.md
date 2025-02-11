Goal is to parse out the drop down text, consider this snippet:
```
.....own option text eastasia">eastasia</span><...
```

Another example from file:
```
...>japaneast</span><...
```

We need to find the eastasia and emit that and all the other option elements from
some random html page.

The data filename is `data_from_web_html_to_scan.txt`.

Note that there is a at least an anchor text of </span> on the right of terms.

HINT: you can break problems up into smaller parts, AWK can be used to split multiple characters (picked that up from gawk) however it can be buggy.
Consider this small rewrite to get clean `semicolon` separated parts:

```
echo "uth>brazilsouth</span>  </button></li>...northeurope</span></...>" | sed -e 's/<[/-/]span>/;/g' | ....
```

That might convert the span end to a simple ';'.
Then you hunt for things near ';'


Hints, also see hints.txt file


```
$ awk 'length($0) > 0 && length($0) < 40 && $0 !~ />/ { pri
nt ; }' < hint_step1__answer.data_from_web_html_to_scan.txt.answer_to_generate.txt
brazilsouth
centralindia
eastasia
eastus2
francecentral
japaneast
jioindiawest
northeurope
southindia
uaenorth
uksouth
```
