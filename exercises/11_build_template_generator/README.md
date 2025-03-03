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
