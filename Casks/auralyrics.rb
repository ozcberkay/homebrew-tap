cask "auralyrics" do
  version "1.2.0"
  sha256 "f1b60c80f99d4292bc27eb488dc80ce8fe65fcf813714abffa9471464a789fec"

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
