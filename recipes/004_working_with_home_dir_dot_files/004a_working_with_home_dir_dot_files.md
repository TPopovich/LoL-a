# dot files generally live in your home folder (~)
You can have a quick peek at what files exist by doing

``` 
Type: ls -al ~

# This command will show many files in your home folder.

# We are looking for ones like:

-rw-------  1 johny johny  12957 Mar 23 12:02 .bash_history
-rw-r--r--  1 johny johny    220 Sep  8  2024 .bash_logout
-rw-r--r--  1 johny johny   4041 Jan 11 16:06 .bashrc
...
-rw-------  1 johny johny  22776 Mar 23 19:13 .viminfo
...
```

Here is a list of import files in your home directory that are important:

In the screen shot above there are some "hidden" files, they are:
.bash_logout - a file that contains information on how to close the bash shells on exit
.bashrc - a most important file that contains configuration information that you select, for every shell

You might also see:

histories/ - a directory we create and in the beginning can be recommended for keeping history of commands as described in this section (optional).
(Our sample .bashrc will write a command to create entries in the histories file)

.profile - a file that was used for Bourne shells, and some systems use .profile and point to .bashrc or an rc file for zsh.

.ssh - this is a directory to manage secure connections, for command ssh; it holds keys, and known hosts

.viminfo - a file that contains customizations, previous vim commands and other history for the vim editor

## Editing/Creating your .bashrc

See a sample [.bashrc snippet to add to your .bashrc file](./sample_bashrc_defensive.md).
