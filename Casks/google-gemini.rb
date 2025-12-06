cask "google-gemini" do
  version "1.0.1"
  sha256 :no_check

  url "https://github.com/adborroto/homebrew-gemeni-app/releases/download/v#{version}/Gemini-darwin-x64.zip"
  name "Gemini"
  desc "A lightweight macOS app that brings Google Gemini to your desktop"
  homepage "https://github.com/adborroto/homebrew-gemeni-app"

  app "Gemini-darwin-x64/Gemini.app"

  zap trash: [
    "~/Library/Application Support/Gemini",
    "~/Library/Preferences/com.electron.gemini.plist",
    "~/Library/Saved Application State/com.electron.gemini.savedState",
  ]
end

