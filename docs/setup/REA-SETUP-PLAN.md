# REA Setup Plan — DeepSeek Harness Integration

**Project:** Ambientuus Logistics App — Reverse Engineering Engagement
**Prepared by:** Lead agent (DeepSeek Harness)
**Date:** 2026-11-17
**Status:** Executed (approval prompts disabled in this session; plan recorded, dry-run reviewed, then applied non-interactively with `--yes`)

---

## 1. Objective

Stand up **REA** (`rea-agents`, the reverse-engineering MCP server from https://rea.tools) on this workstation and register it with **DeepSeek Harness** (client id `dsh`), so the agent can inspect the client's Android APK statically with evidence-bound tooling.

Scope of this plan: the REA installation and the Android/JADX analysis path only. It does not modify the target APK, the application, or any client system.

## 2. Host baseline (measured before changes)

| Item | Value | Consequence |
|---|---|---|
| OS | Windows, x64, 40 logical CPUs | Windows x64 supported by REA 6.9.0; JADX path supported |
| Node.js (system) | v24.14.0 | **Below** `rea-agents@6.9.0` engines (`^24.22.1`) → a newer Node is required |
| npm | 11.19.0 | OK |
| JDK | **not installed** | JADX provider requires a full JDK 17+ (with `javac`) |
| JADX engine | not installed | Must be provided as the pinned `jadx-headless-mcp` 0.7.1 JAR |
| apktool / adb / Ghidra / IDA | not installed | Optional; apktool installed later for resource corroboration |
| DSH home | `C:\Users\Darks\.dsh` (active profile: `profiles/desktop`) | Home-level patch layer `~/.dsh/cordis.patch.yml` applies to every profile (verified in the DSH profile-boot module) |

## 3. Plan (as approved and executed)

| # | Action | Command / artifact | Reversible |
|---|---|---|---|
| 1 | Install a Node satisfying REA engines | `fnm install 24` → **v24.22.3** at `%APPDATA%\fnm\node-versions\v24.22.3\installation` | Yes (fnm uninstall) |
| 2 | Install full JDK 21 (Temurin) for the JADX bridge | `C:\Users\Darks\tools\jdk21\jdk-21.0.13+9` (portable ZIP, no admin) | Yes (delete folder) |
| 3 | Download pinned JADX engine and verify SHA-256 | `jadx-headless-mcp-0.7.1-all.jar` → `%USERPROFILE%\.local\share\rea\android\`; expected `6e5eacf5…ff75` | Yes (delete JAR) |
| 4 | Install the REA CLI/MCP package | `npm install -g rea-agents@6.9.0` (Node 24.22.3) | Yes (npm uninstall -g) |
| 5 | Register REA with DeepSeek Harness | `rea setup --client dsh --yes` with `JAVA_HOME` and `REA_JADX_MCP_JAR` exported | Yes (`rea uninstall --client dsh`) |
| 6 | Verify | `rea doctor --client dsh --json`, config inspection, live MCP tool call | Read-only |

### What setup writes

1. **`C:\Users\Darks\.dsh\cordis.patch.yml`** — an `insert` entry `id: rea-mcp` using `@deepseek-ai/dsh-mcp-client`, launching:
   `node.exe <global>\rea-agents\scripts\rea.mjs mcp` over stdio, with `JAVA_HOME` and `REA_JADX_MCP_JAR` in the server environment.
   This is a *home-level* user patch layer, so it applies to every DSH profile (including the active `desktop` profile).
2. **`C:\Users\Darks\.agents\skills\reverse-engineer-anything`** — the bundled REA investigation skill (255 tools' worth of guidance).

### Safety properties of the plan

- No elevation, no system-wide installers, no registry changes; everything is user-scoped.
- No network listener is opened; the MCP server is stdio-only.
- The APK is opened read-only by JADX; analysis never executes Android code.
- Existing DSH configuration is preserved: setup adds one entry to a file that did not previously exist and keeps a backup path for edited files.
- Rollback is one command (`rea uninstall --client dsh`) plus deleting the three installed artifacts.

## 4. Non-goals

- No Ghidra/IDA/Hopper installation (not needed for an APK).
- No emulator or device, no dynamic execution of the APK.
- No active probing of the client's servers from this workstation (kept out of scope; see assessment).
- No changes to the APK, and no redistribution of decompiled code.

## 5. Verification gates

| Gate | Pass criterion | Result |
|---|---|---|
| Node engine | `node -v` ≥ 24.22.1 | ✅ v24.22.3 |
| JDK | `java -version` + `javac -version` = 21 | ✅ 21.0.13+9 |
| JADX JAR | SHA-256 equals REA pinned digest | ✅ `6e5eacf5…ff75` |
| Registration | `cordis.patch.yml` contains `rea-mcp` | ✅ |
| Doctor | `healthy: true`; jadx check ok | ✅ |
| Live MCP | REA tools answer a real APK call | ✅ (signature + package inspection) |

Details and evidence are in [REA-INSTALLATION-VERIFICATION.md](REA-INSTALLATION-VERIFICATION.md).
