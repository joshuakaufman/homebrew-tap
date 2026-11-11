cask "byde" do
  version "1.0"
  sha256 "bcb91d371bec7a10ee9561090ead89e5dc39f10ddd1e11193f30340e07f56c18"

  url "https://github.com/joshuakaufman/byde/releases/download/v#{version}/Byde-#{version}.dmg"
  name "Byde"
  desc "Menu bar app that nudges you to meditate once a day"
  homepage "https://github.com/joshuakaufman/byde"

  depends_on macos: :sonoma

  app "Byde.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Byde.app"]
  end

  zap trash: [
    "~/Library/Application Support/Byde",
    "~/Library/Preferences/org.joshuakaufman.byde.plist",
  ]

  caveats <<~EOS
    Byde is not notarised by Apple. This cask removed the macOS quarantine flag
    from Byde.app so that it opens without a warning. The source is public, so you
    can read it or build it yourself: https://github.com/joshuakaufman/byde
  EOS
end
