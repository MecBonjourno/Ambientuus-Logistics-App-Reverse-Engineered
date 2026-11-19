# Ambientuus Logistics App — Reverse Engineering

This repository holds the shipped Android APK for the Ambientuus field-collection app and the
reverse-engineering outputs produced without access to the original source.

**Subject:** `APKFiles/OriginalApp/app_coleta_ambientuus_hom_1.59 2.apk`
**SHA-256:** `94e4d8a5ce2b9c79fb44846e6237b632eb6546734cca5c74314c6d44faf1c1f5`
**Package:** `com.coleta.ambientuus.debug` — version `1.59-DEBUG` (59)
**Verdict:** 🔴 not production-ready — debuggable debug build, cleartext unauthenticated API, hardcoded admin password.

## New multi-platform plan (2026-11-18)

The Android-only replacement plan is on hold. The next phase is a platform rebuild: a **Next.js 16.4
web platform**, an **Expo SDK 58 iOS/Android app**, and a **Rust-based Windows desktop app** (Tauri 2.12),
on a contract-first TypeScript API and PostgreSQL, with Oracle ORDS behind an anti-corruption adapter.

Start with the [platform plan index](docs/platform/README.md), then the
[legacy functional spec](docs/platform/LEGACY-APP-SPEC.md),
[target architecture](docs/platform/PLATFORM-ARCHITECTURE.md) and
[delivery plan](docs/platform/DELIVERY-PLAN.md).

## Deliverables

| Document | What it covers |
|---|---|
| [REA setup plan](docs/setup/REA-SETUP-PLAN.md) | What was installed, why, exact commands, rollback |
| [Installation verification](docs/setup/REA-INSTALLATION-VERIFICATION.md) | Versions, doctor result, live MCP proof |
| [APK security assessment](docs/analysis/APK-SECURITY-ASSESSMENT.md) | 14 findings, attack scenarios, LGPD/MTR impact, remediation roadmap |
| [Architecture & reconstruction](docs/analysis/APP-ARCHITECTURE-AND-RECONSTRUCTION.md) | What the app does, data model, API surface, rebuild plan and effort (Android-only; on hold) |
| [Multi-platform rebuild plan](docs/platform/README.md) | Stack evaluation and target architecture for web + iOS/Android + Windows, with delivery plan and migration |
| [Evidence index](artifacts/EVIDENCE-INDEX.md) | REA evidence IDs behind every claim |
| [Original source snapshot](original-source/README.md) | Frozen, buildable extraction of the APK (smali + Java + resources) |
| [Extraction & build-clone report](docs/rebuild/ORIGINAL-SOURCE-SNAPSHOT.md) | How the snapshot was made, its measured fidelity, runtime proof |

## Top findings

1. **Cleartext HTTP** to `http://ambientuus-tipartner.ddns.com.br:8085/ords/portalcliente/appcoleta/`; manifest sets `usesCleartextTraffic="true"` and defines no network-security policy.
2. **No authentication in the client** — Retrofit/OkHttp with timeouts only, no token, no client certificate, 14 unauthenticated endpoints.
3. **Debuggable build** (`android:debuggable="true"`, `BUILD_TYPE=debug`) — `adb run-as` exposes the unencrypted SQLite database.
4. **Hardcoded admin password** `@tenas66` gating the admin screen.

Also: `allowBackup=true`, personal self-signed signing key with no rotation, and full-database backup to a personal Google Drive.

## Frozen original source and build clone

Before any remediation, the shipped code was extracted to `original-source/` and proven buildable:

| Check | Result |
|---|---|
| Smali round trip | 21,661 / 21,674 files byte-identical (13 differ only by explicit `= false`) |
| DEX classes / methods / fields | 21,674 / 171,219 / 77,064 — identical to original |
| Badging | 130/130 lines identical |
| Runtime | installed and launched on Android 15; **0 differing pixels** vs original below the status bar |

The rebuild is signed with a **reference key**, not the client's (which is unavailable), so it cannot
update an installed original. Details: [original-source/README.md](original-source/README.md) and
[ORIGINAL-SOURCE-SNAPSHOT.md](docs/rebuild/ORIGINAL-SOURCE-SNAPSHOT.md).

## Tradução pt-BR

A extração congelada permanece intacta e ganhou uma camada derivada em Português do Brasil:

