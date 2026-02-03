$sitemapPath = Join-Path $PSScriptRoot "sitemap.xml"

if (-not (Test-Path $sitemapPath)) {
  Write-Error "sitemap.xml not found at $sitemapPath"
  exit 1
}

$today = Get-Date -Format "yyyy-MM-dd"
$content = Get-Content -Raw -Path $sitemapPath
$updated = $content -replace "<lastmod>.*?</lastmod>", "<lastmod>$today</lastmod>"

Set-Content -Path $sitemapPath -Value $updated -Encoding UTF8 -NoNewline
Write-Output "Updated sitemap.xml lastmod to $today"
