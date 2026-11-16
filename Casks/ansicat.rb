cask "ansicat" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux-#{arch}"
  url_end = on_system_conditional macos: "dmg", linux: "AppImage"

  version "0.3.0"
  sha256 arm:          "88b21a40729fd01bb4d98c519d3f36946faf2adcf72257d36d4fc6b7ff31a7e3",
         intel:        "88b21a40729fd01bb4d98c519d3f36946faf2adcf72257d36d4fc6b7ff31a7e3",
         arm64_linux:  "9cb00ddf68edb59720d4840555ab0c496ba09a3ab0a0391148066a2d7c9d5e84",
         x86_64_linux: "ee9c332898aa0ba3b0c77158293f2e99772c8885a1efa0732921d785d338c442"

  on_macos do
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
  on_linux do
    app_image "ansi.cat-#{version}-linux-#{arch}.AppImage", target: "ansi.cat.AppImage"
    binary "squashfs-root/usr/lib/ansicat/ansicat"

    preflight_steps do
      set_permissions "ansi.cat-#{version}-linux-#{arch}.AppImage", "0755"
      run "ansi.cat-#{version}-linux-#{arch}.AppImage",
          args:  ["--appimage-extract", "usr/lib/ansicat/*"],
          base:  :staged_path,
          chdir: "."
    end

    zap trash: [
      "~/.config/cat.ansi.viewer",
      "~/.local/bin/ansicat",
      "~/.local/share/icons/hicolor/*/apps/cat.ansi.viewer.png",
      "~/.local/share/mime/packages/cat.ansi.viewer.xml",
    ]
  end

  url "https://github.com/doom-fish/ansicat-releases/releases/download/v#{version}/ansi.cat-#{version}-#{os}.#{url_end}"
  name "ansi.cat"
  desc "Read-only viewer for text art, Markdown, code and patches"
  homepage "https://ansi.cat/"

  livecheck do
    url :url
    strategy :github_latest
  end
end
