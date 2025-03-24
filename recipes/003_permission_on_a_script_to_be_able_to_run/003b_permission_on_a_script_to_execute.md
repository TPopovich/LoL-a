## Recipe create a executable script command [PART B] and script to test permissions, and using script and history

In this exercise we are working with an executable "command" script file. 

We created a command but are having trouble running it from the command line, like any
other command in Linux.

If you have not created it yet please do  [part a of this recipe](./003a_permission_on_a_script_to_execute.md).

Next we will start to use Unix/Linux commands: {chmod, chown} and learn how to make  script we created
in part A 
be executable!

### Recap from Part A - try 1 to run the command script

We received error `Permission denied`


### Lets see at least if your script works, we can pass direct to bash
try it again telling the shell to run it here ...

``` 
Type: bash ./cmdTest01.sh
this is a command script
```

Wow!  That worked when giving to bash (or ksh/sh/zsh as well)

let's try running the command, since commands when we type them on the
Linux shell should work like any other command.
Notice below which ignores the shell function script and running it direct
also does not work.

```
Type: ./cmdTest01.sh
bash:  ... Permission denied
```

### Permissions

OK. So what does `Permission denied` mean? (We will cover file permissions in an entire section in this course)
however to get a glimpse do this:

```

type: which bash
/usr/bin/bash
type: ls -l /usr/bin/bash
-rwxr-xr-x 1 root root 1446024 Mar 31  2024 /usr/bin/bash
type:
        ^---- notice there are x characters for bash

type: ls -l cmdTest01.sh
-rw-r--r-- 1 johny johny 25 Mar 23 12:05 cmdTest01.sh
type:

        ^---- notice there are no x characters in our script
              which is how the ls -l  marks execute permissions.
```

So again, that Permission denied error was received when trying to run our script directly. 
So far, we have created a program that echoes a string, but it's not working when
we run directly.
Linux has a command called `which` (whence on some shells) which will to tell us where a command
is located in the file system.

```
export PATH=".:$PATH"   # needed to have which search our current folder
type: which bash
/usr/bin/bash

type: which cmdTest01.sh
type:

```

The permission to execute is shown with `x` and can be given to a script or program
by doing this command:

```

chmod +x cmdTest01.sh

```


```
export PATH=".:$PATH"   # needed to have which search our current folder

type: which cmdTest01.sh
./cmdTest01.sh

# That looks good, which finds it as an executable command
```

Lets try running it:

```
Type: cmdTest01.sh
this is a command script

Type: ./cmdTest01.sh
this is a command script
```

##  The chmod fixed the ability to run the command, lets dive deeper

We fixed scripts "run-ability"...  Why did we have to mess with the `PATH` variable.

See in [part c of this recipe PATHs](./003c_permission_paths.md).
