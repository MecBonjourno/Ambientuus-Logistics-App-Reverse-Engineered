# Build — reference rebuild pipeline

This directory reproduces the shipped APK from the frozen tree in `../original-source/apk`.

| Path | Purpose |
|---|---|
| `build-rebuilt.ps1` | Verifies the frozen tree, stages a copy, runs apktool b → zipalign (16 KB) → apksigner (v1+v2+v3) |
| `verify-rebuilt.ps1` | Compares the rebuild to the original: signature, badging, DEX class/method/field counts, ZIP entries, and (with `-Deep`) every smali file |
| `keys/reference-debug.jks` | **Reference signing key — NOT the client key, NOT for distribution.** Password: `referencebuild`, alias `reference` |
| `dist/app_coleta_ambientuus_rebuilt.apk` | The verified rebuild (53,596,989 bytes, SHA-256 `5d780397…05cbe2`) |
| `reports/` | Badging dumps, apksigner output, verification run log |
| `screens/` | Runtime screenshots of the original and the rebuild (0 differing pixels below the status bar) |
| `tools/` | Small comparison scripts used for evidence (image diff, DEX string-pool diff) |

## Run

```powershell
powershell -ExecutionPolicy Bypass -File build\build-rebuilt.ps1
powershell -ExecutionPolicy Bypass -File build\verify-rebuilt.ps1 -Deep
```

Requirements: JDK 21, Android SDK build-tools 35.0.0, apktool 2.11.1.
Override paths with `-JavaHome`, `-SdkRoot`, `-ApktoolJar`.

## Why the signature is new

The original certificate (`CN=Arthur Ermel, O=businessflex`) belongs to a third party. Without that
private key the rebuild cannot carry the original signature; it is signed with the reference key above
so it can be installed and tested. It cannot update an already-installed original.

## Clean-up

The pipeline stages ~260 MB in `work/` and `verify/` while running. Both are disposable and git-ignored.
