$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'VisualCppRedist_AIO_x86_x64.exe'

$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  silentArgs    = "/aiR /gm2"
  file          = $fileLocation
}

$uninstalled = $false

Uninstall-ChocolateyPackage @packageArgs
