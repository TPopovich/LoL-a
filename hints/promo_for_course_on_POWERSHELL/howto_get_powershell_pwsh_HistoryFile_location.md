## History File Location for Powershell

HOWTO: Find the History File filepath to copy it?

A: it is stored in a file, which is stored under the path shown by:
```
 (Get-PSReadlineOption).HistorySavePath
```

See the source code for Powershell History: [powershell history github page](https://github.com/PowerShell/PSReadLine)
