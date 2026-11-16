cask "ansicat" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux-#{arch}"
  url_end = on_system_conditional macos: "dmg", linux: "AppImage"

  version "0.4.0"
  sha256 arm:          "cd7ce4c7b01761a40728ff2aa6fa98cc880020c86f4b026ef57fa2cbc5356265",
         intel:        "cd7ce4c7b01761a40728ff2aa6fa98cc880020c86f4b026ef57fa2cbc5356265",
         arm64_linux:  "67510edc797b97b49da2708d33711d1d7cf391c4b53e4aa1c7555ed3229eb362",
         x86_64_linux: "92e88ca90d37c368ea9d2e76007d75c56dd9a2469cadc826aed510886735b794"

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
