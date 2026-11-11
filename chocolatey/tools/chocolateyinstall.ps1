$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url64bit       = 'https://github.com/doom-fish/ansicat-releases/releases/download/v0.2.0/ansi.cat-0.2.0-windows-x64-setup.exe'
  checksum64     = 'aded222d98a8b363cb75c883c23422e16bef0526ae955d61e59006eb6de970a5'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'ansi.cat'
}

Install-ChocolateyPackage @packageArgs
