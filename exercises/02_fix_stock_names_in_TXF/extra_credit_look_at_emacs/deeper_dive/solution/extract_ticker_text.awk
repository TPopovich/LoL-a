# Grab ticker-text out of a file.
#
# This program will take stdin assumed to be of the format:
# that might have tokens that look like this:
#((ticker CF INDUSTRIES HLDG))
# And will take any example of
#((ticker .* HLDG))
# and construct a unique list of such tokens as output, e.g.
# it might produce this output:
#((ticker JPMORGAN EQUITY PREMIUM INCOME ETF))
#((ticker CF INDUSTRIES HLDG))
#

{
    if ($0 ~ /\(\(ticker [^)]*\)\)/) {  # Check if input line matches pattern
        match($0, /\(\(ticker [^)]*\)\)/, arr)  # Extract the matched portion
        ticker = arr[0]
        tickers[ticker]++  # Store in associative array
    }
}

END {
    for (ticker in tickers) {
        print ticker  # Print stored tickers
    }
}
