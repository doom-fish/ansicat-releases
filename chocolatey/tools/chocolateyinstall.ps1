$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url64bit       = 'https://github.com/doom-fish/ansicat-releases/releases/download/v0.4.0/ansi.cat-0.4.0-windows-x64-setup.exe'
  checksum64     = '79159c158b7cf1a0d4623e346e4666f2be6036081cc6301785bf50b575229b93'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'ansi.cat'
}

Install-ChocolateyPackage @packageArgs
