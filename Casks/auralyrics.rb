cask "auralyrics" do
  version "1.3.1"
  sha256 "d211d148f8971271338784bebc67c3366e4543394e7277d9df36c77f4c826508"

  url "https://github.com/ozcberkay/AuraLyrics/releases/download/v#{version}/AuraLyrics.tar.gz"
  name "AuraLyrics"
  desc "Floating, always-on-top synced lyrics for Spotify"
  homepage "https://github.com/ozcberkay/AuraLyrics"

  depends_on macos: :sonoma

  app "AuraLyrics.app"

  # Releases are signed ad-hoc, not notarized, so Gatekeeper would block the
  # first launch. Clearing the quarantine flag lets the app open straight away.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/AuraLyrics.app"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/com.berkayozcan.AuraLyrics",
    "~/Library/Preferences/com.berkayozcan.AuraLyrics.plist",
  ]
end
