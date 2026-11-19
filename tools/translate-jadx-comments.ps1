<#
.SYNOPSIS
  Cria uma copia-espelho de uma arvore Java com os comentarios gerados pelo JADX traduzidos para pt-BR.

.DESCRIPTION
  Le cada arquivo .java de -Source, aplica o mapa de traducao tools\jadx-comment-map.json e grava o
  resultado em -Destination preservando caminhos, codificacao UTF-8 sem BOM e todo o codigo.
  Nenhum arquivo de -Source e alterado.

.EXAMPLE
  .\translate-jadx-comments.ps1 -Source original-source\java -Destination original-source\pt-BR\java -Verify
#>
[CmdletBinding()]
param(
  [Parameter(Mandatory)][string]$Source,
  [Parameter(Mandatory)][string]$Destination,
  [string]$MapPath,
  [switch]$Verify
)
$ErrorActionPreference = 'Stop'
$utf8 = [System.Text.UTF8Encoding]::new($false)
$source = (Resolve-Path -LiteralPath $Source).Path
if (-not $MapPath) { $MapPath = Join-Path $PSScriptRoot 'jadx-comment-map.json' }
$map = [System.IO.File]::ReadAllText($MapPath, $utf8) | ConvertFrom-Json

$files = @(Get-ChildItem -LiteralPath $source -Recurse -File -Filter *.java)
$changed = 0
foreach ($file in $files) {
  $text = [System.IO.File]::ReadAllText($file.FullName, $utf8)
  $new = $text
  foreach ($pair in $map) { $new = $new.Replace($pair.en, $pair.pt) }
  $rel = $file.FullName.Substring($source.Length).TrimStart('\')
  $dest = Join-Path $Destination $rel
  $dir = Split-Path -Parent $dest
  if (-not (Test-Path -LiteralPath $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  [System.IO.File]::WriteAllText($dest, $new, $utf8)
  if ($new -ne $text) { $changed++ }
}
Write-Host ("arquivos processados: {0}; com comentarios traduzidos: {1}" -f $files.Count, $changed)

if ($Verify) {
  $reverse = [ordered]@{}
  foreach ($pair in $map) { $reverse[$pair.pt] = $pair.en }
  $bad = 0
  foreach ($file in $files) {
    $orig = [System.IO.File]::ReadAllText($file.FullName, $utf8)
    $rel = $file.FullName.Substring($source.Length).TrimStart('\')
    $trad = [System.IO.File]::ReadAllText((Join-Path $Destination $rel), $utf8)
    $back = $trad
    foreach ($k in $reverse.Keys) { $back = $back.Replace($k, $reverse[$k]) }
    if ($back -ne $orig) { Write-Host "DIVERGENCIA: $rel" -ForegroundColor Red; $bad++ }
  }
  if ($bad -eq 0) { Write-Host 'verificacao: OK - codigo identico, apenas comentarios traduzidos' -ForegroundColor Green }
  else { Write-Host "verificacao: $bad arquivo(s) divergente(s)" -ForegroundColor Red; exit 1 }
}
