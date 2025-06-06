## Bash Option parsing (low level)

### Review and Prep

Bash "Command-Line Options" to programs can be given in 2 styles:
- long/English
- short/One-Char classic style

This exercise is a "get your feet wet" style exercise where we want to
explore BASH commands:
- echo
- printf
- read

We have a companion video to show how the components we need to solve
this exercise that shows off all the above commands and gives prep
work for the exercise.

We want to take the following snippet (that has some commands we have
not yet seen) and extend it to simulate the `configure` command.
This command is run before you build a `unix or linux` std system command
that is written in C or C++.  The details are not really important, but,
what we care about is processing `short/1-character` command line
argument/flags.

Here is a snippet of some code that can loop over the command line arguments.
Ignore the things like `shift` that we will see later and the `case`
as well.  Case is like a C language switch statement and just picks
cases.

#### Snippet of a processing loop
You might think you could write code like this to handle it:

```
if [ $1 = "-p" ]; then
    # user entered -p /usr/local, do code that processes the -p option
    # do code for $2 since that is the value of -p
    # so maybe $3 is the -w or some other flag?
fi
```

Here is a better way that uses `shift` that is designed for this sort of thing.


The command shift performs the function of:

```
1=$2
2=$3
...
```

for every program argument, the above is not allowed by the user, e.g. you can not assign to variable `1`
but the system via shift will throw away variable `1` regardless of how many there of others and SHIFT
then down so you can work on one argument at a time in a loop. 

The shift is rather fancy (most people dont do this but if you supply a numeric argument to shift, it will shift
the arguments that many times so `shift 2` will essentially do `shift; shift`.
But unless you are doing something like shift 5, it is best to just say `shift; shift`.

#### Good snippet to process short options

```
while [ -n "$(echo $1 | grep '^-')" ]; do
    case "$1" in 
        -a ) # process option -a, assume that -a does not have an associated argument
               ;;
        -p ) # process option -p that has a value
               OPT_p_given=true
               OPT_p_value="$2"
               shift   # shift over the value of -p
               ;;
        -w ) # process option -w 
               OPT_w_given=true
               OPT_w_value="$2"
               shift   # shift over the value of -w
               ;;
        *  ) echo >&2 "USAGE: configure [-a] [-p prefix_dir] [-w style] args..."
             exit 1
    esac
    shift
done

# do you normal processing of arguments, you collected for the flags
```

### Positional parameters
We have seen a few examples of the positional parameters (these are variables called 1, 2, 3, ...) and
we fetch via `$1` and so forth.
The shell uses them to automatically store the command-line arguments to a shell script or function
so we can fetch the values when it runs.
NOTE: along with `$1` type variables we have also seen related variables that bundle the `1,2,3...`
like `*` (for the string of all arguments) or its cousin `@` and the count: `$#` (for the count of arguments).



## Exercise

We want to simulate the configure program.

We want a script named `configure.sh`.
(You can create it with a editor of your choice.  And it is best to create a sub folder to work in, e.g.

```
mkdir ~/project
cd ~/project
```

We want to honor 3 optional flags:
- "-p" foldername
- "-w" with-argument
- "-c" for boolean flag to "confirm operation"

Sample calls a person can make:


```
configure 
configure -c

configure -p /usr/local -w small
configure -p /usr/local -w small -c
configure -w small -p /usr/local    # we support any ordering
```

The program on first pass does not have to honor the `-c` flag.  So get the first part
working first.

That first part should assume `default values` for -p to be `/usr/local` and for -w `huge`
and it will write out a line like this of the values the program will do to simulate
running configure:

```
Processing configure using PREFIX [???] with STYLE [???]
```
where you honor the -p and -w if given.

Later if users give `-c` then you confirm the user "really wants to do the program"
and you might use style `Want to run [Yn] ` as a prompt to default YES.

TIP:  a good way to prompt is to use bash `printf` as that gives you full control
on carriage returns (i.e. new lines) and allows something like this for a nice prompt:

```
printf `Want to run [Yn] `
read answer 

# above $answer will hold next line given as response to the prompt to default of
# blank response is taken as yes
```

You can use `echo` bash command but in the early days different vendors of Unix 
wrote their version of echo flags in different manners to try to keep it from
doing a \n (newline).  Later release of ksh/bash included printf so users
have full control on format. We use it since it does not automatically add a newline.
