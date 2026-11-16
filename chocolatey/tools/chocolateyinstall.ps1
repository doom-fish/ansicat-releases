$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url64bit       = 'https://github.com/doom-fish/ansicat-releases/releases/download/v0.3.0/ansi.cat-0.3.0-windows-x64-setup.exe'
  checksum64     = '420f8ce4eb5b5df89c580e5de5aa21e669e008019eb43c67fdb98af540222fda'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'ansi.cat'
}

Install-ChocolateyPackage @packageArgs
