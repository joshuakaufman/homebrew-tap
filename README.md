# homebrew-tap

Homebrew tap for [Byde](https://github.com/joshuakaufman/byde), a menu bar app that gives you a gentle nudge to meditate, once a day, inside a window you choose.

## Install

```
brew install --cask joshuakaufman/tap/byde
```

## Why the cask clears the quarantine flag

Byde is not notarised by Apple. Without notarisation, macOS blocks a downloaded app the first time you open it, and you have to approve it in System Settings. After installing, the cask runs `xattr -dr com.apple.quarantine` on `Byde.app` so it opens normally.

If you would rather not do that, download the DMG from the [Byde releases page](https://github.com/joshuakaufman/byde/releases) instead. The source is public, so you can also build it yourself.

## Uninstall

```
brew uninstall --cask byde
```

To also remove Byde's saved settings and log, use `brew uninstall --zap --cask byde`.

## Licence

MIT. See [LICENSE](LICENSE).
