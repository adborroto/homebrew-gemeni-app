# Homebrew setup guide

This guide explains how to set up your app for Homebrew distribution. Everything is kept in the same repository.

## Step 1: Build and release

1. Build the distributable:

```bash
npm run build:dist
```

2. Create a GitHub release:
   - Go to https://github.com/adborroto/gemeni-app/releases
   - Click "Create a new release"
   - Tag version: `v1.0.0` (match the version in the cask)
   - Release title: `v1.0.0`
   - Upload the `dist/Gemini-darwin-x64.zip` file

## Step 2: Update the cask (if needed)

The cask file is located at `Casks/gemini.rb` in this repository. Update it when:

- You release a new version (update `version` and `url`)
- You need to change the SHA256 checksum (run `shasum -a 256 Gemini-darwin-x64.zip` after building)

## Step 3: Installation

Users can install your app via Homebrew directly from this repository:

```bash
brew install --cask adborroto/gemeni-app/gemini
```

Or they can tap the repo first:

```bash
brew tap adborroto/gemeni-app
brew install --cask gemini
```

## Updating the cask for new releases

1. Build the new version: `npm run build:dist`
2. Create a new GitHub release with the zip file
3. Update `Casks/gemini.rb` in this repository:
   - Change `version` to the new version
   - Update `url` to point to the new release
   - Calculate new SHA256: `shasum -a 256 dist/Gemini-darwin-x64.zip`
   - Update `sha256` in the cask file (or keep `:no_check` for now)
4. Commit and push the updated cask to this repository

## Notes

- The cask uses `sha256 :no_check` for now, which skips checksum verification. For production, you should calculate and include the actual SHA256.
- Make sure the app name in the cask matches the actual `.app` bundle name.
- Test the installation locally before publishing: `brew install --cask --build-from-source ./Casks/gemini.rb`
