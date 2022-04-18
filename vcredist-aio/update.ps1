import-module au

$domain   = 'https://github.com'
$releases = "$domain/abbodi1406/vcredist/releases/latest"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex = '\.zip$'
  $url = $download_page.Links.Href -match $regex | select -First 1
  $version = $url -split '/' | select -Last 1 -Skip 1

  @{
    URL32 = $domain + $url
    Version = $version.Trim('v')
  }
}

update -ChecksumFor 32
