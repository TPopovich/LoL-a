# Post process some pipeline taking each line and constructing a elisp stmt from it
#
# This program will take stdin assumed to be of the format:
#
#((ticker CF INDUSTRIES HLDG))
# and construct a elisp line like this for each line:
#(tjp-replace-a-string "((ticker CF INDUSTRIES HLDG))" "???")
#

{
  line=$0 # for each input line we might get a ticker like:
          # 
          # And we would like to emit this:
          # ticker ADVANCE AUTO PARTS;???
  
  # strip away extra text
  # convert:((ticker ADVANCE AUTO PARTS)) 
  # into:   ADVANCE AUTO PARTS
  sub(/\(\(ticker /, "", line); # remove the leading text
  sub(/\)\)/, "", line); # remove the trailing text

  printf("%s;???\n", line) | "sort";
  #
  #                                            ^--- need the \n to end a line
  #                                            as printf differs from print that auto adds \n
  #                                                    ^--- pipe to "sort"
  #                                                    is to have the os sort our answers
}
