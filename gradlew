#!/bin/bash
# Check if Gradle is installed on the Mac
if command -v gradle >/dev/null 2>&1; then
    echo "Using system Gradle to build..."
    gradle "$@"
else
    echo "Error: Gradle is not installed. Run 'brew install gradle' on your Mac terminal."
    exit 1
fi
