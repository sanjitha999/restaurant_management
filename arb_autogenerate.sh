#!/bin/bash

# Directory containing .arb files
ARB_DIR="./lib/l10n"  # Change this path if your .arb files are located elsewhere

# Watch for changes in .arb files
fswatch -o "$ARB_DIR"/*.arb | while read; do
  echo "Change detected in .arb files. Running intl_utils generate..."
  flutter pub run intl_utils:generate
done
