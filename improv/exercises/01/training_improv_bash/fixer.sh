:
 read -p "enter desc: "  DESC
 echo $DESC  | sed -f ./wrap_in_quotes.sed

