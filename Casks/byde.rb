cask "byde" do
  version "1.1"
  sha256 "fcef8287fa7cbadce9d53781595962dc8fd781b28b05246fa66a6991de419fc4"

  url "https://github.com/joshuakaufman/byde/releases/download/v#{version}/Byde-#{version}.dmg"
  name "Byde"
  desc "Menu bar app that nudges you to meditate once a day"
  homepage "https://github.com/joshuakaufman/byde"

  depends_on macos: :sonoma

  app "Byde.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Byde.app"]
  end

  uninstall quit: "org.joshuakaufman.byde"

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
