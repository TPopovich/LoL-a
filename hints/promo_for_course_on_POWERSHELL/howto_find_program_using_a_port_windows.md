## how to find the program with an open port on windows

```
Step-by-Step: Find What’s Listening on a Port
Let’s say you're trying to see what's listening on port 8080.

* 1. Use netstat with PowerShell to find the PID
 In powershell:

netstat -aon | Select-String ":8080"

-a shows all connections and listening ports
-o includes the PID (process ID)

:8080 filters the output for port 8080

You’ll get output like:

nginx
  TCP    0.0.0.0:8080     0.0.0.0:0     LISTENING     1234

This tells you:

The port is open and listening
The PID (process ID) is 1234

* 2. Use Get-Process to find the program behind the PID
in powershell

Get-Process -Id 1234

```
