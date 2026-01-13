#!/usr/bin/env bash
set -e

# ------------------------------
# Validate argument
# ------------------------------
if [ -z "$1" ]; then
    echo "❌ Missing argument"
    echo "Usage:"
    echo "  ./build.sh Debug"
    echo "  ./build.sh Release"
    echo "  ./build.sh Clean"
    exit 1
fi

# ------------------------------
# CLEAN (removes all builds)
# ------------------------------
if [[ "$1" == "Clean" ]]; then
    echo "=============================="
    echo "Cleaning ALL build artifacts"
    echo "=============================="

    rm -rf build
    echo "Build directory removed"
    exit 0
fi

# ------------------------------
# BUILD TYPE
# ------------------------------
if [[ "$1" == "Debug" || "$1" == "Release" ]]; then
    BUILD_TYPE=$1
else
    echo "❌ Invalid argument: $1"
    echo "Usage:"
    echo "  ./build.sh Debug"
    echo "  ./build.sh Release"
    echo "  ./build.sh Clean"
    exit 1
fi

echo "=============================="
echo "Building GitHash"
echo "Build type : $BUILD_TYPE"
echo "=============================="

# ------------------------------
# Create build directory
# ------------------------------
mkdir -p build
cd build

# ------------------------------
# Configure (single-config safe)
# ------------------------------
cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE ..

# ------------------------------
# Build ONLY requested config
# ------------------------------
cmake --build .

echo "=============================="
echo "Build completed successfully"
echo "=============================="
