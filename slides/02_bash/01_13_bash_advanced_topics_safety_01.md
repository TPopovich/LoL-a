## bash advanced topics - safety 01

### beware of using set uid scripts or set group id scripts

You can google the topic but when running any program that runs as `root` make sure
that the `PATH` setting does not include the current directory.  For `root` runnning
programs the PATH should only include secure system directories, the ones set by default
when you installed Linux.

See documents such as [Why Setting SUID on a File or Script is Risky](https://community.spiceworks.com/t/why-setting-suid-on-a-file-or-script-is-risky/927605/5)

### fail fast settings for scripts

Sometimes you expect the `happy path` where all commands work fine.  But sometimes an error happens
and scripts just continue...

We can mitigate this to `hard stop` a script when any error happens.
There are a few ways to do this

- `set -e` setting
- `trap on error, i.e. trap _whatToDo_ ERR` command 

#### using trap ERR in functions and subshells

From the bash docs:

```
set -o errtrace (Same as -E command line flag.)

-E If set, any trap on ERR is inherited by shell functions, command substitutions, and commands executed in a sub‐ shell environment. The ERR trap is normally not inherited in such cases.
```

So doing a `trap ... ERR` without and `command line -E flag` or the `errtrace` option, will not trap
errors in sub functions.


### Sample program you can experiment with

If you save this to a file you can experiment with the various flags and trap

```
:

#######################
# ask user if we want to set the -e flag
#######################
read -p "Shall we execute 'set -e # trap error, still any trap command/catches will execute' [yn] " answer
case "$answer" in
	Y|y)
	echo "... doing set -e  trap error, still any trap command/catches will execute"
	set -e # trap error, still any trap command/catches will execute:
	;;
esac
#######################
# ask user if we want to set the errtrace flag
#######################
read -p "Shall we execute 'set -o errtrace # run trap error, in subfunctions also' [yn] " answer
case "$answer" in
	Y|y)
	echo "... doing set -o errtrace execute any trap command/catches will execute in sub functions"
	set -o errtrace # trap error, still any trap command/catches will execute:
	;;
esac

echo "... setting up a trap on ERR"
trap 'echo ERR_trap_happend'  ERR

###################################
# test error in a sub function
###################################
function subfunction {
	ls look_for_missing_file
}

echo "... calling a subfunction that has an error to see if we trap on ERR"
subfunction
echo "... we exited the subfunction and are continuing to run in the main script body no trap happened yet"
###################################


echo "... about to look for a missing file to generate an error"
ls look_for_missing_file

echo "got past ls error on look_for_missing_file, try enabling set -e by answering yes"




#===========================================================================
# here  is a run log in a test run...
cat > /dev/null <<'EOF'
tpop@asrock3:/mnt/c/work/git/LoL-a/slides/02_bash$ bash  ./try_trap_ERR.sh
Shall we execute 'set -e # trap error, still any trap command/catches will execute' [yn] y
... doing set -e  trap error, still any trap command/catches will execute
Shall we execute 'set -o errtrace # run trap error, in subfunctions also' [yn] y
... doing set -o errtrace execute any trap command/catches will execute in sub functions
... setting up a trap on ERR
... calling a subfunction that has an error to see if we trap on ERR
ls: cannot access 'look_for_missing_file': No such file or directory
ERR_trap_happend

tpop@asrock3:/mnt/c/work/git/LoL-a/slides/02_bash$ bash  ./try_trap_ERR.sh
Shall we execute 'set -e # trap error, still any trap command/catches will execute' [yn] y
... doing set -e  trap error, still any trap command/catches will execute
Shall we execute 'set -o errtrace # run trap error, in subfunctions also' [yn] n
... setting up a trap on ERR
... calling a subfunction that has an error to see if we trap on ERR
ls: cannot access 'look_for_missing_file': No such file or directory
EOF

# Note that ERR_trap_happend  did not happen without the `set -o errtrace` or if we did `-E` so 
# be careful using `trap ERR` in sub shells
#===========================================================================

```
