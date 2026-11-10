cask "ansicat" do
  version "0.1.0"
  sha256 "5eea4150847bda14f0dd33c08872a7d5fe4faf530a8398786b576eb95ae6c9c7"

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
