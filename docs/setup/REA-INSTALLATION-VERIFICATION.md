# REA Installation Verification — DeepSeek Harness

**Date:** 2026-11-17
**Host:** Windows x64 (40 logical CPUs), user scope only
**Verdict:** ✅ **Installation healthy and connected; Android (JADX) provider operational.**

---

## 1. Installed components

| Component | Version | Location | Digest / notes |
|---|---|---|---|
| REA (`rea-agents`) | **6.9.0** | `C:\Users\Darks\AppData\Roaming\fnm\node-versions\v24.22.3\installation\node_modules\rea-agents` | Global npm install under fnm Node |
| Node.js | **24.22.3** | `%APPDATA%\fnm\node-versions\v24.22.3\installation` | Satisfies `^24.22.1` |
| JDK (Temurin) | **21.0.13+9 LTS** | `C:\Users\Darks\tools\jdk21\jdk-21.0.13+9` | `javac` present (required by the bridge) |
| JADX headless engine | **0.7.1** | `C:\Users\Darks\.local\share\rea\android\jadx-headless-mcp-0.7.1-all.jar` | SHA-256 `6e5eacf500b64292bfb73c49797c1958f6ee44646e43e868039ae7feb573ff75` — matches REA's pinned `JadxRelease` metadata |
| apktool (corroboration) | **2.11.1** | `C:\Users\Darks\tools\apktool_2.11.1.jar` | Used only to independently re-decode resources |
| REA skill | v62, 255 tools | `C:\Users\Darks\.agents\skills\reverse-engineer-anything` | `state: aligned` |

## 2. Registration written by setup

`C:\Users\Darks\.dsh\cordis.patch.yml`:

```yaml
- insert:
    - id: rea-mcp
      name: "@deepseek-ai/dsh-mcp-client"
      config:
        serverName: rea
        transport: stdio
        command: C:\Users\Darks\AppData\Roaming\fnm\node-versions\v24.22.3\installation\node.exe
        args:
          - C:\Users\Darks\AppData\Roaming\fnm\node-versions\v24.22.3\installation\node_modules\rea-agents\scripts\rea.mjs
          - mcp
        env:
          JAVA_HOME: C:\Users\Darks\tools\jdk21\jdk-21.0.13+9
          REA_JADX_MCP_JAR: C:\Users\Darks\.local\share\rea\android\jadx-headless-mcp-0.7.1-all.jar
```

Why this location is correct: DSH composes each profile from its bundles, then the profile's own `cordis.patch.yml`, then the **home-level** `$DSH_HOME/cordis.patch.yml`, which is documented in the boot module as "machine-local preferences that apply to every profile, so it outranks the per-profile layer". REA registers at the home level, so it survives profile changes and does not touch the `desktop` profile file.

## 3. Doctor result

`rea doctor --client dsh --json`:

| Check | Result |
|---|---|
| Node | ✅ 24.22.3 |
| Host | ✅ win32 x64 |
| JADX | ✅ JAR validated, path recorded for registrations |
| Registration `dsh` | ✅ `state: aligned`, command identity `owned` |
| Hopper / Ghidra / IDA / Kuna | ⚪ not configured — optional providers, not required for APK work |
| Other clients (Claude, Codex, VS Code, …) | ⚪ not configured — expected, we targeted DSH only |

Top-level: `healthy: true`, `environment_healthy: false` (the latter simply reflects the optional providers above and is **not** a failure for this engagement).

## 4. Live MCP verification

The `rea` MCP server was up in the same session without a client restart, and answered real calls against the target:

| Call | Evidence ID | Result |
|---|---|---|
| `inspect_apk_signature` | `ev_7b6b117f…320223` (parent `ev_13085ede…ff180f`) | v1+v2, 1 signer, no v3/rotation/source-stamp |
| `inspect_android_package` | `ev_2147031d…2d6511` (parent `ev_01e96252…5aceb77`) | `com.coleta.ambientuus.debug`, 1.59-DEBUG, minSdk 23 / targetSdk 35, 11,250 classes, 1,167 resources |
| `inspect_android_method` | see `artifacts/EVIDENCE-INDEX.md` | Java bodies returned for app classes |

JADX worker: 1 thread, heap limit 26,304 MiB, engine 0.7.1, Java 21.0.13. Package inspection completed in ~15 s on a 54.7 MB / 17-DEX APK.

## 5. Reproduce / recover

```powershell
# health
rea doctor --client dsh --json

# refresh registration after moving Node or the JAR
$env:JAVA_HOME = 'C:\Users\Darks\tools\jdk21\jdk-21.0.13+9'
$env:REA_JADX_MCP_JAR = 'C:\Users\Darks\.local\share\rea\android\jadx-headless-mcp-0.7.1-all.jar'
rea setup --client dsh --yes

# remove
rea uninstall --client dsh
```

## 6. Residual risks (installation)

- The registration embeds an **absolute Node path** under fnm. If that Node version is removed or fnm is uninstalled, REA stops launching; `rea doctor` will show it. Re-run setup after changing Node.
- The JADX JAR lives in the user profile, not in a package manager. It is pinned by digest; re-verify the SHA-256 after any manual replacement.
- Windows x64 + JADX is supported by 6.9.0; the doctor's `install-scripts` warning about `frida` is unrelated to static APK analysis (Frida is only used for dynamic lanes).
