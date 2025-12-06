#!/bin/bash

# Script to set up Homebrew tap repository
# This creates a minimal tap repo that syncs the cask from the main repo

TAP_REPO="homebrew-gemeni-app"
MAIN_REPO="gemeni-app"
GITHUB_USER="adborroto"

echo "Setting up Homebrew tap repository..."

# Check if tap repo exists locally
if [ -d "../$TAP_REPO" ]; then
    echo "Tap repository already exists locally."
    cd "../$TAP_REPO"
else
    # Create the tap repo directory
    mkdir -p "../$TAP_REPO"
    cd "../$TAP_REPO"
    git init
    git remote add origin "https://github.com/$GITHUB_USER/$TAP_REPO.git" 2>/dev/null || true
fi

# Create Casks directory
mkdir -p Casks

# Copy cask file
cp "../$MAIN_REPO/Casks/gemini.rb" Casks/

# Commit and push
git add Casks/gemini.rb
git commit -m "sync cask from main repo" || echo "No changes to commit"
git push origin main || echo "Push failed - you may need to create the repository on GitHub first"

echo ""
echo "✅ Tap repository setup complete!"
echo ""
echo "Next steps:"
echo "1. Create a repository named '$TAP_REPO' on GitHub: https://github.com/new"
echo "2. Run this script again to push the cask file"
echo "3. Users can then install with: brew tap $GITHUB_USER/$TAP_REPO && brew install --cask gemini"

