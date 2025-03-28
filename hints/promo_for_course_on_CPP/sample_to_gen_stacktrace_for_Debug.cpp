#include <windows.h>
#include <dbghelp.h>
#include <iostream>
#include <fstream>
#include <vector>

#pragma comment(lib, "dbghelp.lib")

// place to write the stack trace: (unix/linux has /tmp windows might but might have to use /temp there)
#define STACK_TRACE_FILE "C:/tmp/stack.txt"
#define REG_PATH "SOFTWARE\\MyApp\\StackTrace"

// Function to get stack trace
std::string GetStackTrace() {
    HANDLE process = GetCurrentProcess();
    SymInitialize(process, NULL, TRUE);

    void* stack[100];
    unsigned short frames = CaptureStackBackTrace(0, 100, stack, NULL);

    SYMBOL_INFO* symbol = (SYMBOL_INFO*)malloc(sizeof(SYMBOL_INFO) + 256 * sizeof(char));
    symbol->MaxNameLen = 255;
    symbol->SizeOfStruct = sizeof(SYMBOL_INFO);

    std::ostringstream trace;
    for (unsigned short i = 0; i < frames; i++) {
        SymFromAddr(process, (DWORD64)(stack[i]), 0, symbol);
        trace << "Frame " << i << ": " << symbol->Name << " at 0x" << symbol->Address << "\n";
    }

    free(symbol);
    return trace.str();
}

// Function to write stack trace to file
void WriteStackTraceToFile(const std::string& stackTrace) {
    std::ofstream outFile(STACK_TRACE_FILE);
    if (outFile) {
        outFile << stackTrace;
        outFile.close();
    }
}

// Function to store stack trace in the registry
void WriteStackTraceToRegistry(const std::string& stackTrace) {
    HKEY hKey;
    if (RegCreateKeyEx(HKEY_CURRENT_USER, REG_PATH, 0, NULL, 0, KEY_WRITE, NULL, &hKey, NULL) == ERROR_SUCCESS) {
        RegSetValueEx(hKey, "LastCrash", 0, REG_SZ, (const BYTE*)stackTrace.c_str(), stackTrace.size() + 1);
        RegCloseKey(hKey);
    }
}

void FunctionC() {
    throw std::runtime_error("Simulated Exception");
}

void FunctionB() {
    FunctionC();
}

void FunctionA() {
    FunctionB();
}

int main() {
    try {
        FunctionA();
    } catch (const std::exception& e) {
        std::string stackTrace = GetStackTrace();
        std::cout << "Exception: " << e.what() << "\nStack Trace:\n" << stackTrace;
        WriteStackTraceToFile(stackTrace);
        WriteStackTraceToRegistry(stackTrace);
    }

    return 0;
}

//
// Key Features:
// Stack Trace Capture: Uses CaptureStackBackTrace() and SymFromAddr().
// File Logging: Writes stack trace to C:/tmp/stack.txt.
// Registry Storage: Saves stack trace under HKEY_CURRENT_USER\SOFTWARE\MyApp\StackTrace.
// You may need to run the program as an administrator to write to the registry.
