$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url64bit       = 'https://github.com/doom-fish/ansicat-releases/releases/download/v0.4.2/ansi.cat-0.4.2-windows-x64-setup.exe'
  checksum64     = 'd7ef014b2e81d659d91a9121eec1e76934baf570aa0ba18d1a6dc4a20b3abdca'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'ansi.cat'
}

Install-ChocolateyPackage @packageArgs
