We want a code generator to build a powershell function like this:

```
function Get-AzureRegionMapping {
    param (
        [string]$region
    )

    switch ($region) {
        "useuapeast2" { return "useuapeast2-a-bz14" }
        "westeurope" { return "westeurope1-a-bz10" }
        default { return "Unknown region" }
    }
}

# Example usage:
# Get-AzureRegionMapping -Region "useuapeast2"
```


We want to generate this based on a CSV file in the folder called `regions.csv`
and it could have any number of rows.  We have 5 rows as sample data.

HINT: AWK has a special pattern/trigger for "begin of output" and one for do
"at end of output" that might be helpful.
