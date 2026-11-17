<#
.SYNOPSIS
  Rebuilds the original APK from the frozen extraction in original-source\apk.

.DESCRIPTION
  The extraction is never modified: the tree is copied to build\work\apk and assembled there.
  Pipeline: apktool b -> zipalign (16 KB page alignment) -> apksigner (v1+v2+v3) -> verify.

  The rebuilt APK is signed with the reference key in build\keys\reference-debug.jks.
  It is NOT the client signing key and MUST NOT be distributed as an update.
#>
[CmdletBinding()]
param(
  [string]$SdkRoot    = (Join-Path $env:LOCALAPPDATA 'Android\Sdk'),
  [string]$JavaHome   = 'C:\Users\Darks\tools\jdk21\jdk-21.0.13+9',
  [string]$ApktoolJar = (Join-Path $HOME 'tools\apktool_2.11.1.jar'),
  [string]$Source,
  [string]$OutDir,
  [switch]$SkipIntegrityCheck
)
$ErrorActionPreference = 'Stop'
$scriptRoot = $PSScriptRoot
if (-not $scriptRoot) { $scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path }
if (-not $Source) { $Source = Join-Path $scriptRoot '..\original-source\apk' }
if (-not $OutDir) { $OutDir = Join-Path $scriptRoot 'dist' }
$repo   = (Resolve-Path (Join-Path $scriptRoot '..')).Path
$source = (Resolve-Path $Source).Path
if ([System.IO.Path]::IsPathRooted($OutDir)) { $out = $OutDir } else { $out = Join-Path $repo $OutDir }
$work   = Join-Path $repo 'build\work'
$bt     = Join-Path $SdkRoot 'build-tools\35.0.0'

if (-not (Test-Path (Join-Path $bt 'zipalign.exe'))) { throw "Android build-tools 35.0.0 not found under $SdkRoot" }
if (-not (Test-Path $ApktoolJar)) { throw "apktool JAR not found: $ApktoolJar" }

if (-not $SkipIntegrityCheck) {
  Write-Host '== Verifying frozen extraction ==' -ForegroundColor Cyan
  & (Join-Path $repo 'original-source\verify-original-source.ps1')
  if ($LASTEXITCODE -ne 0) { throw 'Integrity check failed; refusing to build from a modified extraction.' }
}

Write-Host '== Staging pristine copy ==' -ForegroundColor Cyan
New-Item -ItemType Directory -Force $out, $work | Out-Null
if (Test-Path (Join-Path $work 'apk')) { Remove-Item (Join-Path $work 'apk') -Recurse -Force }
robocopy $source (Join-Path $work 'apk') /MIR /NFL /NDL /NJH /NJS | Out-Null
if ($LASTEXITCODE -ge 8) { throw "robocopy failed with code $LASTEXITCODE" }

$env:JAVA_HOME = $JavaHome
$env:PATH = "$JavaHome\bin;" + $env:PATH

Write-Host '== apktool b ==' -ForegroundColor Cyan
$unsigned = Join-Path $out 'rebuilt-unsigned.apk'
java -Xmx12g -jar $ApktoolJar b (Join-Path $work 'apk') -o $unsigned
if ($LASTEXITCODE -ne 0) { throw 'apktool build failed' }

Write-Host '== zipalign (16 KB pages) ==' -ForegroundColor Cyan
$aligned = Join-Path $out 'rebuilt-aligned.apk'
& (Join-Path $bt 'zipalign.exe') -P 16 -f 4 $unsigned $aligned
if ($LASTEXITCODE -ne 0) { throw 'zipalign failed' }

Write-Host '== signing (reference key) ==' -ForegroundColor Cyan
$ks = Join-Path $PSScriptRoot 'keys\reference-debug.jks'
if (-not (Test-Path $ks)) {
  Write-Host '  generating reference keystore (NOT FOR DISTRIBUTION)'
  New-Item -ItemType Directory -Force (Split-Path $ks) | Out-Null
  $dname = 'CN=Ambientuus Reference Rebuild (NOT FOR DISTRIBUTION), OU=Reverse Engineering, O=Engagement, C=BR'
  & keytool -genkeypair -v -keystore $ks -alias reference -keyalg RSA -keysize 4096 -validity 3650 -storepass referencebuild -keypass referencebuild -dname $dname
  if ($LASTEXITCODE -ne 0) { throw 'keytool failed' }
}
$signed = Join-Path $out 'app_coleta_ambientuus_rebuilt.apk'
& (Join-Path $bt 'apksigner.bat') sign --ks $ks --ks-key-alias reference --ks-pass pass:referencebuild --key-pass pass:referencebuild --v1-signing-enabled true --v2-signing-enabled true --v3-signing-enabled true --out $signed $aligned
if ($LASTEXITCODE -ne 0) { throw 'apksigner sign failed' }

Write-Host '== verify signature ==' -ForegroundColor Cyan
& (Join-Path $bt 'apksigner.bat') verify --verbose --print-certs $signed
if ($LASTEXITCODE -ne 0) { throw 'apksigner verify failed' }

Write-Host ''
Write-Host "Built: $signed ($([math]::Round((Get-Item $signed).Length/1MB,2)) MB)" -ForegroundColor Green
Write-Host 'Next: powershell -File build\verify-rebuilt.ps1 -Deep'
