cask "auralyrics" do
  version "1.0.1"
  sha256 "9567a940a8981cc821ebb5f4a66f50d884805c85451c010f98f9d0ae4f954797"

  url "https://github.com/ozcberkay/AuraLyrics/releases/download/v#{version}/AuraLyrics.tar.gz"
  name "AuraLyrics"
  desc "Minimalist, Always-on-Top Spotify Lyrics for macOS"
  homepage "https://github.com/ozcberkay/AuraLyrics"

  app "AuraLyrics.app"

  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/AuraLyrics.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.berkayozcan.AuraLyrics",
    "~/Library/Preferences/com.berkayozcan.AuraLyrics.plist",
  ]
end
