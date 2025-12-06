#!/bin/bash

# Convert PNG icon to ICNS format for macOS

if [ ! -f "icon.png" ]; then
    echo "Error: icon.png not found in project root"
    echo "Please add a PNG icon file named 'icon.png' first"
    exit 1
fi

echo "Converting icon.png to icon.icns..."

# Create iconset directory
mkdir -p icon.iconset

# Generate all required icon sizes
sips -z 16 16     icon.png --out icon.iconset/icon_16x16.png
sips -z 32 32     icon.png --out icon.iconset/icon_16x16@2x.png
sips -z 32 32     icon.png --out icon.iconset/icon_32x32.png
sips -z 64 64     icon.png --out icon.iconset/icon_32x32@2x.png
sips -z 128 128   icon.png --out icon.iconset/icon_128x128.png
sips -z 256 256   icon.png --out icon.iconset/icon_128x128@2x.png
sips -z 256 256   icon.png --out icon.iconset/icon_256x256.png
sips -z 512 512   icon.png --out icon.iconset/icon_256x256@2x.png
sips -z 512 512   icon.png --out icon.iconset/icon_512x512.png
sips -z 1024 1024 icon.png --out icon.iconset/icon_512x512@2x.png

# Convert iconset to icns
iconutil -c icns icon.iconset

# Clean up
rm -rf icon.iconset

if [ -f "icon.icns" ]; then
    echo "✅ icon.icns created successfully!"
else
    echo "❌ Failed to create icon.icns"
    exit 1
fi

