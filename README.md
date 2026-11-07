# homebrew-tap

Homebrew tap for my Mac apps.

| App | Install |
|-----|---------|
| [Valkey.app](https://valkey.app/) | `brew install --cask alhassanaraouf/tap/valkey` |
| [NotesFloat](https://github.com/alhassanaraouf/NotesFloat) (macOS 26+) | `brew install --cask alhassanaraouf/tap/notesfloat` |

Neither app is notarized yet, so macOS may block the first launch. Allow it once with `xattr -dr com.apple.quarantine /Applications/<App>.app` (Valkey.app: [install steps](https://valkey.app/#install)).
