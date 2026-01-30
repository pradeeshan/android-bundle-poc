#!/bin/bash
# Direct path to Homebrew Gradle for Apple Silicon Macs
GRADLE_PATH="/opt/homebrew/bin/gradle"

if [ -f "$GRADLE_PATH" ]; then
    echo "Using system Gradle at $GRADLE_PATH"
    $GRADLE_PATH "$@"
elif command -v gradle >/dev/null 2>&1; then
    echo "Using system Gradle from PATH..."
    gradle "$@"
else
    echo "Error: Gradle not found at $GRADLE_PATH or in PATH."
    exit 1
fi
