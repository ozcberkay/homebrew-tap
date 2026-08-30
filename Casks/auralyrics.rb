cask "auralyrics" do
  version "1.2.0"
  sha256 "f1b60c80f99d4292bc27eb488dc80ce8fe65fcf813714abffa9471464a789fec"

  url "https://github.com/auraworkshq/AuraLyrics/releases/download/v#{version}/AuraLyrics.tar.gz"
  name "AuraLyrics"
  desc "Floating, always-on-top Spotify lyrics for macOS"
  homepage "https://github.com/auraworkshq/AuraLyrics"

  depends_on macos: :sonoma

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
