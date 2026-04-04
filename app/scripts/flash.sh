#!/bin/bash

BOARD=$1
PROJECT_DIR=$2

WEST="$HOME/zephyr-course/.venv/bin/west"

BUILD_DIR="$PROJECT_DIR/build-$BOARD"

echo "======================================"
echo "Flashing board: $BOARD"
echo "Build dir: $BUILD_DIR"
echo "======================================"

if [ ! -d "$BUILD_DIR" ]; then
  echo "Build directory not found, compiling first..."

  "$PROJECT_DIR/scripts/build.sh" "$BOARD" "$PROJECT_DIR" "incremental"

  if [ $? -ne 0 ]; then
    echo "Build failed, aborting flash."
    exit 1
  fi
fi

cd "$PROJECT_DIR"

# 🔥 KEY FIX: prevent west from trying to rebuild again
$WEST flash -d "$BUILD_DIR" --no-rebuild