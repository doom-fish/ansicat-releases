$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url64bit       = 'https://github.com/doom-fish/ansicat-releases/releases/download/v0.4.1/ansi.cat-0.4.1-windows-x64-setup.exe'
  checksum64     = '28b75d60efc40fc3902e9f5a3cf59b078a353909eb680fdc9059700df2fc7ed6'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'ansi.cat'
}

Install-ChocolateyPackage @packageArgs
