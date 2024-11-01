#!/bin/bash

# Clean the Flutter project
echo "Running flutter clean..."
flutter clean

# Automatically answer 'y' for flutter pub cache clean
echo "Running flutter pub cache clean..."
yes | flutter pub cache clean

# Get dependencies
echo "Running flutter pub get..."
flutter pub get

echo "All done!"
