cask "ansicat" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux-#{arch}"
  url_end = on_system_conditional macos: "dmg", linux: "AppImage"

  version "0.2.0"
  sha256 arm:          "5889b66b8654f5d8b5294e4090bc632f3c5f0c5cab25a22359800bb7a07d98f9",
         intel:        "5889b66b8654f5d8b5294e4090bc632f3c5f0c5cab25a22359800bb7a07d98f9",
         arm64_linux:  "0975d56c3b6051d52a889dc2a95223790ae968195c9558acf0ea6a049748553b",
         x86_64_linux: "c9e43b675d4f844b1dc05088fbb639256581895d6dc283b636850d2a65932c53"

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
