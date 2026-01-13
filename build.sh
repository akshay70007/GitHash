#!/bin/sh
set -e

# -------------------------------
# Configuration
# -------------------------------
BUILD_TYPE=${1:-Release}   # Default: Release
BUILD_DIR=build

echo "=============================="
echo " Build type : $BUILD_TYPE"
echo " Build dir  : $BUILD_DIR"
echo "=============================="

# -------------------------------
# Check tools
# -------------------------------
command -v cmake >/dev/null 2>&1 || {
    echo "ERROR: cmake not found"
    exit 1
}

command -v git >/dev/null 2>&1 || {
    echo "WARNING: git not found (commit hash will be 'unknown')"
}

# -------------------------------
# Create build directory
# -------------------------------
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# -------------------------------
# Configure
# -------------------------------
cmake .. \
    -DCMAKE_BUILD_TYPE="$BUILD_TYPE"

# -------------------------------
# Build
# -------------------------------
cmake --build . --parallel

echo "=============================="
echo " Build completed successfully"
echo "=============================="
