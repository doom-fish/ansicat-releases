$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url64bit       = 'https://github.com/doom-fish/ansicat-releases/releases/download/v0.1.0/ansi.cat-0.1.0-windows-x64-setup.exe'
  checksum64     = '406a5823f134c79b319830ad493702813159a216069db16761fa7d1d03dd7f71'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'ansi.cat'
}

Install-ChocolateyPackage @packageArgs
