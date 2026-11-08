cask "valkey" do
  version "1.5"
  sha256 "765f1e289fea44cf975ed33ec02ae0658ff48b49de04176b68fed1ce512a5635"

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
