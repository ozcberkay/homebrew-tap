cask "auralyrics" do
  version "1.0.0"
  sha256 "03f49136ff2dcceba442328c3bb479201b76861246413f82850ec5c43e117ea3"

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
