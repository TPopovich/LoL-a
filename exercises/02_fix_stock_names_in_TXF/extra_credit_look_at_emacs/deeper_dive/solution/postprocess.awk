# Post process some pipeline taking each line and constructing a elisp stmt from it
#
# This program will take stdin assumed to be of the format:
#
#((ticker CF INDUSTRIES HLDG))
# and construct a elisp line like this for each line:
#(tjp-replace-a-string "((ticker CF INDUSTRIES HLDG))" "???")
#

{
  line=$0 # for each input line we write a lisp line
          # like this pattern
          # (tjp-replace-a-string "((ticker ADVANCE AUTO PARTS))" "AAP")
  printf("(tjp-replace-a-string \"%s\" \"???\")\n", line) | "sort";
  #
  #                                            ^--- need the \n to end a line
  #                                            as printf differs from print that auto adds \n
  #                                                    ^--- pipe to "sort"
  #                                                    is to have the os sort our answers
}
