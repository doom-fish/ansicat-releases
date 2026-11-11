cask "ansicat" do
  version "0.2.0"
  sha256 "5889b66b8654f5d8b5294e4090bc632f3c5f0c5cab25a22359800bb7a07d98f9"

  url "https://github.com/doom-fish/ansicat-releases/releases/download/v#{version}/ansi.cat-#{version}-macos.dmg"
  name "ansi.cat"
  desc "Read-only viewer for text art, Markdown, code and patches"
  homepage "https://ansi.cat/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "ansi.cat.app"
  binary "#{appdir}/ansi.cat.app/Contents/MacOS/ansicat"

  uninstall quit: "cat.ansi.viewer"

  zap trash: [
    "~/Library/Application Support/cat.ansi.viewer",
    "~/Library/Caches/cat.ansi.viewer",
    "~/Library/Containers/cat.ansi.viewer.preview",
    "~/Library/Containers/cat.ansi.viewer.thumbnail",
    "~/Library/HTTPStorages/cat.ansi.viewer",
    "~/Library/Preferences/cat.ansi.viewer.plist",
    "~/Library/Saved Application State/cat.ansi.viewer.savedState",
  ]
end
