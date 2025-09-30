function Pop-ToTask
{
  <#
    .SYNOPSIS
    Pop-ToTask
    :TODO: Short Description
    .DESCRIPTION
    Pop-ToTask
    :TODO: Detailed Description
    .EXAMPLE
    Pop-ToTask
    explains how to use the command
    can be multiple lines
    .EXAMPLE
    Pop-ToTask
    another example (if you need it)
    can have as many examples as you like
    .EXAMPLE
    Pop-ToTask
    another example (if you need it)
    can have as many examples as you like
  #>
  [CmdletBinding()]
  param
  (
    [Parameter(Mandatory=$true, Position=0)]
    [System.String]
    $Task
  )
  
  start $Task
}