:
sed '
s/[(][(]ticker ADVANCE AUTO PARTS[)][)]/AAP/
s/[(][(]ticker ALPHABET INC.           CLASS                  A[)][)]/GOOGL/
' $*
