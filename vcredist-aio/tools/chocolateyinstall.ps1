$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'VisualCppRedist_AIO_x86_x64.exe'
$url          = 'https://github.com/abbodi1406/vcredist/releases/download/v0.60.0/VisualCppRedist_AIO_x86_x64_60.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  file          = $fileLocation
  checksum      = 'd7cc0d80290040083df52537999c16d0fc7931b4ef23cbbbbbc5176b48017df0'
  checksumType  = 'sha256'
  silentArgs    = '/ai /gm2'
  validExitCodes = 0
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
