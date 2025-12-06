# Icon setup guide

This guide explains how to add a custom Gemini icon to your macOS app.

## Requirements

For macOS, you need an `.icns` file (not `.png`). The `.icns` format contains multiple icon sizes in a single file.

## Option 1: Use the helper script (easiest)

1. **Prepare your icon image:**

   - Create or download a Gemini icon image
   - Recommended size: 1024x1024 pixels
   - Save it as `icon.png` in the project root

2. **Run the conversion script:**

   ```bash
   ./scripts/convert-icon.sh
   ```

   This will automatically create `icon.icns` from your `icon.png` file.

## Option 2: Create .icns manually

1. **Prepare your icon image:**

   - Create or download a Gemini icon image
   - Recommended size: 1024x1024 pixels
   - Save it as `icon.png` in the project root

2. **Convert PNG to ICNS using macOS tools:**

   ```bash
   # Create an iconset directory
   mkdir icon.iconset

   # Generate all required sizes from your source image
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
   ```

3. **Verify the icon file:**
   - You should now have `icon.icns` in your project root
   - The build script will automatically use it

## Option 3: Use an online converter

1. Go to an online ICNS converter (e.g., https://cloudconvert.com/png-to-icns)
2. Upload your PNG icon
3. Download the converted `.icns` file
4. Save it as `icon.icns` in the project root

## Option 4: Use iconutil with a custom script

Create a simple script to automate the conversion:

```bash
#!/bin/bash
# convert-icon.sh

if [ ! -f "icon.png" ]; then
    echo "Error: icon.png not found"
    exit 1
fi

mkdir -p icon.iconset

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

iconutil -c icns icon.iconset
rm -rf icon.iconset

echo "✅ icon.icns created successfully!"
```

## Setting the app icon in code

You can also set the icon programmatically in `main.js`:

```javascript
const { app, nativeImage } = require("electron");
const path = require("path");

// Set the app icon
const iconPath = path.join(__dirname, "icon.icns");
app.dock.setIcon(iconPath);
```

## Testing

After adding the icon:

1. Rebuild the app: `npm run build`
2. Check the built app: `open dist/Gemini-darwin-x64/Gemini.app`
3. Verify the icon appears in:
   - The Dock
   - Finder
   - Applications folder
   - Mission Control

## Notes

- The `.icns` file should be committed to the repository
- Make sure `icon.icns` is not in `.gitignore`
- The icon will be embedded in the `.app` bundle during the build process
