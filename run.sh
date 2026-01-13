@echo off
setlocal enabledelayedexpansion

echo ==============================
echo Running GitHash
echo ==============================

REM ------------------------------
REM Validate argument
REM ------------------------------
if "%~1"=="" (
    echo ❌ Missing git command
    echo Usage:
    echo   run.bat "git rev-parse HEAD"
    exit /b 1
)

REM ------------------------------
REM Execute git command
REM ------------------------------
for /f "delims=" %%i in ('%~1') do set GIT_HASH=%%i

REM ------------------------------
REM Detect executable (Release preferred)
REM ------------------------------
set EXE=

if exist build\GitHash\Release\GitHash.exe (
    set EXE=build\GitHash\Release\GitHash.exe
) else if exist build\GitHash\Debug\GitHash.exe (
    set EXE=build\GitHash\Debug\GitHash.exe
) else (
    echo ❌ No executable found.
    echo Run build.bat Debug or build.bat Release first.
    exit /b 1
)

echo Git Commit Hash:
echo %GIT_HASH%
echo.

REM ------------------------------
REM Run
REM ------------------------------
"%EXE%" --commit=%GIT_HASH%

endlocal
