## Recipe create a executable script command [PART A] and script to test permissions, and using script and history
In this exercise you will create a file that will be designated as an executable "command". You
will use Unix/Linux commands: {chmod, chown} and learn how the system handles executables
in part B.

After that you will continue working with other Real World commands.

Your Task: create a command - use the following commands:
chmod, chown, which, locate, cnf, zypper, cat, echo and command

To capture the steps involved, below we used a tool called "script" to record the commands
and output generated. This is handy to save your work, it will even copy backspace and
other edits, so our trusty `col -b` will be handy to clean up the output files called `typescript`.

Again, I filtered the typescript file through "col -b" to remove all non-printable characters, and
then edited it in vi. The process is to start recording by typing: `script`,
when finished simply type "exit". Then filter the file by typing: `cat typescript | col -b > typescript.txt`.
Then we use an editor to edit typescript.txt as needed and save as a script.

#### History Sidebar
On Linux, in shells you can see the history of commands you entered by typing `history`
but they lack the output produced.  That is why we use `script`.

TIP: Use the `script` command combined with the `history` command to document
what you did on your system and use that information to get the essence to repeat the process 
by creating scripts to automate.

### Continue the Recipe
Open a terminal session on your Linux system and type the items after the "Type:"
(the "Type: " represents the PS1 value, or your shell's initial prompt, you can view
your prompt setting by doing `echo $PS1"` to
display that variable. If you want to match what we have below do `export PS1="Type: "` before starting.

(Also if the output of your commands differs, then try to figure out why by looking at the
man page for a command or the excellent [help resources](..\..\hints\get_help_on_commands\easy_read_with_info_on_linux.md) found
in our guides or looking at the `--help` or `-h` option on individual commands, or do a web search
to see if your particular version has some difference. Remember, BASH (and zsh/ksh) is
highly configurable and there are many different places that settings can be tweaked.
But we have faith that you'll be able to sort out any minor issues...

### Try this example:

We usually name our file `xxx.sh` as convention.  Unix/Linux does not use the `.sh` in the same way that
Windows used extensions.  But by using scripts in filenames that end in `.sh` editors like VIM and Emacs
and VsCode can know it is a `shell script`.

TIP: for shell scripts based on sh (so ksh/bash/zsh) use extension of `.sh`; for any SED pure command file use `.sed`
and similar for AWK pure snippet use `.awk` ... and VIM will give you syntax highlighting.

```
Type: mkdir exercise_3a; cd exercise_3a
Type: echo "this is a command script"
you should see: this is a command script

Type: echo "this is a command script" > cmdTest01.sh

Type: cat cmdTest01.sh
this is a command script
```


### Validations
Q: If you were to execute "cmdTest01.sh" would it do the same thing as the command line
sequence above?

If not, what is `wrong` with our script?

Look at the output of `cat cmdTest01.sh` -vs- what we typed, is there a difference?

So, in order for the command script to actually print out the statement, the file cmdTest01.sh
will need to include the
`echo command` and also `quotes`.  (The Quotes tells the shell to treat the thing inside the quotes as one `thing` - one argument to give the echo command.)
In the shell echo is a command to produce the statement.  The script needs to have echo xxx
just like you did in the shell manually.

Next try this:

```
Type: echo 'echo "this is a command script"' > cmdTest01.sh   # different quotes way to solve
```


Here we used single quotes `'` to wrap a command that uses double quotes.
But another way is to use `\` character escapes codes. The `\` tells the shell to forget the special character " is a special character and
it should be treated just like it was a normal character like `a`.
This allows it to be echoed instead of executed as a command.

```
Type: echo "echo \"this is a command script\"" > cmdTest01.sh    # alternative way to solve
```

Next examine the file content again:
Type: cat cmdTest01.sh
echo "this is a command script"

Notice that this looks exactly as what we typed by hand above, so the command script will produce the statement "this is a command script" if executed

#### ATTEMPT 1 TO "RUN" (execute) script command called cmdTest01.sh.

Q: if you type "cmdTest01.sh" at the prompt, what happens?

It might say command not found.  This is due to `PATH` variable setting of not having `.` in the `$PATH` list, so 
try this instead:

```
Type: ./cmdTest01.sh

bash: ./cmdTest01.sh: Permission denied
```

So attempt 1 has a problem, since it is presently not runnable by us.

We will see a solution in [part b of this recipe](./003b_permission_on_a_script_to_execute.md).

#### Minor side bar, optional try using script command to save output
Remember them out and also repeat with the tool called `script` as extra credit.  `BUT` one thing to know about using script,
as soon as you hit enter after typing `script` you are in a SUBSHELL. You need to exit the subshell by typing exit or on
a line by itself ^D (meaning control D) to exit the subshell.  ... then you will see a message saved to typescript 
at the start and `Script done` when you exit the subshell.

```
Type: script
Script started, output log file is 'typescript'.

johny@asrock3:~/rec/rec01$ exit
exit
Script done.
```

Our suggestion is to then do this to "clean up file typescript":

```
Type: cat typescript | col -b > typescript.txt
```

That will remove non-printable characters and "remove and fix" backspace and other editing
keystrokes in an intelligent manner and leave file `typescript.txt` good looking.
