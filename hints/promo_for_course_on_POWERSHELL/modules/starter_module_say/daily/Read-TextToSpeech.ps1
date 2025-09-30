<#

PS C:\Windows\system32> set-alias say daily\Read-TextToSpeech
PS C:\Windows\system32> say "big days"

#>

function Read-TextToSpeech # alias as Read-TextAsSpeech
{
  <#
      .SYNOPSIS
      Convert "Text" [string] to speech.
      .DESCRIPTION
      Convert "Text" [string] to speech.
      .EXAMPLE
      Read-TextAsSpeech "Hello World"
      # This reads at the default windows rate=1
      .EXAMPLE
      Read-TextAsSpeech "Hello World" -Rate 2
      # this reads at rate=2
  #>
  [CmdletBinding()]
  param
  (
    # Text_To_Speak is the text we need to speak
    [Parameter(Mandatory=$true, Position=0)]
    [System.String]
    $Text_To_Speak,
    
    # Rate is the Rate to speak, a decimal, given to sapiObject.Rate ; Default 1
    [Parameter(Mandatory=$false, Position=1)]
    [System.Int32]
    $Rate = 1
      )
  
  $sapiObject = new-object -ComObject Sapi.SPVoice
  $sapiObject.Rate = $Rate
  $sapiObject.Speak($Text_To_Speak) | Out-Null
}

set-alias Read-TextAsSpeech Read-TextToSpeech # alias
set-alias say Read-TextToSpeech