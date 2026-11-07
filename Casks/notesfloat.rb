cask "notesfloat" do
  version "0.5.1"
  sha256 "6ecfc8cf10853bae73faf5105ab0e1755e378001052029019fc8d72f0187d5ee"

  url "https://github.com/alhassanaraouf/NotesFloat/releases/download/v#{version}/NotesFloat-#{version}.dmg"
  name "NotesFloat"
  desc "Floating, Raycast Notes-style window for Apple Notes"
  homepage "https://github.com/alhassanaraouf/NotesFloat"

  livecheck do
    url "https://github.com/alhassanaraouf/NotesFloat/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :tahoe

  app "NotesFloat.app"

  zap trash: [
    "~/Library/Caches/me.raoufs.alhassan.NotesFloat",
    "~/Library/Preferences/app.notesfloat.NotesFloat.plist",
    "~/Library/Preferences/local.notesfloat.plist",
    "~/Library/Preferences/me.raoufs.alhassan.NotesFloat.plist",
  ]

  caveats <<~EOS
    NotesFloat isn't notarized yet, so macOS may block the first launch.
    Allow it once with:
      xattr -dr com.apple.quarantine /Applications/NotesFloat.app
  EOS
end
