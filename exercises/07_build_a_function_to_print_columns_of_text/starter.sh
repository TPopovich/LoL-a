:

# ???  fill in

#
# Below are stubs of a function to develop for the soluntion
#

function getfield {
  local fieldname=$1  ## local prevents clobber of upper scope var if any named fieldname
  # goal is to return 4 if you get input string of year  as argument 1
  # also extra credit can you change ${1}  to be something better with a ? modifier to catch if no first arg is passed in?
  # ??? what goes here
} 

function fetch_data {
  # ??? what goes here, the file task.md  has the contents.
  # BUT we like to be safe, should we add "local" as we did above to shield our local variables?
  # if so, add that also.
  # ??? What does "local" do?  Search the net to find out or experiment with functions that
  # have local and ones that do not use it to find out.  It is not required but good defensive programming.
}

#
# ????   Below is the "main" routine call point, the line is INCOMPLETE can you finish it?
#
fetch_data   ### missing part ??? what goes here ???
