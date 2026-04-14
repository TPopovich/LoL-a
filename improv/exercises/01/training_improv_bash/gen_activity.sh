#!/bin/bash
dt=$(date  +'%m/%d/%Y')
group=$( select i in $(< ~/Documents/groups.dat); do if [ -n "$i" ] ; then echo "$i"; break; fi  ; done)
CSV_FILE=~/Documents/c.csv

touch $CSV_FILE


# the following 'set -x' will log on stderr all commands before we run them for debug
set -x

if false
then
  activity="foo"
  read -p "Enter activity: " activity
  echo $activity
  cat /dev/null | awk 'END { printf "\"%s\",\"%s\",\"%s\"\n", "'$dt'", "'$group'", "'$activity'"; }' >>  $CSV_FILE

else
:
 # here we only do DT and GROUP here, and do the sed wrap for the activity
 cat /dev/null | awk 'END { printf "\"%s\",\"%s\",", "'$dt'", "'$group'"; }' >>  $CSV_FILE

 read -p "enter desc: "  activity
 echo $activity  | sed -f ./wrap_in_quotes.sed >>  $CSV_FILE

fi

