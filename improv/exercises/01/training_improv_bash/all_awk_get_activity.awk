

function Retrive_SUGGESTED_GROUP_Names() {
    ############
    # Return a hint like:  Training Coding Teaching Writing
    # to be used in a statement to emit like this:
    # GROUPs to use:  Training Coding Teaching Writing
    TOTAL_GROUP_HINT=""
    "bash -c 'cd ~/Documents; pwd'" | getline PWD
    close("bash -c 'cd ~/Documents; pwd'")

    SUGGESTED_GROUP_DATA_FILENAME = sprintf("%s/groups.dat", PWD)  # e.g. values from ~/Documents/groups.dat

    while (getline GROUP_HINT < SUGGESTED_GROUP_DATA_FILENAME ) {
        TOTAL_GROUP_HINT = (TOTAL_GROUP_HINT " " GROUP_HINT)  # note the " " space
    }

    return TOTAL_GROUP_HINT
}

BEGIN {
    ############
    "bash -c 'cd ~/Documents; pwd'" | getline PWD
    close("bash -c 'cd ~/Documents; pwd'")

    ############
    printf "GROUPs to use: "
    print Retrive_SUGGESTED_GROUP_Names()        # that was calculated in above fnct
    printf "Enter Group Name: "
    # idiom (getline < "-")  says read from terminal the next line
    getline < "-"
    GROUP = $0

    ############
    printf "Enter Activity: "
    # idiom (getline < "-")  says read from terminal the next line
    getline < "-"
    ACTIVITY = $0

    # idiom (VARIABLE ~ Regex)  says this is true if the VARIABLE contains the Regex, here a double quote
    if (ACTIVITY ~ /["]/) {
       # idiom gsub will globally substitute the double quote for a single quote, note single in double quotes
       gsub(/["]/, "'")
    }
    
    ACTIVITY = $0          ## put any updated  " -> '  changes back into ACTIVITY variable

    ############
    # lets run a date command, format proper and put into the DATE variable
    # Note that we just put a string of the cmd to run and the output is "pipe-ed" to a getline
    ############
    "date  +'%m/%d/%Y'" | getline DATE
    close("date  +'%m/%d/%Y'")

    # lets look at the final version of variables
    ############
    print DATE
    print GROUP
    print ACTIVITY
}