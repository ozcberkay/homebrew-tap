cask "auralyrics" do
  version "1.0.3"
  sha256 "c18c8bbdfa9ad5060e63b9befe10a7fe89184f646d5847b64eb322f9f44be5df"

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
