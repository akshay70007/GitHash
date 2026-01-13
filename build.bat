@echo off
setlocal

REM ------------------------------
REM Validate argument
REM ------------------------------
if "%~1"=="" (
    echo ❌ Missing argument
    echo Usage:
    echo   build.bat Debug
    echo   build.bat Release
    echo   build.bat Clean
    exit /b 1
)

REM ------------------------------
REM CLEAN (remove all builds)
REM ------------------------------
if /I "%~1"=="Clean" (
    echo ==============================
    echo Cleaning ALL build artifacts
    echo ==============================
    if exist build (
        rmdir /s /q build
        echo Build directory removed
    ) else (
        echo Nothing to clean
    )
    exit /b 0
)

REM ------------------------------
REM BUILD TYPE
REM ------------------------------
if /I "%~1"=="Debug" (
    set BUILD_TYPE=Debug
) else if /I "%~1"=="Release" (
    set BUILD_TYPE=Release
) else (
    echo ❌ Invalid argument: %~1
    echo Usage:
    echo   build.bat Debug
    echo   build.bat Release
    echo   build.bat Clean
    exit /b 1
)

echo ==============================
echo Building GitHash
echo Build type : %BUILD_TYPE%
echo ==============================

REM ------------------------------
REM Create build directory
REM ------------------------------
if not exist build (
    mkdir build
)

cd build || exit /b 1

REM ------------------------------
REM Configure (Visual Studio / multi-config)
REM ------------------------------
cmake .. || exit /b 1

REM ------------------------------
REM Build ONLY requested config
REM ------------------------------
cmake --build . --config %BUILD_TYPE% || exit /b 1

echo ==============================
echo Build completed successfully
echo ==============================

endlocal
exit /b 0
