@echo off
setlocal enabledelayedexpansion

echo ==============================
echo Running GitHash
echo ==============================

REM ---- Validate input ----
if "%~1"=="" (
    echo ❌ No command provided
    echo Usage: run.bat "git rev-parse HEAD"
    exit /b 1
)

REM ---- Execute command passed as argument and capture output ----
for /f "delims=" %%i in ('%~1') do set GIT_HASH=%%i

REM ---- Path to executable ----
set EXE=build\GitHash\Debug\GitHash.exe

if not exist "%EXE%" (
    echo ❌ Executable not found. Run build.bat first.
    exit /b 1
)

echo Git Commit Hash:
echo %GIT_HASH%
echo.

REM ---- Run program with commit argument ----
"%EXE%" --commit=%GIT_HASH%

endlocal
