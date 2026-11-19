<#
.SYNOPSIS
  Verifies the frozen extraction in original-source against MANIFEST.sha256.

.DESCRIPTION
  Default (quick): checks that every manifested file exists and that no unexpected file was added.
  -Full: also recomputes SHA-256 of every file (slow: ~35,000 files / ~290 MB).
  The derived pt-BR/ translation layer is not part of the frozen manifest and is ignored here.
#>
[CmdletBinding()]
param(
  [string]$Root,
  [switch]$Full
)
if (-not $Root) {
  $Root = $PSScriptRoot
  if (-not $Root) { $Root = Split-Path -Parent $MyInvocation.MyCommand.Path }
}
$Root = (Resolve-Path -LiteralPath $Root).Path
$manifestPath = Join-Path $Root 'MANIFEST.sha256'
if (-not (Test-Path $manifestPath)) { Write-Host "MANIFEST.sha256 not found in $Root" -ForegroundColor Red; exit 2 }
$entries = @()
foreach ($line in (Get-Content $manifestPath)) {
  if ($line -match '^([0-9a-fA-F]{64})\s{2}(.+)$') { $entries += ,@($Matches[1].ToLowerInvariant(), $Matches[2]) }
}
$missing = 0; $modified = 0; $checked = 0
foreach ($e in $entries) {
  $p = Join-Path $Root $e[1]
  if (-not (Test-Path -LiteralPath $p)) { Write-Host "MISSING  $($e[1])" -ForegroundColor Red; $missing++; continue }
  if ($Full) {
    $h = (Get-FileHash -Algorithm SHA256 -LiteralPath $p).Hash.ToLowerInvariant()
    if ($h -ne $e[0]) { Write-Host "MODIFIED $($e[1])" -ForegroundColor Red; $modified++ }
  }
  $checked++
}
$manifestSet = @{}
foreach ($e in $entries) { $manifestSet[$e[1].Replace('/','\')] = 1 }
$extra = 0
Get-ChildItem $Root -Recurse -File | ForEach-Object {
  $rel = $_.FullName.Substring($Root.Length + 1)
  if ($rel.StartsWith('pt-BR\')) { return }   # camada derivada de traduções
  if ($_.Name -ne 'MANIFEST.sha256' -and -not $manifestSet.ContainsKey($rel)) { Write-Host "UNEXPECTED $rel" -ForegroundColor Yellow; $extra++ }
}
Write-Host ''
Write-Host ("checked {0} files; missing {1}; modified {2}; unexpected {3}" -f $checked, $missing, $modified, $extra)
Write-Host 'Camada derivada pt-BR ignorada (traducoes; nao fazem parte do snapshot congelado).' -ForegroundColor DarkGray
if ($missing -gt 0 -or $modified -gt 0 -or $extra -gt 0) { Write-Host 'EXTRACTION INTEGRITY: FAIL' -ForegroundColor Red; exit 1 }
if ($Full) { Write-Host 'EXTRACTION INTEGRITY: OK (all hashes match)' -ForegroundColor Green }
else { Write-Host 'EXTRACTION INTEGRITY: OK (presence check; run with -Full to hash every file)' -ForegroundColor Green }
exit 0