| Conteúdo | Onde |
|---|---|
| README traduzido | [original-source/pt-BR/README.md](original-source/pt-BR/README.md) |
| Metadados em português | [APK-METADATA.md](original-source/pt-BR/APK-METADATA.md) |
| Glossário técnico e marcadores JADX | [GLOSSARIO.md](original-source/pt-BR/GLOSSARIO.md) |
| Mapa funcional do código | [MAPA-DO-CODIGO.md](original-source/pt-BR/MAPA-DO-CODIGO.md) |
| Comentários Java traduzidos | [original-source/pt-BR/java/](original-source/pt-BR/java/) — espelho de 11.284 arquivos |
| Como foi feito | [SOBRE-ESTA-TRADUCAO.md](original-source/pt-BR/SOBRE-ESTA-TRADUCAO.md) |

A tradução toca **apenas comentários**: o código é idêntico byte a byte e a verificação é feita
revertendo o mapa de tradução. A árvore smali não é duplicada (é a entrada de compilação, com
diretivas estruturais, não documentação). Para regerar:

```powershell
powershell -ExecutionPolicy Bypass -File tools\translate-jadx-comments.ps1 -Source original-source\java -Destination original-source\pt-BR\java -Verify
```

## Tooling

- [REA](https://rea.tools) 6.9.0 (MCP server, registered with DeepSeek Harness as `rea`) + JADX 0.7.1 provider
- Node 24.22.3 (fnm), Temurin JDK 21.0.13+9
- apktool 2.11.1 (independent resource decode)
- Android build-tools 35.0.0 + emulator (API 35) for the build-clone verification
- Security analysis is static; the only runtime activity is the isolated emulator smoke test of the original and rebuilt APKs (see [snapshot report](docs/rebuild/ORIGINAL-SOURCE-SNAPSHOT.md)). No request was deliberately sent to the client's servers

## Repository layout

```
APKFiles/OriginalApp/   original APK (untouched)
original-source/        FROZEN extraction: apk/ (smali+resources), java/ (JADX), hashes
build/                  reproducible rebuild pipeline, reference key, signed APK, screenshots
docs/setup/             REA installation plan and verification
docs/analysis/          security assessment, architecture, reconstruction plan
docs/rebuild/           extraction and build-clone report
docs/platform/          multi-platform stack evaluation, architecture, legacy spec, delivery plan
artifacts/apktool/      decoded manifest/resources (dex copies removed)
artifacts/strings/      DEX string inventory: URLs, hosts, secret-like literals
artifacts/tools/        scan script used to derive the string inventory
artifacts/EVIDENCE-INDEX.md
artifacts/rea-evidence-bundle.json
```

## Cloning on Windows

The frozen smali tree contains file paths longer than 260 characters. Enable Git long paths first:

```powershell
git config --global core.longpaths true
```

The working tree is ~445 MB; the Git pack is ~100 MB. It includes the 55 MB original APK and the
51 MB rebuilt APK, plus the full extraction.

## Reproduce

```powershell
# health of the REA installation
rea doctor --client dsh --json

# manifest + signature
# (through the connected agent, or)
rea inspect-android-package "APKFiles\OriginalApp\app_coleta_ambientuus_hom_1.59 2.apk" --json

# rescan DEX strings (requires extracted classes*.dex)
node artifacts\tools\scan-dex-strings.js <dex-dir> artifacts\strings

# rebuild the frozen extraction and verify equivalence
powershell -ExecutionPolicy Bypass -File build\build-rebuilt.ps1
powershell -ExecutionPolicy Bypass -File build\verify-rebuilt.ps1 -Deep

# check the frozen tree has not drifted
powershell -ExecutionPolicy Bypass -File original-source\verify-original-source.ps1 -Full
```

## Next steps

The immediate security hotfix (release build, HTTPS in front of ORDS, API credential, rotate the
admin password) is still described in the [security assessment](docs/analysis/APK-SECURITY-ASSESSMENT.md#8-remediation-roadmap).
For the replacement, start with the [platform plan](docs/platform/README.md): approve the stack and run
the two-week Phase 0 discovery sprint (ORDS access, hardware spike, legacy data profiling, scaffold).
The decisions still needed from the client are listed in the [delivery plan](docs/platform/DELIVERY-PLAN.md#9-decisions-needed).
