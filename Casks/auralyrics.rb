cask "auralyrics" do
  version "1.0.4"
  sha256 "caffd5f86e3511c7c957ff0ef9974643b6d0af4cb268decb3d435c4cb361c294"

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
