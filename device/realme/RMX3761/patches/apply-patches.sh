#!/bin/bash

DEVICE_PATH="device/realme/RMX3761"
KERNEL_PATH="kernel/realme/RMX3761"

# Apply kernel patches
echo "Applying kernel patches..."
cd "$KERNEL_PATH" || exit 1
for patch in "../../$DEVICE_PATH"/patches/kernel/*.patch; do
    git am "$patch"
done

cd - || exit 1
