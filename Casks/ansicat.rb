cask "ansicat" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux-#{arch}"
  url_end = on_system_conditional macos: "dmg", linux: "AppImage"

  version "0.4.2"
  sha256 arm:          "1225c21b54a9287e5c2938bad47e1db6d1a600de85fb05cd6384fb53d3a730bf",
         intel:        "1225c21b54a9287e5c2938bad47e1db6d1a600de85fb05cd6384fb53d3a730bf",
         arm64_linux:  "5154b7da061097aa99a0787243fba0fc7aee2f8c0c6a89c7b8744e945d25d35d",
         x86_64_linux: "23086246e87d8ddf8facf4e34bea762bc8de7821ffbe6f6eb45c32e874bdaa67"

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
