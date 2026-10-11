cask "auralyrics" do
  version "1.3.0"
  sha256 "20a36d59a310b3bc703114d0b85e0c035a8baa0d532786791c27f2b74568c3ca"

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
