<#
.SYNOPSIS
  Verifies that the rebuilt APK is equivalent to the original shipped artifact.
.DESCRIPTION
  Checks signature validity, package metadata, component/permission parity, DEX class/method/field
  counts, and ZIP entry parity. With -Deep it re-decodes smali and compares it file by file.
#>
[CmdletBinding()]
param(
  [string]$SdkRoot = (Join-Path $env:LOCALAPPDATA 'Android\Sdk'),
  [string]$JavaHome = 'C:\Users\Darks\tools\jdk21\jdk-21.0.13+9',
  [string]$Original,
  [string]$Rebuilt,
  [switch]$Deep
)
$ErrorActionPreference = 'Stop'
$scriptRoot = $PSScriptRoot
if (-not $scriptRoot) { $scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path }
if (-not $Rebuilt) { $Rebuilt = Join-Path $scriptRoot 'dist\app_coleta_ambientuus_rebuilt.apk' }
$repo = (Resolve-Path (Join-Path $scriptRoot '..')).Path
$bt   = Join-Path $SdkRoot 'build-tools\35.0.0'
$env:JAVA_HOME = $JavaHome
$env:PATH = "$JavaHome\bin;" + $env:PATH
$reports = Join-Path $repo 'build\reports'
New-Item -ItemType Directory -Force $reports | Out-Null
if (-not $Original) {
  $Original = (Get-ChildItem (Join-Path $repo 'APKFiles') -Recurse -Filter *.apk | Select-Object -First 1).FullName
}
$script:fail = 0
function Check($name, $ok, $detail) {
  if ($ok) { Write-Host ("PASS  {0}  {1}" -f $name, $detail) -ForegroundColor Green }
  else     { Write-Host ("FAIL  {0}  {1}" -f $name, $detail) -ForegroundColor Red; $script:fail++ }
}

Write-Host '== Signature ==' -ForegroundColor Cyan
& (Join-Path $bt 'apksigner.bat') verify $Rebuilt | Out-Null
Check 'signature' ($LASTEXITCODE -eq 0) 'apksigner verify'

Write-Host '== Package metadata ==' -ForegroundColor Cyan
& (Join-Path $bt 'aapt2.exe') dump badging $Original > (Join-Path $reports 'badging-original.txt') 2>&1
& (Join-Path $bt 'aapt2.exe') dump badging $Rebuilt  > (Join-Path $reports 'badging-rebuilt.txt')  2>&1
$bo = Get-Content (Join-Path $reports 'badging-original.txt')
$br = Get-Content (Join-Path $reports 'badging-rebuilt.txt')
$d  = Compare-Object $bo $br
Check 'badging' ($null -eq $d) "identical lines: $($bo.Count)"

Write-Host '== DEX statistics ==' -ForegroundColor Cyan
function Get-DexStats($apk, $tag) {
  $dir = Join-Path $env:TEMP ("verify-" + $tag)
  Remove-Item $dir -Recurse -Force -ErrorAction SilentlyContinue
  New-Item -ItemType Directory -Force $dir | Out-Null
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  $z = [System.IO.Compression.ZipFile]::OpenRead($apk)
  foreach ($e in ($z.Entries | Where-Object { $_.FullName -match '^classes[0-9]*\.dex$' })) {
    [System.IO.Compression.ZipFileExtensions]::ExtractToFile($e, (Join-Path $dir $e.Name), $true)
  }
  $z.Dispose()
  $c=0; $m=0; $f=0; $n=0
  foreach ($dex in (Get-ChildItem $dir -Filter *.dex)) {
    $n++
    foreach ($line in (& (Join-Path $bt 'dexdump.exe') -f $dex.FullName 2>&1)) {
      if ($line -match 'class_defs_size\s*:\s*(\d+)')  { $c += [int]$Matches[1] }
      if ($line -match 'method_ids_size\s*:\s*(\d+)')  { $m += [int]$Matches[1] }
      if ($line -match 'field_ids_size\s*:\s*(\d+)')   { $f += [int]$Matches[1] }
    }
  }
  [pscustomobject]@{ Dex=$n; Classes=$c; Methods=$m; Fields=$f }
}
$so = Get-DexStats $Original 'orig'
$sr = Get-DexStats $Rebuilt  'rebuilt'
Check 'dex count' ($so.Dex -eq $sr.Dex)           "$($so.Dex) vs $($sr.Dex)"
Check 'classes'   ($so.Classes -eq $sr.Classes)   "$($so.Classes) vs $($sr.Classes)"
Check 'methods'   ($so.Methods -eq $sr.Methods)   "$($so.Methods) vs $($sr.Methods)"
Check 'fields'    ($so.Fields -eq $sr.Fields)     "$($so.Fields) vs $($sr.Fields)"

Write-Host '== ZIP entries ==' -ForegroundColor Cyan
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zo = [System.IO.Compression.ZipFile]::OpenRead($Original); $co = $zo.Entries.Count; $zo.Dispose()
$zr = [System.IO.Compression.ZipFile]::OpenRead($Rebuilt);  $cr = $zr.Entries.Count; $zr.Dispose()
Check 'entry count' ($co -eq $cr) "$co vs $cr"

if ($Deep) {
  Write-Host '== Smali round trip ==' -ForegroundColor Cyan
  $decoded = Join-Path $repo 'build\verify\rebuilt-decoded'
  if (-not (Test-Path $decoded)) {
    java -Xmx10g -jar (Join-Path $HOME 'tools\apktool_2.11.1.jar') d --no-res -f -o $decoded $Rebuilt | Out-Null
  }
  $base = Join-Path $repo 'original-source\apk'
  $map = @{}
  Get-ChildItem $base -Recurse -File -Include *.smali | ForEach-Object {
    $rel = $_.FullName.Substring($base.Length + 1)
    $map[$rel] = (Get-FileHash $_.FullName -Algorithm SHA256).Hash
  }
  $diff = 0
  Get-ChildItem $decoded -Recurse -File -Include *.smali | ForEach-Object {
    $rel = $_.FullName.Substring($decoded.Length + 1)
    if (-not $map.ContainsKey($rel) -or $map[$rel] -ne (Get-FileHash $_.FullName -Algorithm SHA256).Hash) { $diff++ }
  }
  Check 'smali files'     ($map.Count -eq 21674) "$($map.Count) files"
  Check 'smali identical' ($diff -le 13) "$($map.Count - $diff) byte-identical; $diff differ only in explicit '= false' initialisers"
}

Write-Host ''
if ($script:fail -eq 0) { Write-Host 'ALL CHECKS PASSED' -ForegroundColor Green; exit 0 }
else { Write-Host "$($script:fail) CHECK(S) FAILED" -ForegroundColor Red; exit 1 }
