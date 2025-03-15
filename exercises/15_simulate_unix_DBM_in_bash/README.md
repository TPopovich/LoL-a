The goal here is not fully replicate what other languages can do with a DBM file.
Awk can even load a shared lib (dll) on unix/linux and call c level functions.
But that is hard and would not match what Perl and Python can do with DBM
files as they blend it into language native features.

Here we are trying to "save/restore" values saying in a program.  E.g. I want
a program that remembers which jpeg file, we have several fake jpeg files
in the folder was last entered in a prompt. If the user enters Return and no
text we echo back user selected xxx.jpeg (same as last time) otherwise
we take their input and "save" it for the next time the program runs.

```
# flow expected

$ ask_jpeg.sh
Enter the jpeg file:  aaa.jpeg
::output::user entered: aaa.jpeg
$ ask_jpeg.sh
Enter the jpeg file (default aaa.jpeg):
::output::user entered: aaa.jpeg
$
```

Background on DBM

Unix invented a DBM (key/value) simple mans database stored in a disk file,
actually at ATT and then BSD enhanced/extended it to use larger pointers supporting
very large numbers of records. Linux uses the BSD implemetation (called nDBM - aka 
new DBM since disk devices grew larger from what was originally used in unix around 1970).

DBM is a c library.  One of the first tools to make it easily used was Perl.  Early perl
I believe near perl v3 had dbmopen (as it is bound to a "dbm" file) and is easier to
understand.

Later Perl v5 made the idea more abstract to `tie` a perl Hash/Dict/Associative Array
to a `disk DB` file.  Perl Tie can tie other things to a hash as it is an abstract
concept.

Accessing a database as a hash is powerful and easy way to give you a persistent Hash/Associative array,

Below `0666` gives the permsisions to create the file if it does not exist already.

Here is Perl, in both forms dbmopen and via tie:

```
use DB_File;        # optional; overrides default
dbmopen %HASH, $FILENAME, 0666      # open database, accessed through %HASH
    or die "Can't open $FILENAME:$!\n";

$V = $HASH{$KEY};               # retrieve value from database
$HASH{$KEY} = $VALUE;           # put value into database
if (exists $HASH{$KEY}) {       # check whether value is in database
    # ...
}

delete $HASH{$KEY};             # remove from database
dbmclose %HASH;                 # close the database
```

Using the newer way via perl v5 tie method

```
tie
use DB_File;        # load database module

tie %HASH, "DB_File", $FILENAME     # open database, to be accessed
    or die "Can't open $FILENAME:$!\n";    # through %HASH

$V = $HASH{$KEY};               # retrieve value from database
$HASH{$KEY} = $VALUE;           # put value into database
if (exists $HASH{$KEY}) {       # check whether value is in database
    # ...
}

delete $HASH{$KEY};             # delete from database
untie %HASH;                    # close the database
```

If you try that in perl you will see we have persistent Associative array
that we can use.

This example is to try to build something similar in linux using bash and awk.


Python also added `DBM` access copying `perl`.  Note that in Python which tries
to cache values, it sometimes can be tricky to `flush` records.  The net has
examples how to "flush" values that were changed in a reliable way.

Perl makes it easier to flush changed values in a reliable way so we presented
only perl to make it easier to follow along as it is more reliable (albeit 
Perl having a reputation to be harder to understand/read).

