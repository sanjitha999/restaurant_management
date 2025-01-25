#!/bin/bash

# Script to build Flutter APK with version in filename

# Function to display usage
usage() {
  echo "Usage: $0 [debug|profile|release]"
  echo "Build a Flutter app as an APK with version information in the filename."
  echo "Arguments:"
  echo "  debug     Build a debug APK"
  echo "  profile   Build a profile APK"
  echo "  release   Build a release APK"
  exit 1
#  Use sh build_apk.sh <build_var>
# Eg: sh build_apk.sh release
# Note the version is auto fetched from the pubspec.yaml file
}

# Check if Flutter is installed
if ! [ -x "$(command -v flutter)" ]; then
  echo "Error: Flutter is not installed. Please install Flutter before running this script."
  exit 1
fi

# Validate input arguments
if [ $# -ne 1 ]; then
  usage
fi

BUILD_TYPE=$1

if [[ "$BUILD_TYPE" != "debug" && "$BUILD_TYPE" != "profile" && "$BUILD_TYPE" != "release" ]]; then
  usage
fi

# Clean previous builds
echo "Cleaning previous builds..."
flutter clean

# Get dependencies
echo "Fetching dependencies..."
flutter pub get

# Extract version name and code from pubspec.yaml
VERSION_NAME=$(grep '^version:' pubspec.yaml | awk '{print $2}' | cut -d '+' -f 1)
VERSION_CODE=$(grep '^version:' pubspec.yaml | awk '{print $2}' | cut -d '+' -f 2)

if [ -z "$VERSION_NAME" ] || [ -z "$VERSION_CODE" ]; then
  echo "Error: Unable to determine version from pubspec.yaml."
  exit 1
fi

# Build APK
echo "Building $BUILD_TYPE APK..."
flutter build apk --$BUILD_TYPE

# Check if the build was successful
if [ $? -eq 0 ]; then
  # Rename the APK with version information
  OUTPUT_DIR="build/app/outputs/flutter-apk"
  ORIGINAL_APK="$OUTPUT_DIR/app-$BUILD_TYPE.apk"
  RENAMED_APK="$OUTPUT_DIR/app-v${VERSION_NAME}+${VERSION_CODE}-$BUILD_TYPE.apk"

  if [ -f "$ORIGINAL_APK" ]; then
    mv "$ORIGINAL_APK" "$RENAMED_APK"
    echo "Flutter $BUILD_TYPE APK built successfully."
    echo "APK saved as: $RENAMED_APK"
  else
    echo "Error: APK not found after build."
    exit 1
  fi
else
  echo "Error: Failed to build the Flutter APK."
  exit 1
fi
