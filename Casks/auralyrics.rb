cask "auralyrics" do
  version "1.1.1"
  sha256 "bc03317f6405ee27230bfbb58bfac63c799bab9fe9586aadb889e07e116b2378"

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
