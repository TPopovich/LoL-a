# partial solution

{
    if ($0 ~ /\(\(ticker [^)]*\)\)/) {  # Check if input line matches pattern
        match($0, /\(\(ticker [^)]*\)\)/, arr)  # Extract the matched portion to arr
        ticker = arr[0]
        tickers[ticker]++  # Store in associative array
    }
}

END {
    #  figure out how to print stored tickers to stdout
    #  They are in the associative array tickers
}
