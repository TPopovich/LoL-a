ample comes from a great book called Learning the Bash Shell, we are enhancing it and extending it as a programming project.

```
$ cat > albums.txt <<EOF
Depeche Mode|Speak and Spell|Mute Records|1981
Depeche Mode|Some Great Reward|Mute Records|1984
Depeche Mode|101|Mute Records|1989
Depeche Mode|Violator|Mute Records|1990
Depeche Mode|Songs of Faith and Devotion|Mute Records|1993
EOF
```


Documentation taken from book along with sample data above is: "
...
The file used in Task 4-1 is actually a report derived from a bigger table of data about albums. This table consists of several columns, or fields, to which a user refers by names like artist, title, year, etc. The columns are separated by vertical bars (|, the same as the UNIX pipe character). To deal with individual columns in the table, field names need to be converted to field numbers.

Suppose there is a shell function called getfield that takes the field name as argument and writes the corresponding field (or column) number on the standard output. Use this routine to help extract a column from the data table.


...
The cut utility is a natural for this task. cut is a data filter: it extracts columns from tabular data. If you supply the numbers of columns you want to extract from the input, cut will print only those columns on the standard output. Columns can be character positions or—relevant in this example—fields that are separated by TAB characters or other delimiters.

Here is how we would use cut to extract the fourth (year) column:

```
cut -f4 -d\| albums
```
The -d argument is used to specify the character used as field delimiter (TAB is the default). The vertical bar must be backslash-escaped so that the shell doesn’t try to interpret it as a pipe.

From this line of code and the getfield routine, we can easily derive the solution to the task. Assume that the first argument to getfield is the name of the field the user wants to extract. Then the solution is:

```
fieldname=$1
cut -f$(getfield $fieldname) -d\| albums
```

...
"

That description is a great intro and the seed for this challenge exercise.
⇒ your task is to build getfield as a function or script,we will assume using functions if a function here is a sketch of it:

```
function getfield {
  local fieldname=$1  ## local prevents clobber of upper scope var if any named fieldname
  # ... goal is to return 4 if you get input string of year  as argument 1
  # ... also extra credit can you change ${1}  to be something better with a ? modifier to catch if no first arg is passed in?
  # ??? what goes here
} 

function fetch_data {
  # ??? what goes here
}
```

And you can test/execute like they have done by making another function to be called `fetch_data` that is the content of their call to cut above.  TEST your work by calling:  `fetch_data` year -and- `fetch_data` (without the year for error checking).

We would like our work being Self-Describing, so if you give -h as a first argument or no argument if you catch that, issue a usage error maybe like USAGE: getfield [year|.....

Extra credit,  `fetch_data` is a bit hard to type create an alias for it called fda and test that it works.

