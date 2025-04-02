## WSL2 and VS Code Integration

You can use WSL as your full-time development environment directly from editor `VS Code` which in the microsoft
tool space has the best integration with WSL2 as it was the first to adopt support. It has better
support than say `visual studio IDE`.

### How to install

Install WSL2 first, do a update first `wsl.exe --update` then go to `microsoft store` and search
for `linux`. We recommend for beginners to pick `ubuntu`.

After you've installed VS Code, you can install the Remote WSL extension from Windows Terminal:

`code -install-extension ms-vscode-remote.remote-wsl`

### Open a WSL Project in Visual Studio Code
To open a project in VS Code from your WSL distribution, open the distribution's command line and run 'code .' to
open up the binding directly.

You can also access more VS Code Remote options through the command palette within VS Code itself. Hit "SHIFT+C'
