cask "auralyrics" do
  version "1.1.0"
  sha256 "2eb8d9f159d2bd6529d941863e4e571b9b9bc81742d2c13f8abea278de769c81"

  url "https://github.com/auraworkshq/AuraLyrics/releases/download/v#{version}/AuraLyrics.tar.gz"
  name "AuraLyrics"
  desc "Floating, always-on-top Spotify lyrics for macOS"
  homepage "https://github.com/auraworkshq/AuraLyrics"

  depends_on macos: ">= :sonoma"

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
