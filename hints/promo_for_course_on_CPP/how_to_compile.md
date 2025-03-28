# How to compile and run

`Gcc/G++` on linux like systems can compile.  The microsoft c++ compile
env can also compile it.

```
To compile the C++ program on Windows using MinGW (g++) or MSVC (cl.exe), follow these steps:

Using MinGW (g++)
1. Install MinGW
If you don’t have MinGW installed, download and install it from:
👉 MinGW-w64 Download

Make sure the bin directory (e.g., C:\mingw-w64\bin) is added to your system PATH.

2. Compile the Program
Open Command Prompt (cmd) and navigate to the directory where the C++ file is saved.

Run the following command:

sh
Copy
Edit
g++ -o stack_trace.exe stack_trace.cpp -g -lDbghelp
-o stack_trace.exe: Output executable file.
-g: Enables debugging symbols.
-lDbghelp: Links against the Dbghelp library, required for stack tracing.
3. Run the Executable
sh
Copy
Edit
stack_trace.exe
Using Microsoft Visual C++ (MSVC)
1. Open Developer Command Prompt
If you have Visual Studio installed, open "x64 Native Tools Command Prompt for VS" from the Start menu.

2. Compile the Program
Run:

sh
Copy
Edit
cl /EHsc /Zi stack_trace.cpp /link dbghelp.lib
/EHsc: Enables exception handling.
/Zi: Generates debugging information.
/link dbghelp.lib: Links against dbghelp.lib.
3. Run the Executable
sh
Copy
Edit
stack_trace.exe
Troubleshooting
dbghelp.h: No such file or directory
Ensure you have installed Windows SDK and added it to the INCLUDE and LIB environment variables.

Permission denied writing to registry
Run stack_trace.exe as Administrator.
```
