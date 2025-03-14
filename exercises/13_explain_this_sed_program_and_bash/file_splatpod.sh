:
# task is the explain what this script does...
#_______________________________________________
 filename_to_display="${1?'USAGE'$0'filename-to-display'}"
 lo=1 ; hi=24

  while : ; do
   echo "=-=-=-=-=-=-=-=-=--------------------------------"
   sed -n "${lo},${hi}p" ${filename_to_display}
   : $(( lo+=30 , hi+=30 ))

   read -p "continue? type n to exit" answer
   case "$answer" in
    n) break;;
   esac
 done
