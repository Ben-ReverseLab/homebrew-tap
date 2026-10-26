cask "mediatidy" do
  version "1.0.0"
  sha256 "f27bf26c6598a7f25309e54549164febc1767e9afbc52a690fa4721e99068a63"

  url "https://github.com/Ben-ReverseLab/media-tidy-mac/releases/download/v#{version}/MediaTidy-#{version}.dmg"
  name "MediaTidy"
  desc "Back up, deduplicate and sort photos and videos by date, camera and lens"
  homepage "https://github.com/Ben-ReverseLab/media-tidy-mac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "MediaTidy.app"

  zap trash: [
    "~/.mediatidy",
    "~/Library/Preferences/io.github.ben-reverselab.mediatidy.plist",
    "~/Library/Saved Application State/io.github.ben-reverselab.mediatidy.savedState",
  ]

  caveats <<~EOS
    MediaTidy is free and open source but not notarized by Apple, so macOS blocks the first start:
      macOS 15 or later: open MediaTidy, then System Settings → Privacy & Security → "Open Anyway"
      macOS 13–14:       right-click MediaTidy in Applications → Open
    For the Apple Photos library, add MediaTidy under
    System Settings → Privacy & Security → Full Disk Access (updates keep this permission).
  EOS
end
