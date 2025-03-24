## Here is a sample of what to put in a .bashrc and it defensive

We added some alias to commands that might be dangerous.  To make safer we add `-i` to
prompt for overwrite of files.

You can select to be defensive or not.

```
cat >> ~/.bashrc <<'EOF'
# we added this as sample .bashrc

DO_DEFENSIVE_CHECK_OVERWRITE=true  # set to true or false


if DO_DEFENSIVE_CHECK_OVERWRITE
then
  alias mv="mv -i"    # -i prevents overwriting files, use full path (/usr/bin/mv) to override
  alias cp="cp -i"    # -i prevents overwriting files, use full path (/usr/bin/cp) to override
  alias rm="rm -i"    # -i prevents overwriting files, use full path (/usr/bin/rm) to override
fi

# Most Unix/Linux tools will use vi/vim if not default is selected, here you can
# change EDITOR and VISUAL to another if you like.  We set to vi (or vim if installed).
# Visual tools on Unix historically have used either EDITOR or VISUAL so we set both.
EDITOR=vi; export EDITOR
if which vim > /dev/null 2>&1
then
   EDITOR=vim
fi
VISUAL=$EDITOR; export VISUAL


alias d='dirs -v '
alias p='pushd'
alias lth-="ls -rlt| tail "
alias po=popd
alias v=vim

EOF
```

See also our separate [hints at good aliases we use for beginner and experienced users](../../aliases/bashrc/dot_bashrc.txt).


