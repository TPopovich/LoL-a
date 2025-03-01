Please first do exercise `..\07_build_a_function_to_print_columns_of_text`
as that is the basis of this exerise.

The goal is to:
```
Make the DEFAULT file to process be albums.txt but support an additional optional
parameter to the script to give a different filename.

Since we are adding an additional file, maybe other files use a different field
separator character, add that as an additional optional parameter.

How will we deal with files that do not exist or are not readable?
What if the file does not have lines that have at least one field separator?
What/how do we tell the script the list of field names, e.g. maybe the program
has fields named {color,age,state}  for example?
```

One way to provide field names is to use the first line, e.g.
```
color|age|state
red|25|California
blue|30|Texas
green|22|New York
yellow|28|Florida
```

Another design might be to add a flag with the list of fieldnames and the datafile
might just be raw data.
