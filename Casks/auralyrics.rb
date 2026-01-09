cask "auralyrics" do
  version "1.0.1"
  sha256 "03f49136ff2dcceba442328c3bb479201b76861246413f82850ec5c43e117ea3"

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

