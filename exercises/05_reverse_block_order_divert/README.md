You will see sample data file ``
has this line order:
```
AAA { fc -name jon1.txt ; col -b < jon1.txt }
AAA { fc -name jon2.txt ; col -b < jon2.txt }
CCC { fc -name nancy1.txt ; col -b < nancy1.txt }
CCC { fc -name nancy2.txt ; col -b < nancy2.txt }
ZZZ { fc -name bret1.txt ; col -b < bret1.txt }
ZZZ { fc -name bret2.txt ; col -b < bret2.txt }
```


This not desired.  We need to emit all the ZZZ  lines in order they are given
then the AAA then the CCC ones.

So the expected answer is this:
```
AAA { fc -name jon1.txt ; col -b < jon1.txt }
AAA { fc -name jon2.txt ; col -b < jon2.txt }
CCC { fc -name nancy1.txt ; col -b < nancy1.txt }
CCC { fc -name nancy2.txt ; col -b < nancy2.txt }
ZZZ { fc -name bret1.txt ; col -b < bret1.txt }
ZZZ { fc -name bret2.txt ; col -b < bret2.txt }
```

You can use `any` of the tools we study in this course to complete this
exercise.
HINT: sed might work with a set aside HOLD but that seems complicated,
and ed/ex can be used as well as awk.  awk is probably easy and even
pure ksh/bash with some temp files is also easy tools for this kind of
rearranging.   awk has a few ways to do it some using features we did
not study in this course (like arrays) however it is also doable with
state variable approach as well using what we did in class.
