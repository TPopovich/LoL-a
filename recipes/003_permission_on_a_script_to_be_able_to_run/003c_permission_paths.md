## Recipe create a executable script command [PART C] PATHs

In this exercise we are working with an executable "command" script file.

For Unix/Linux the commands you can run are found in the $PATH variable.


##  Recap of part B
We had to make our script executable via the `chmod` command. And to find it via `which`
we needed to add `.` to the `$PATH` variable....

If you have not done it see [part b of this recipe](./003b_permission_on_a_script_to_execute.md)

## Investigating further

Before we added "." to the path, `which` could not find our program. Here is a replay of
what we saw in part A and part B:

```
Type: which cmdTest01.sh
Type:

# notice it did not find our script, but look it finds bash:

Type: which bash
/usr/bin/bash

# let us add current directory to the path variable

Type: export PATH=".:$PATH"

Type: which cmdTest01.sh
./cmdTest01.sh

# now it finds it.

```

Note if you already ran the following in your shell, to redo the above you will need
to create a `brand new shell` or if you are savy you can do this but be careful

```
 echo $PATH > path
 use vi or nano and add to the front of the line
 
 export PATH=
 
 and delete any "." at the front so it might look like:
 
 export PATH=/usr/local/bin:/bin:/usr/bin .....
 
            ^--- The key thing is not to have a "." just after the = sign above

 then dot source it after exiting the editor like this
 
 
 .  ./path

 echo $PATH
 # ^ --- make sure output has no "." at the begining
```

When we do a command like:

```
export PATH=".:$PATH"
```

We tell the Linux system to also look in the "." or current folder for commands.

Lets look further on how Linux hunts for files in the next section.

## Hunting for Commands


So why did we have to mess with the `PATH` variable in order for `which` to find our script-
and to run it easily without a `./`?

let's look at our PATH variable in our environment (very often we manually set by editing file `~/.bashrc` and globally by editing `/etc/
bash.bashrc`):

```
Type: env | grep -i path=
...
PATH=/usr/local/bin:/usr/bin:/bin:/usr/bin/...
...

Another way to see it is to do echo $PATH

Notice it is UPPER CASE (unix is case sensitive) and is the reason we use -i with grep
to search for any case of path=
```

We add "." to our path (remember: the "dot" is a file representing
the current directory) so command search looks in the current folder first then
moves on to the next directory listed in the PATH.

Linux searches the directories that are in the `PATH` variable (they are separated by a `:`) in order
looking for an `file with the name and having the execute - the x - bit set on it`.  Then the first one found is executed!

`SECURITY NOTE`: never have the `"."` in root user's path - this could lead to virus
problems.  The `root` user can do anything to the system.  But for a normal user
if you are careful it is ok to have `.` when developing.  It is `SAFER` to put `.` at the end
of the PATH list.  If you put `.` at the begin part, e.g. `export PATH=.:...` then commands
will be looked in the current folder first, so I can place a virus filled command
such named chmod in a folder and maybe by accident cd to the folder and do `chmod +x foo`
and it runs the virus.  A normal user running a virus is dangerous.  But `root` running the
virus can destroy your system.  By putting it LAST, any real command like the real `chmod` will be found first and mitigate this security threat.



## Summary

We had to do `chmod +x  script-name` to mark the program file as an executable in order to run it natively like doing `create18man.sh` - you dont need to do that if you know it is a bash script and are ok doing `bash create18man.sh` as that means run a new `bash` program and since you gave it the program it just runs it.

We always make our scripts executable.  By using `chmod +x` style it uses the system default permission mask to do it.  `chmod` can be called directly to set individual settings for owner, group, and others by by default you will mostly just use `+x` to use default permissions.


If we do not have "." in the path we run the program by doing `./create18man.sh` but if "." is in the path then `create18man.sh` will also work.
(When you give `./` you are telling Linux to NOT search the PATH and directly saying run my file in the current folder named create18man.sh)