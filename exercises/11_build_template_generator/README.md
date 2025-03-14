Here we want to build a shell function that can simulate
what this powershell function might do:

```
# Generate a SAS endpoint stanza in powershell #>
function Generate-SasEndpoint {
    param (
        [string]$Region,
        [string]$RegionEnglishDesc
    )

    $template = @"
        <Endpoint>
            <Name>sas-production-$Region</Name>
            <EndpointType>sas-production-$Region</EndpointType>
            <Url>https://sas-production-$Region.sas.azure.com/</Url>
            <SMEConfig/>
            <TargetRegion>$RegionEnglishDesc</TargetRegion>
        </Endpoint>
"@
    
    return $template
}

```


See file  `azure_regions.txt`
that has a list of valid azure regions.  Try to make that into a real CSV like database that you
can use cut or awk to process fields to see if you can:
```
1. validate regions
2. maybe help users find values to use with the code generator
```
