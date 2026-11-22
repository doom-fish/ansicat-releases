cask "ansicat" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux-#{arch}"
  url_end = on_system_conditional macos: "dmg", linux: "AppImage"

  version "0.4.1"
  sha256 arm:          "e31b5407c54356ac8188d3e105cb8ab50137bd24457846c2fb31277bfa55f279",
         intel:        "e31b5407c54356ac8188d3e105cb8ab50137bd24457846c2fb31277bfa55f279",
         arm64_linux:  "68e1b34e36fcaeb6f1369c1985923d61cfbef8dd8d253b5ba064fdd4b70145ec",
         x86_64_linux: "74dec98954f575a9e1d66719e9f81d6863caccbab9142e0092c343186d24df29"

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
