# ansi.cat

ansi.cat is a fast, read-only viewer for macOS and Windows. It shows NFO, ANSI, XBin and PETSCII art, Markdown, text,
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

## Licence

Copyright (c) 2026 Per Johansson.

You can use ansi.cat under the MIT licence ([LICENSE-MIT](LICENSE-MIT)) or the Apache License 2.0
([LICENSE-APACHE](LICENSE-APACHE)).
