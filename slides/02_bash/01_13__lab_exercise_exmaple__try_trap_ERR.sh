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

