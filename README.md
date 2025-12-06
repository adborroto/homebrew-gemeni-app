# Gemini macOS App

A lightweight macOS app that brings Google Gemini to your desktop. Access Gemini instantly with a beautiful, always-on-top window that you can toggle with a keyboard shortcut.

## Features

- **Always on top** - Keep Gemini accessible while working in other apps
- **Keyboard shortcut** - Toggle the window with `CMD + Shift + Space`
- **Auto-hide** - Window automatically hides when it loses focus
- **Native macOS design** - Frameless window with vibrancy effect
- **Lightweight** - Minimal Electron wrapper around the Gemini web app

## Installation

### Homebrew (recommended)

```bash
brew tap adborroto/gemeni-app
brew install --cask google-gemini
```

### Manual installation

#### Prerequisites

- Node.js (v14 or higher)
- npm or yarn

#### Setup

1. Clone the repository:

```bash
git clone https://github.com/adborroto/homebrew-gemeni-app.git
cd homebrew-gemeni-app
```

2. Install dependencies:

```bash
npm install
```

3. Run the app:

```bash
npm start
```

## Building

To build a distributable macOS app:

```bash
npm run build
```

To build and package for distribution (creates a ZIP file):

```bash
npm run build:dist
```

The built app will be in the `dist/` directory.

**Note:** You'll need an `icon.icns` file in the project root for the build to include a custom icon. See [ICON_SETUP.md](ICON_SETUP.md) for instructions on creating the icon file.

For Homebrew distribution setup, see [HOMEBREW_SETUP.md](HOMEBREW_SETUP.md).

## Usage

- **Toggle window**: Press `CMD + Shift + Space` to show/hide the Gemini window
- **Auto-hide**: The window automatically hides when you click outside of it
- **Always accessible**: The window stays on top of other applications

## Development

The app uses Electron to wrap the Google Gemini web app (`https://gemini.google.com/app`) in a native macOS window with custom behavior.

### Project structure

- `main.js` - Main Electron process with window management and shortcuts
- `index.html` - Webview container for Gemini
- `package.json` - Project configuration and dependencies

## License

This project is licensed under the GPL-3.0 License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
