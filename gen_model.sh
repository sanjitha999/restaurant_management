#!/bin/bash

echo "Running build_runner..."
flutter packages pub run build_runner build --delete-conflicting-outputs
