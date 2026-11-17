# Original Source Code — FROZEN SNAPSHOT

> **DO NOT EDIT THIS DIRECTORY.**
> It is the preserved, buildable extraction of the shipped APK
> `APKFiles/OriginalApp/app_coleta_ambientuus_hom_1.59 2.apk`
> (SHA-256 `94e4d8a5ce2b9c79fb44846e6237b632eb6546734cca5c74314c6d44faf1c1f5`).
> Any change to the shipped app must produce a **new snapshot directory**, never a modification of this one.

## What this is

The client's original Android code no longer exists in source form. This directory reconstructs it
from the shipped binary, without access to the original project, and proves that the reconstruction
still builds an installable APK.

| Path | Contents | Fidelity |
|---|---|---|
| `apk/` | Lossless apktool tree: `AndroidManifest.xml`, `apktool.yml`, `smali/` + `smali_classes2..17/`, `res/`, `assets/`, `lib/`, `original/`, `unknown/` | **Exact bytecode** (smali disassembly of all 17 DEX files) |
| `java/` | JADX 1.5.1 decompilation of every class (11,284 `.java` files) | **Approximate**: readable Java, not guaranteed compilable, 15 files carry `JADX ERROR` markers |
| `APK-METADATA.json` | Package identity, tool versions, build fingerprint, verification results | — |
| `MANIFEST.sha256` | SHA-256 of every extracted file (34,000+) | — |
| `verify-original-source.ps1` | Integrity checker (`-Full` to hash every file) | — |

The **smali tree is the authoritative source**: it is what the rebuild compiles. The Java tree is for humans.

## Provenance

| Item | Value |
|---|---|
| Extracted | 2026-11-17 |
| apktool | 2.11.1 (decode + rebuild) |
| JADX | 1.5.1 |
| JDK | Temurin 21.0.13+9 |
| Android build-tools | 35.0.0 (aapt2, zipalign, apksigner) |
| DEX files | 17, 21,674 smali classes |
| Original build fingerprint | D8 **8.9.35**, `min-api 23`, `compilation-mode debug`, `desugar_jdk_libs 2.1.5` (recovered from D8 metadata strings in the original DEX) |

## Fidelity — measured, not assumed

The snapshot was rebuilt and compared against the original:

| Check | Result |
|---|---|
| Badging (package, version, SDK, permissions, label, launcher) | 130/130 lines identical |
| DEX class / method / field counts | 21,674 / 171,219 / 77,064 — identical |
| Smali round trip (decode → build → decode) | 21,661 of 21,674 files **byte-identical**; the 13 differences are explicit `= false` static-field initialisers only (semantically identical) |
| DEX string pool | 19 strings lost — all **D8/R8 build metadata blobs** (`~~D8{…}`, `~~L8{…}`, `~~~{…}`); no code or literal lost |
| Resource entry paths | 256 paths differ because aapt2 collapses version qualifiers redundant at minSdk 23 (e.g. `res/color-v23` → `res/color`); resource IDs and values unchanged |
| Runtime | Installed on Android 15 (API 35) emulator, launched, **0 differing pixels** vs the original APK screenshot below the status bar |

## What is *not* reproduced

1. **The signature.** The original key belonged to a third party and is not available, so the rebuild is signed with `build/keys/reference-debug.jks` — a reference key, **not for distribution**. The rebuilt APK cannot update an installed original; it installs fresh.
2. **Byte-identical DEX.** Smali reassembly preserves classes, methods, fields and instructions, but re-encodes the DEX container and drops the D8 metadata blobs above.
3. **The original Java project.** There was no Gradle project, resources pipeline, or dependency declaration to recover; the rebuild is an apktool assembly, not a compilation of `java/`.

## Rebuild it

```powershell
# from the repository root
powershell -ExecutionPolicy Bypass -File build\build-rebuilt.ps1
powershell -ExecutionPolicy Bypass -File build\verify-rebuilt.ps1 -Deep
```

Output: `build/dist/app_coleta_ambientuus_rebuilt.apk` (signed, 16 KB-page aligned).
The build stages a copy in `build/work/apk`, so this directory is never written to.

## Verify it has not been touched

```powershell
powershell -ExecutionPolicy Bypass -File original-source\verify-original-source.ps1 -Full
```

## Legal note

The `java/` and `smali/` trees include third-party libraries (AndroidX, Google Play Services, ML Kit,
OkHttp, Gson, Retrofit, Kotlin) that remain under their own licenses. Use this snapshot for security
analysis, maintenance and reconstruction of the client's own application; do not redistribute
decompiled third-party code.
