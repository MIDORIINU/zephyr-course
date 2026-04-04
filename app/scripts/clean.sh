#!/bin/bash

BOARD=$1
PROJECT_DIR=$2

BUILD_DIR="$PROJECT_DIR/build-$BOARD"

echo "======================================"
echo "Cleaning build directory: $BUILD_DIR"
echo "======================================"

if [ -d "$BUILD_DIR" ]; then
  rm -rf "$BUILD_DIR"
  echo "Deleted $BUILD_DIR"
else
  echo "Nothing to clean"
fi
