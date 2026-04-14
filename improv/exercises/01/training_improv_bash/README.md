# Improv - BASH exercises

## Sample Files

[ `all_awk_get_activity.awk` ](./all_awk_get_activity.awk)
... Sample starter to the Prompt for new activity csv ALL IN AWK language.

[ fixer.sh ](./fixer.sh )
... Sample bash script to prompt for description and run thru SED `wrap_in_quotes`

[ `gen_activity.sh` ](./gen_activity.sh )
... Sample shows 2 attempts to shell expose the Actvity variable to an
AWK program but in the first part of the "if" statement you will see
that BASH is trying too hard to escape spaces and it confuses AWK when
an activity has embedded spaces.  The working "else" part has
the SED tool to safe convert any double quotes into a double-quoted string
that works.


[ `repeat_pattern.dat` ](./repeat_pattern.dat )
... Sample repeating patterns that we will use to play with SED 2 target
address examples.

[ `wrap_in_quotes.sed` ](./wrap_in_quotes.sed )
... Working tool that can take a line that has double quotes, change all
of then into SINGLE quotes and ... then finally wrap the entire line
with double quotes inserted at Begin and End of line.
