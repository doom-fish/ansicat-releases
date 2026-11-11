# ansi.cat

ansi.cat is a fast, read-only viewer for macOS, Windows and Linux. It shows NFO, ANSI, XBin and PETSCII art, Markdown, text,
source code, patches, binary files and SVG images. It does not change the files that it shows.

This repository has the downloads of ansi.cat. The source code is not public. The website is
[ansi.cat](https://ansi.cat).

## Install

### macOS 12 or later

Download `ansi.cat-VERSION-macos.dmg` from [Releases](https://github.com/doom-fish/ansicat-releases/releases/latest).
Open the disk image and drag ansi.cat to the Applications folder. You can also use Homebrew:

```sh
brew tap doom-fish/ansicat https://github.com/doom-fish/ansicat-releases
brew install --cask doom-fish/ansicat/ansicat
```

### Windows 10 and 11, x64

Download `ansi.cat-VERSION-windows-x64-setup.exe` from
[Releases](https://github.com/doom-fish/ansicat-releases/releases/latest) and open it. You can also use a package
manager:

```powershell
winget install PerJohansson.ansicat
scoop bucket add ansicat https://github.com/doom-fish/ansicat-releases
scoop install ansicat/ansicat
choco install ansicat
```

The setup installs ansi.cat for your user and needs no administrator rights. ansi.cat becomes the default app for text
art and PETSCII files. If you selected a different app for a file type, Windows keeps your selection.

The Windows app has no code signature. At the first start, Windows can show a SmartScreen warning. Select
**More info**, then **Run anyway**.

### Linux, x86_64 and aarch64

The app needs glibc 2.31 or later, Vulkan and a Wayland or X11 session.
The [release](https://github.com/doom-fish/ansicat-releases/releases/latest) has three formats for each architecture.
Use `x86_64` or `amd64` for Intel and AMD systems.
Use `aarch64` or `arm64` for 64-bit ARM systems.

| Architecture | Archive | Debian and Ubuntu | AppImage |
| --- | --- | --- | --- |
| x86_64 | `ansi.cat-0.2.0-linux-x86_64.tar.gz` | `ansi.cat_0.2.0_amd64.deb` | `ansi.cat-0.2.0-linux-x86_64.AppImage` |
| aarch64 | `ansi.cat-0.2.0-linux-aarch64.tar.gz` | `ansi.cat_0.2.0_arm64.deb` | `ansi.cat-0.2.0-linux-aarch64.AppImage` |

On Debian 11 or later and Ubuntu 24.04, install the deb file:

```sh
sudo apt install ./ansi.cat_0.2.0_amd64.deb
```

The package installs the desktop entry, file types, icons and `ansicat` command.
To remove it, run `sudo apt remove ansi.cat`.

For a portable copy, extract the tar.gz file:

```sh
tar -xzf ansi.cat-0.2.0-linux-x86_64.tar.gz
cd ansi.cat-0.2.0-linux-x86_64
./ansi.cat --register
```

For AppImage, make the file executable:

```sh
chmod +x ansi.cat-0.2.0-linux-x86_64.AppImage
./ansi.cat-0.2.0-linux-x86_64.AppImage --register
```

The portable formats need the same system libraries as the deb file.
Install `xdg-utils`, `shared-mime-info` and `desktop-file-utils` for desktop registration.
Keep the extracted folder or the AppImage in one place.
The register command adds the desktop entry and a link in `~/.local/bin`.
If necessary, add this folder to `PATH`.
To remove these files, run the same app with `--unregister`.
Your settings stay.

Use `ansicat FILE` to show a file in the terminal.
Use `ansicat --open FILE` to open it in the app.
An AppImage needs FUSE.
If FUSE is not available, use `--appimage-extract-and-run`.

You can also use Homebrew on Linux:

```sh
brew tap doom-fish/ansicat https://github.com/doom-fish/ansicat-releases
brew install --cask doom-fish/ansicat/ansicat
```

Homebrew moves the AppImage to `~/Applications` and adds ansi.cat to the applications menu.
It also installs the `ansicat` command, which does not need FUSE.
If you registered a different copy of ansi.cat, run `--unregister` with that copy first.

## Licence

Copyright (c) 2026 Per Johansson.

You can use ansi.cat under the MIT licence ([LICENSE-MIT](LICENSE-MIT)) or the Apache License 2.0
([LICENSE-APACHE](LICENSE-APACHE)).
