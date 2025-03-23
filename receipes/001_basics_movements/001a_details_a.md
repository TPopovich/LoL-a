Receipe #1 - basic commands

When doing this exercise and other exercises keep in mind that Unix/Linux consists
basically of two things:
`FILES` and `PROCESSES` - everything is a file, or a process, even things like
the keyboard input and output are special `files` ...

`stdin` (pronounced standard in) is typically from a keyboard, here a file represented
by a special device drivers.

`stdout` (pronounced standard out) is typically displayed on the terminal, is again, a file - here
a special drivers to write to the terminal.

`pipes` another special input/output mechanism, on Unix/Linux under the hood uses IPC (inter-process communication)
oo allow redirecting the stdout from one process to the stdin of another allowing filtering and manipulation of the data
in files.  This is a key concept of Unix/Linux and exposed by the shell we are working in.

TIP:  below when you open your `bash` or `zsh` or `ksh` shell, you can change the prompt so it will say "type:" to follow
along in the receipe.  This is not required but will make the receipe look like the screen on the computer.
`To change the prompt do this`:

```
johny@asrock3:~$ echo $PS1
\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$

johny@asrock3:~$ export PS1="Type: "
Type: 
```

Notice how we show the current `PS1` variable from our system and then after we set `PS1` it changes the prompt (from `johny@asrock3:~$`) to just `type:`.

Ignore all thos wierd characters in the original PS1 for now.  Also we have not changed anything permanently. When you create a new
shell from scratch it will still have the original PS1.   But since we did an export of PS1 if you did another `sh` derived shell
such as ksh, bash, zsh  or any other that uses `PS1` it too with use Type: as the prompt.


Once you have set your prompt and in a shell for the first time, you are in your home directory.
Begin typing the following:
1) Type: pwd
</br>Q: what was displayed? (pwd - means print working directory)
2) Type: cd .. ; pwd
   </br>now you will likely see /home on most Unix/Linux
3) Type: cd ; ls
   </br>Q: what do you see? Now you should see what was displayed in step 1. Unix/Linux makes it easy to find your way home - default target of cd.
4) Type: man pwd
   </br>`(to exit press "q")` This is the help page (or manual page - aka man page as Unix/Linux calls it) for pwd, and gives help/documention for a command.
5) Type: man pwd | col -b
   </br>The output should different. `col -b` is a good trick to clean up fancy looking output.  Unix/Linux is designed
to give bold text and colors (see that original `$PS1` above with those wierd characters....) and when you need to view
it or save to a file this our go-to wayh to filter out or remove non-printable characters. This is our first use of the pipe
symbol "|" to string text from one program to another.  Under the hood in the OS, this is our first inter-process communication tool
that we used.  This IPC (by PIPE) that directs stdout to stdin of two processes (the 2 programs man and col) thereby
allowing multiple processes to be executed at one time. This allows data to be filtered.  This is a key
aspect of Unix/Linux where we string small specialized tools together repeatedly to achieve our goal.

6) Type: man pwd | col -b > man.pwd.txt
7) Type: ls
8) Type: ls -al
9) Type: ls -Al ;  ls
   </br>Linux is case sensitive.  The `-a` and `-A` did something different.  In practice we will never use `-A` usually
this is just to show that you need to be careful with entering options as case matters.  (NOTE: this is generally not
true on DOS/Windows so users familar with that OS need to remember that case matters.)

note the differences in the file listing (ls) command output.
The `ls -al` command showed two lines with a dot, and then two dots.
What are they? The single dot represents the current directory.
And the two dots represent the parent directory. Remember, everything is represented
by a file.  `You can also do  cd .  and try that out... It goes nowhere as the cd to current
directory is effectively a nop - no operation.

10) Type: `man ls | col -b | tee man.ls.txt`
    </br>Here we have used two (2) pipe symbols, this displayed the cleaned-up man page for ls
by filtering out non-printable characters and then used the "tee" command to direct the
output to two (2) places `stdout` AND also to a text file (here man.ls.txt).
11) Type: less man.ls.txt
    </br>NOTE: if less does says no command available, you do not have less so use instead `more` - but less is more (a play on less is a better more than more) so use that
if it is available.
NOTE: to quit less or more, `type q`, to move down, use the space bar or cursor keys or keyboard return (by line),
use b to go back up one page.
POWER HINT: do not do this yet, if if you hit "v" in less you enter your default editor and on ubuntu that is nano
while for `more` the default is what Unix/Linux historically used as the default editor, namely vi.
If you enter the "v" command you will enter the nano or vi editor - wait on doing that as you dont know how to exit the editor.

12) Type: ls -alt
    </br>now you will time sorted file lists, the ones you created last at the top, the -t option is time sort
and you can also add an r for `ls -altr` to reverse the sort order.

13) echo "WOW"; </br> we have covered the five most essential Linux commands: man, ls, cd, pwd and more/less to page long files.
14) Type: cd /lib ; ls -FCR | less
    </br>TIP: use more if less is not available.
You changed directory to /ls, then added another command (ls pipe more), separated by the
semi-colon to stick a sequential set of commands on one line. The semi-colon tells the shell to do the first command
namely the `cd` and when that is fully finished move to the next command `here ls pipe more` next.
This combo of `ls|more` ( a pipeline as a whole is treated as one command ) is sort of like a `two lego blocks sticking together` as that will be the next
command done in the sequence.  Here we do a `ls` but here use `-R` (to **recursive** list files)
This will list all the files below that point. And it might be a long list, we piped it into our pager (less or more).
We use a pager so we can see a page at a time and move up and
down using commands like the space bar and B. No mouse was needed and we can just use what people call a window-less or dumb terminal to do all the interactions.
15) Type: man less | col -b > man.less.txt ; man cd | col -b > man.cd.txt
16) Type: man ls | col -b > man.ls.txt
17) Type: ls man.*.txt

Success you have just toured Unix/Linux and used live the basic essential commands you will use everywhere.
