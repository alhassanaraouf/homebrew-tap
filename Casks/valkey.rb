cask "valkey" do
  version "1.4.2"
  sha256 "f7bc0daa477ffff60519448ddea9feb595525a0bcb5d0cdf8cacf93bae002292"

  url "https://github.com/alhassanaraouf/Valkey.app/releases/download/app-v#{version}/Valkey.dmg"
  name "Valkey.app"
  desc "Run local Valkey servers from the menu bar"
  homepage "https://valkey.app/"

  livecheck do
    url "https://valkey.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :ventura

  app "Valkey.app"

  zap trash: [
    "~/Library/Application Support/Valkey",
    "~/Library/Caches/app.valkey.Valkey",
    "~/Library/Preferences/app.valkey.Valkey.plist",
  ]

  caveats <<~EOS
    Valkey.app isn't notarized yet, so macOS may say it is damaged on first launch.
    Allow it once with:
      xattr -dr com.apple.quarantine /Applications/Valkey.app
  EOS
end
