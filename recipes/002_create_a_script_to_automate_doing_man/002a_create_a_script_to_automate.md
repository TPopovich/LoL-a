## Recipe steps 1 and 2 ___________________________________________
Note when doing a `man` command we can select the first section of the manual
pages - section 1 is for commands and scripts - typically what you want.
But there are 8 sections to manual pages that cover device drivers and c libraries
found on unix/linux.

However when you select a `thing` you want documentation on like `ls` and it only has
one section that is all you can see.  If the `thing` is found in multiple sections
it can cause confusion so we will only look in section `1` below.

We assume you did the first recipe and have some example
man pages,  stored as files already.

You can review `recipe #1` for how to change your PS1 variable to make the prompt match,
but that is not required.

1) Type: ls ; ls -al
you should have editable, viewable help pages for pwd, ls, more, man and cd

Using just `ls` gives just the name;  using `ls -al` gives all details on the files.

2) Build and enter a short automation script that uses a for loop that takes a few more command
names creates a plain text manual page for review by
substituting "i" for the name listed in the variable:
`"CMD_NAME"` will be plugged into  `man $i | col -b > man.$i.txt`
which is the `meat` of this script to build the man pages.

You have 2 options:  either `cut and paste using this pattern into the shell` or use `vi or nano editor`.

### Creating The Script File
#### Cut and paste the file
Copy the line starting with `cat > create18man.sh <<'EOF'`  and up thru and including `EOF` on the line by itself into a shell.  This is a `HERE` document of the shell and will create the file `create18man.sh` for you without using an editor.

If you want to do the `cut and paste` rather than type the script below line by line into an editor, there are 2 things you need to watch out for...  NOTE the first line
and last line should by typed exactly as you see it, AND SPACES OR LACK OF THEM matter, namely what we mark with `^-` below:

```
cat > create18man.sh <<'EOF'
                     ^--- no spaces next to EOF

EOF
^--^- no spaces before EOF or after EOF
```

#### Use Vi/VIM

You can type the following script into an editor.
We will have separate tutorial on vi/vim or you can use nano editor.

vi/vim is a little tricky since it has a `command` mode and an `insert` mode.
The ESC key moves from `insert` mode to `command` mode.

type: vi create18man.sh (you will type all the text starting from #!/bin/bash
until the final row of ### LAST line of script)
to start typing text:
(type the letter "`i`") (This makes the editor begin insert mode in vi)
(type exactly everything below) (if you make a mistake you
can delete a character from the command mode by typing x.
`BUT in vi/vim remember to enter the command mode`, type ESC or sometimes written <esc> key
that typically lives on the keyboard next to the `1` key. And then the commands
to enter the insert mode, type "i".
Rember `<esc>` key to get to commands (command mode), and `<i>` to do inserts (insert mode).
Vim is a modern vi and it will show `-- INSERT --` at gutter of the window at the bottom
to show it is in `insert` mode.
(To save the file and quit out of the vi editor:
First hit the <esc> key, then <shift>; ( `to type ":"` (the colon symbol),
then `wq`

So if you are in insert mode you will type in order
`<esc>:wq` (this enters the command mode, and you write the file and quit ... ))

(NOTE: VI/VIM and Emacs will leave undo or lock files on disk.
If you exit out of vi/vim improperly, or maybe your shell or editor crashes, there may be a
"swp" or other vim files created. When you enter vi/vim again, you'll be asked to "RECOVER"
your old file or other options, and then save the file properly, and exit.
If you see the "swp" file or other temporarily files, you can then CAREFULLY remove it
`(delete using the "rm" command)`. For example, if the you saw the file: .create18man.sh.swp
(this is a hidden file because it is preceded by a "." (period). Command `ls -al` will show
hidden files because of the `-a` flag). After you FIRST save the
file, then you can REMOVE this backup file by typing: "rm .create18man.sh.swp" (you will
be prompted to make sure you want to delete the file if your system has aliased rm to "rm -i"
as many systems will do for safety in your
.bashrc file, answer "y" to remove the file.  When starting out with Linux we recommend
doing `alias rm="rm -i"` for safety.)

#### Script file to copy

Note the line with `` is only for the copy-and-paste into a bash terminal. This is a HERE document and will create the file for you.

If you are entering the file via Vi/Vim or Nano do not type the first line starting with `cat` or the last line with `EOF` on a line by itself.  That is for the shell to mark a HERE document.
We put those lines here for people that want to use the `cut and paste method` to create the script file.
```
cat > create18man.sh <<'EOF'
#!/bin/bash
### ^- above is the very first line of script (called a shebang) v-- next line is the program comment
# create18man.sh - automation script with for loop to save man pages for various Linux commands

export CMD_NAME="cat cut fmt head od nl paste sed sort tail tr uniq wc cp find mkdir mv dd"

for i in $CMD_NAME
do
  echo "processing $i"
  man 1 $i | col -b > man.$i.txt
done

ls -l   # this just shows files in the current folder

### LAST line of script
EOF
```

## Recipe steps 3 and 4 ___________________________________________

Now we assume you created the script file.  Lets run it!

3) type: sh ./create18man.sh 
    </br> (this will run the script - more on this in Exercise #2)

4) type: ls -l
   <br/> If you typed in the shell the HERE doc or typed it into Vi or Nano, correctly you should have now
   a list of files (named `man*.txt`) that contain the manual
   pages for commands listed in the CMD_NAME variable. If you have files that are 0 bytes, that can happen
   change the script and give man a command that does not exist, that could means the command
   wasn't a command or it is a command but it is a special shell built-in (it is implemented in bash/ksh itself) and no man pages were available.

# SUCCESS if you now see output like:
```
type: sh ./create18man.sh
processing cat
processing cut
processing fmt
processing head

...
ls output listing the files
which will vary according to files in your folder, 
key is that the .txt files were created and have size > 0 bytes
```
