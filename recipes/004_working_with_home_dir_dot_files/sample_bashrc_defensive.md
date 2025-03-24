## Here is a sample of what to put in a .bashrc and it defensive

We added some alias to commands that might be dangerous.  To make safer we add `-i` to
prompt for overwrite of files.

You can select to be defensive or not, by changing `DO_DEFENSIVE_CHECK_OVERWRITE` below.

If you copy and paste this into a shell it will append to your existing `~/.bashrc` file or
create one if it did not exist.

```
cat >> ~/.bashrc <<'EOF'
# we added this as sample .bashrc

# Do you want every mv/cp/rm command to warn you if we are going to clobber an existing file 
DO_DEFENSIVE_CHECK_OVERWRITE=true  # set to true or false

if $DO_DEFENSIVE_CHECK_OVERWRITE
then
  alias mv="mv -i"    # -i prevents overwriting files, use full path (/usr/bin/mv) to override
  alias cp="cp -i"    # -i prevents overwriting files, use full path (/usr/bin/cp) to override
  alias rm="rm -i"    # -i prevents overwriting files, use full path (/usr/bin/rm) to override
fi

# Most Unix/Linux tools will use vi/vim if no default env variable is provided. Here you can
# change EDITOR and VISUAL to another if you like.  We set to vi (or vim if installed).
# Visual tools on Unix historically have used either EDITOR or VISUAL so we set both.
EDITOR=vi; export EDITOR
if which vim > /dev/null 2>&1
then
   EDITOR=vim
fi
VISUAL=$EDITOR; export VISUAL

umask 022
# note: people usually use umask 022 sets new files: 644 & dirs: 755 in octal   
#======================================================================================
#  HISTORY:   (suggest replacing the tilda (~) with the full path!)
# note:  The following tests for our histories directory, if not there, then create...
if [ ! -d ~/histories ]; then                 
  mkdir  ~/histories 
  echo "~/history directory made to store shell histories"
fi
 
#======================================================================================
# Note: this creates a history file for each instance e.g.: ending ...2025_03_Mar_23_19.16.history.txt
#======================================================================================
HISTFILE="~/histories/`date '+%Y_%m_%b_%d_%H.%M'.history.txt`" ; export HISTFILE
HISTSIZE=2048; export HISTSIZE  # default is low usually 1024, we want double that or more!

alias d='dirs -v '
alias p='pushd'
alias lth-="ls -rlt| tail "
alias po=popd
alias v=vim  # set to vi if vim does not exist

EOF
```

See also our separate [hints at good aliases we use for beginner and experienced users](../../aliases/bashrc/dot_bashrc.txt).


