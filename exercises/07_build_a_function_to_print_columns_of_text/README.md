This example uses `cut` (a tool in unix/linux to get fields)
that is less general than `awk`.  However it is often quick to use.

This example is patterned (derived from an example in a great book on bash
programming) and extended from that example.

The goal is to flush out `2 functions` in the shell (which should live in
one script file) that can be given a "field name" and it should return
the column of data from a file.  A starter script with the `2 functions`
is provided.

The data file is `albums.txt` and can be created by doing this in the shell:

```
$ cat > albums.txt <<EOF
Depeche Mode|Speak and Spell|Mute Records|1981
Depeche Mode|Some Great Reward|Mute Records|1984
Depeche Mode|101|Mute Records|1989
Depeche Mode|Violator|Mute Records|1990
Depeche Mode|Songs of Faith and Devotion|Mute Records|1993
EOF
```

See the file called `task.md` for full descriptions of the project.

See `starter.sh`  for a starter script to flush out.
