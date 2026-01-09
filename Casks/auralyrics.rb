cask "auralyrics" do
  version "1.0.0"
  sha256 "6fe844b0daf9a29a9a7bb21b6e885bfef18910e5197b56f1b0eb998bc69674fd"

  url "https://github.com/ozcberkay/AuraLyrics/releases/download/v#{version}/AuraLyrics.tar.gz"
  name "AuraLyrics"
  desc "Minimalist, Always-on-Top Spotify Lyrics for macOS"
  homepage "https://github.com/ozcberkay/AuraLyrics"

  app "AuraLyrics.app"

  zap trash: [
    "~/Library/Application Support/com.berkayozcan.AuraLyrics",
    "~/Library/Preferences/com.berkayozcan.AuraLyrics.plist",
  ]
end
