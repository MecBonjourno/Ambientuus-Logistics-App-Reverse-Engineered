# Ambientuus Coleta — APK Security Assessment

**Subject:** `app_coleta_ambientuus_hom_1.59 2.apk`
**Engagement:** Reverse engineering of the legacy Android field-collection app (source unavailable)
**Date:** 2026-11-17
**Analyst:** Lead agent, DeepSeek Harness + REA 6.9.0 (JADX 0.7.1) and apktool 2.11.1
**Classification:** Confidential — client deliverable
**Verdict:** **NOT PRODUCTION-READY.** The distributed build is a debuggable debug variant that sends regulated operational data over unauthenticated cleartext HTTP to a consumer DDNS host, with a hardcoded administrator password. It should not be used to fulfil new contractual obligations until the Phase 0 hotfixes are applied.

---

## 1. Executive summary

The APK in this repository is the field-collection app used by drivers to record waste collections, MTR manifest numbers, bombonas (containers), collection points and vehicle/route data. It stores everything locally in an unencrypted SQLite database and synchronises to an Oracle ORDS backend at `http://ambientuus-tipartner.ddns.com.br:8085/ords/portalcliente/appcoleta/`.

Four issues are **critical and individually sufficient** to block a production rollout:

1. **Every byte of operational data travels in cleartext** to a dynamic-DNS hostname on a non-standard port. The manifest explicitly opts back into cleartext traffic and defines no network-security policy.
2. **The app implements no authentication at all** — the HTTP client has no interceptors, no token, no client certificate, and every API call is an unauthenticated GET/POST. Anyone who obtains the APK (it is handed to third-party drivers) can reach the same endpoints.
3. **The build is debuggable** (`android:debuggable="true"`, `BUILD_TYPE=debug`, version `1.59-DEBUG`, application id `…debug`). On any non-rooted device, `adb run-as` exposes the app's private database, and a debugger can attach to the process.
4. **The administrator password is hardcoded** in the DEX (`@tenas66`) and checked only on the client, unlocking the admin collection view.

The signing key is a **self-signed personal certificate** (CN=Arthur Ermel / O=businessflex, valid 2021–2046) with no rotation lineage, so the previous developer individually controls the only key that can update the app — and that key cannot publish to Google Play. There is also a full-database backup to a **personal Google Drive account** via OAuth.

The app itself is small and well-structured (128 application classes), so a controlled rebuild is realistic; section 9 proposes a phased remediation that can stabilise the current app within days and replace it within a quarter.

## 2. Scope and method

| Item | Value |
|---|---|
| Artifact | `app_coleta_ambientuus_hom_1.59 2.apk` |
| Size / SHA-256 | 54,720,633 bytes / `94e4d8a5ce2b9c79fb44846e6237b632eb6546734cca5c74314c6d44faf1c1f5` |
| Package / version | `com.coleta.ambientuus.debug` / `1.59-DEBUG` (`versionCode` 59) |
| SDK | minSdk 23 (Android 6.0), targetSdk 35, compileSdk 35 |
| Code | 17 DEX files, 28.3 MB, **11,250 classes** (128 in the application package) |
| Resources | 1,167 entries; assets: ML Kit barcode models |
| Native | `libcronet.119.0.6045.31.so`, `libbarhopper_v3.so`, `libimage_processing_util_jni.so`, `libsurface_util_jni.so` (arm64-v8a, armeabi-v7a, x86, x86_64) |

**Method.** Static analysis, with REA's Android provider (JADX 0.7.1, pinned JAR) for manifest, signature and decompilation, plus apktool for independent resource decoding. No security-relevant runtime testing was performed and **no request was deliberately sent to the client's servers**. Separately, the extraction was rebuilt and smoke-tested on an isolated emulator to prove build fidelity (see [ORIGINAL-SOURCE-SNAPSHOT.md](../rebuild/ORIGINAL-SOURCE-SNAPSHOT.md)); that run exercised the normal startup UI only. Decompiled bodies are Java recovered from DEX; they are not original source and may have aliases or synthetic members.

**What this assessment cannot establish:** whether the ORDS endpoints currently enforce any server-side control, runtime TLS/certificate behaviour (there is no TLS), the true production backend topology, or signature validity (REA reports declared signing structures, it does not verify signatures cryptographically).

## 3. Risk register

| ID | Finding | Severity | Likelihood | Business impact |
|---|---|---|---|---|
| SEC-01 | Cleartext HTTP to hardcoded DDNS host | **Critical** | High | Data interception/tampering; LGPD incident |
| SEC-02 | No client authentication/authorisation | **Critical** | High | Unauthorised read/write of MTR and client data |
| SEC-03 | Debuggable build distributed | **Critical** | High | Full app-data extraction, debugger attach |
| SEC-04 | Hardcoded admin password (`@tenas66`) | **Critical** | High | Admin view on any device; no accountability |
| SEC-05 | `allowBackup=true` with no rules | High | Medium | DB copied via backup/cloud/transfer |
| SEC-06 | Personal self-signed signing key, no rotation | High | Medium | Cannot securely update; key-loss/compromise |
| SEC-07 | Full DB backup to personal Google Drive | High | Medium | Data egress to third-party accounts |
| SEC-08 | Unencrypted local SQLite database | Medium | Medium | Device loss/theft exposes client data |
| SEC-09 | Outdated HTTP/TLS and SDK components | Medium | Medium | Unpatched network stack (OkHttp 3.14.9, Cronet 119) |
| SEC-10 | Server error bodies logged | Low | Medium | Schema/error leakage via logcat |
| SEC-11 | `.debug` application id, no release pipeline | Medium | High | Cannot cleanly migrate or publish |
| SEC-12 | No integrity/anti-tamper checks | Low | Medium | Repackaged APK accepted by users |
| SEC-13 | No `FLAG_SECURE` on sensitive screens | Low | Low | Screen capture of PII/admin data |
| SEC-14 | minSdk 23 (Android 6) | Low | Low | Fleet devices without OS patches |

## 4. Detailed findings

### SEC-01 — Cleartext HTTP to a hardcoded DDNS endpoint (Critical)

**Evidence**

- `RetrofitClient.getClient()`: `new Retrofit.Builder().baseUrl("http://ambientuus-tipartner.ddns.com.br:8085/ords/portalcliente/appcoleta/")` — `ev_ec1166df19acc1775c6590e8bcdbc007c3fc976f9baa6427c9c8e96465850a87`
- `RetrofitClient.BASE_URL` static string and `UtilWs.URL_BASE` both hold the same URL — `ev_bf1c89bcdf964ce705d54435ffa71a6386d39eed902a5eac4bccc770fa235c6b`, `ev_3cc039cda106deead1dc8a6fc44c10723ed4a52b1d77c6422219bfa7e0ef554f`
- `BuildConfig.URL_BASE` — `ev_3932c67485422461515e36e7bd314bcbe2567f73d4ef3612aa0b619584ae136b`
- Manifest: `android:usesCleartextTraffic="true"`, **no** `android:networkSecurityConfig`, no `res/xml/network_security_config.xml` — `ev_2147031df3793cd83ac7147c811a3b0cfdcbb16d61053afc4833d587af2d6511`
- Independent apktool decode agrees: `AndroidManifest.xml` line 18.
- DEX string: `http://ambientuus-tipartner.ddns.com.br:8085/ords/portalcliente/appcoleta/inseriMovimentoBombona`

**Why it matters.** The host is a consumer dynamic-DNS name, not a corporate domain under certificate management, and the transport is HTTP on port 8085. Payloads include MTR (waste-transport manifest) numbers, client identities, weights, observations and collection timestamps. On shared warehouse/carrier Wi-Fi, any device can passively capture or actively modify this traffic (ARP/DNS spoofing, captive portal). Tampering with MTR data has legal, not just commercial, consequences in Brazil.

**Remediation.** Terminate TLS at a reverse proxy in front of ORDS with a certificate for an owned domain; move to `https://`; add `network_security_config` with `cleartextTrafficPermitted="false"`; remove `usesCleartextTraffic`; retire the DDNS name; add certificate pinning once the endpoint is stable.

### SEC-02 — No authentication or authorisation in the client (Critical)

**Evidence**

- `RetrofitClient.getClient()` constructs `new OkHttpClient.Builder()` with only timeouts (30 s connect, 90 s read, 60 s write) — **no `addInterceptor`, no `authenticator`, no default headers** — `ev_ec1166df…0a87`.
- `ApiService` exposes 14 endpoints; every parameter list contains only business data (no token/header argument) — `ev_cb9dbe2601f00ff4caa13187e18534f3aa9289ab5ee7ea27ba6188e33a6d3698`.
- `MotoristasService.sincronizar()`: `this.api.getMotorista().execute()` — no credentials — `ev_8676080578a710903642f7b1732adffd0bdd11aa3991840b0f41447f0d51f5a8`.
- `MovimentoBombonaService.enviarMovimentos()`: `this.api.postBombona(requestList).execute()` — no credentials — `ev_8f8d032cb3b56cf278a1205d20e65c64a6a64577fe6ea2d7741ef92add9a4389`.
- Endpoint paths are plain resource names (`motoristas`, `coletas`, `manifesto`, `bombonas`, `insericoletas`, `inseriMovimentoBombona`).

**Why it matters.** The APK is the credential. Because it is distributed to third-party drivers, the endpoints are effectively public to anyone who extracts the base URL (one `strings` command). There is no per-driver identity, no revocation, no rate limiting visible from the client, and no way to attribute an inserted collection to a device or person. Server-side authorisation may exist, but the client sends nothing to authorise with, so any control must rely on network position alone.

**Remediation.** Introduce authenticated API access: OAuth 2.0 device/authorisation-code flow per driver (short-lived access token, refresh token in Android Keystore), or mTLS with per-device certificates issued by MDM. Enforce authorisation server-side per route and per record, add idempotency keys for uploads, rate limits and audit logs. Never ship a shared secret in the APK.

### SEC-03 — Debuggable build in distribution (Critical)

**Evidence**

- `android:debuggable="true"` — manifest `ev_2147031d…6511`; apktool line 18.
- `BuildConfig`: `BUILD_TYPE="debug"`, `DEBUG=false`, `APPLICATION_ID="com.coleta.ambientuus.debug"`, `VERSION_NAME="1.59-DEBUG"` — `ev_3932c674…136b`.

**Why it matters.** A debuggable app permits `adb run-as com.coleta.ambientuus.debug` on any device with USB debugging authorised, which copies `/data/data/…/databases/bf_app_ambientus.db` (all collections, MTR numbers, client data) without root. It also allows JDWP attach for memory inspection and disables some platform hardening. Debuggable builds are rejected by Google Play and are a strong indicator that no release pipeline exists.

**Remediation.** Build a release variant (`debuggable=false`, minify with R8, separate `applicationId`), sign with the corporate release key, and gate distribution through MDM/Play. Never distribute `*debug*` artifacts.

### SEC-04 — Hardcoded administrator password (Critical)

**Evidence**

- `MainActivity.createDialogSenha()`: `if (verificaSenha.equals("@tenas66")) { startActivity(new Intent(this, TelaAdmActivity.class)); }` — `ev_9a007974491706a99408f151e9024e06b4b0971ffb7e00be211bbd2296f6766f`.
- `TelaAdmActivity.onCreate()` lists **all** collections from the local database (`ColetasADMAdapter`) — `ev_f41ce3f8fc5bcdfb874b282d8e600a40fa0a17e4730e17bbcb3126880c686aec`.
- The literal is present in the DEX string table.

**Why it matters.** The password is extractable with `strings` or any decompiler and is shared by every installation; it cannot be rotated without shipping a new APK. It grants an admin view of operational data on a shared field device with no audit trail. Client-side checks are not access control.

**Remediation.** Remove the local gate; move admin capability behind an authenticated server role; rotate the credential; if an on-device supervisor mode is genuinely required, derive it from a device-bound keystore key or a short-lived server-issued PIN, and log every entry.

### SEC-05 — Backup enabled without rules (High)

**Evidence.** Manifest `android:allowBackup="true"`, no `android:fullBackupContent`, no `android:dataExtractionRules` — `ev_2147031d…6511`.

**Why it matters.** With minSdk 23, the fleet includes Android 6–11 devices where `adb backup` can pull app data; on all versions Google Auto Backup and device-to-device transfer include the database and preferences because nothing is excluded. The database contains personal data (drivers, clients) and regulated MTR records.

**Remediation.** Set `allowBackup="false"`, or define `dataExtractionRules`/`fullBackupContent` that exclude `bf_app_ambientus.db` and any credential material; encrypt the database (SEC-08).

### SEC-06 — Signing identity is a personal self-signed key (High)

**Evidence** — `inspect_apk_signature` `ev_7b6b117fa29582ef76ca4313e06e6c959b843090f3d37c68de2298e356320223` (parent `ev_13085ede351182421d4e633079dd75eacbb23c48ed8da440f259364b3aff180f`) and `keytool -printcert`:

- v1 + v2 only; **no v3/v3.1**, no rotation lineage, no source stamp; strongest scheme v2; 4 uninterpreted bytes.
- Certificate: `CN=Arthur Ermel, O=businessflex, L=Sapiranga, ST=Rio Grande do Sul, C=55`, self-signed, serial `1318306f`, valid 2021-03-26 → 2046-03-20, RSA 2048 / SHA-256.
- Certificate SHA-256: `99F38497D61753657B25FC6415334A2156DF444FCC50304A34B18CBB2F7EB8F9` (v1 and v2 agree).

**Why it matters.** A single individual holds the only update key. If it is lost, the app cannot be updated in place; if it is misused, a malicious build is accepted as a legitimate update by every installed device (same package, same signer). Without v3 there is no rotation path. The app is also not Play-distributable in this state.

**Remediation.** Generate a corporate release key under dual control (HSM or offline + escrow), adopt Play App Signing if Play distribution is planned, add v3/v4 signatures and a rotation lineage, and document chain of custody. Treat the old key as compromised for planning purposes.

### SEC-07 — Full database backup to a personal Google Drive (High)

**Evidence**

- `DriveServiceHelper.backupDatabase()`: `GoogleAccountCredential.usingOAuth2(context, Collections.singleton("https://www.googleapis.com/auth/drive.file"))`, then `performBackup(...)` and `cleanOldFiles(...)` — `ev_80be555b78e879bcf74cf7390ce69613b9e2cba0130e7d90b6c31cbd2e6c1bc8`.
- `GoogleSignInHelper.signIn()` uses Android Credential Manager with `BuildConfig.ServerClientIdGoogleAuth` — `ev_b8f85c2028761f0b5765347112b2709c85891c901cf849fe81ab5db12f959474`.
- Google OAuth client id in resources: `903755048894-…apps.googleusercontent.com`.

**Why it matters.** The complete operational database — client names, MTR numbers, weights, observations — is copied into whichever Google account the operator signs in with. The `drive.file` scope limits the app to files it created, but it does not keep data inside the company. This is an international transfer to a third party under LGPD, with no visible retention policy, consent record or DPA, and no way for the company to enumerate or delete the copies.

**Remediation.** Disable this feature for production, or restrict it to corporate Workspace accounts with domain-wide delegation, DLP and retention; prefer server-side encrypted backup. Record purpose and legal basis, and add an explicit consent screen if the feature remains.

### SEC-08 — Unencrypted local database (Medium)

**Evidence**

- `DatabaseHelper`: `DATABASE_NAME="bf_app_ambientus.db"`, standard `SQLiteOpenHelper`, 14 tables — `ev_4d2565e5afe412e5751fc78c3893ff8551ff28a795e11d35ba96ca6f8a8a5a42`, `ev_cebe60b8c2ed3e644e1a37f6bc99cc059f01527cf2b62e3890c57a0daf75ff78`.
- `ColetaTableManager.createTable`: `bf_coleta (…, numero_mtr TEXT, …, observacao TEXT, …, enviado TEXT, …)` — `ev_481c29f1146a706b9ece4af8964f919bf134f53f68090bfbbe2101800f7c3212`.
- No SQLCipher/Keystore references in the application classes.

**Why it matters.** Loss or theft of a driver's device exposes the full operational dataset to anyone with filesystem access (rooted device, forensic extraction, debug build per SEC-03).

**Remediation.** Use SQLCipher (or encrypt sensitive columns) with a key wrapped by Android Keystore and gated by device credential/biometric; exclude the DB from backups; wipe on excessive failed unlocks if policy allows.

### SEC-09 — Outdated network and SDK components (Medium)

**Evidence.** `okhttp/3.14.9` user-agent constant in DEX (OkHttp 3.x is end-of-life); `libcronet.119.0.6045.31.so` (Chromium 119, late 2023); Play Services 18.x, ML Kit barcode 17.3.0; `minSdkVersion=23`. No dependency-update mechanism and no SBOM.

**Why it matters.** The HTTP/TLS stack is frozen at a 2020-era branch; Cronet at a browser release two years behind current. Missing upstream fixes accumulate silently, and no inventory exists to triage future CVEs.

**Remediation.** Upgrade to OkHttp 4.12+/5.x, remove or refresh Cronet, update Google/ML Kit dependencies, generate an SBOM and add dependency scanning to CI.

### SEC-10 — Verbose error logging (Low)

**Evidence.** `MovimentoBombonaService.enviarMovimentos()` logs `response.errorBody().string()` and `e.getMessage()` with tags `BOMBONA_ERRO`/`BOMBONA_FALHA` — `ev_8f8d032c…4389`.

**Why it matters.** ORDS error bodies can disclose schema names, SQL errors and record identifiers; on the debuggable build any USB-authorised host can read them.

**Remediation.** Log stable error codes without payloads in release builds; keep detailed logs behind a debug flag that cannot be enabled in production.

### SEC-11 — Debug application id and absent release engineering (Medium)

**Evidence.** `com.coleta.ambientuus.debug`, version `1.59-DEBUG`, `BUILD_TYPE=debug` — `ev_3932c674…136b`; versioned file name `…hom_1.59 2.apk` suggests manual homologation builds.

**Why it matters.** A future release under `com.coleta.ambientuus` installs as a different app: no in-place upgrade, data migration required, duplicate icons during transition. There is no traceable build pipeline, no changelog, no reproducible artifact — which also blocks a clean handover from the departed developer.

**Remediation.** Define the production `applicationId`, a signed release pipeline (CI), semantic versioning and an upgrade/migration path from the debug package.

### SEC-12 — No integrity or anti-tamper controls (Low)

**Evidence.** No SafetyNet/Play Integrity or root/tamper checks in application classes; class and method names are unobfuscated (128 app classes readable).

**Why it matters.** Repackaged APKs with altered base URL or admin password are trivial to produce and indistinguishable to users; the business logic is exposed to competitors.

**Remediation.** Play Integrity API attestation at sync time; signature verification on launch; R8 obfuscation for release.

### SEC-13 — No screenshot protection on sensitive screens (Low)

**Evidence.** No `FLAG_SECURE` in the admin or collection activities examined.

**Remediation.** Apply `WindowManager.LayoutParams.FLAG_SECURE` to admin and PII-heavy screens.

### SEC-14 — minSdk 23 (Low)

**Evidence.** `uses-sdk android:minSdkVersion="23"`.

**Why it matters.** Android 6.0 no longer receives platform patches; the fleet may include devices with outdated TLS/Keystore. Also enables `adb backup` behaviour relevant to SEC-05.

**Remediation.** Raise to API 26–28 if the fleet allows, and publish a supported-device matrix.

## 5. Attack scenarios

**A. Hostile Wi-Fi at a collection site.** An attacker on the same network passively captures HTTP traffic and obtains MTR numbers, client names and weights; or injects a forged `inseriMovimentoBombona` request to create phantom container movements. No credentials are needed at any point.

**B. Any driver with a USB cable.** The APK is debuggable, so `adb run-as` copies the SQLite database; the same cable lets a debugger attach and dump in-memory data. The hardcoded admin password unlocks the admin list on the device itself.

**C. Departed-developer key.** The only update path is controlled by an individual outside the company. A malicious update signed with that key (or a leaked keystore) would be accepted by every device; losing the key strands the fleet with no upgrade path.

**D. Personal cloud.** Operators who enable Drive backup push the operational database into personal Google accounts, where the company has no visibility or deletion capability.

## 6. Positive observations

- `targetSdkVersion=35` — current Android compatibility.
- Only the launcher activity is exported; app components are non-exported, and the two library exports are system-permission guarded (`DUMP`-protected profile receiver; signature-level sign-in revocation service).
- No WebView JavaScript bridge, no dynamic code loading, no overlay/accessibility abuse in the application package.
- ML Kit barcode scanning runs on-device; no camera frames leave the device.
- `extractNativeLibs="false"` (modern packaging).
- v2 signature present alongside v1, and both agree on the signer.
- The app is small and modular: 128 classes across `activities`, `ws`, `database`, `dto`, `utils`, `googleDrive` — a rebuild is tractable.

## 7. Compliance mapping

| Framework | Relevant findings |
|---|---|
| **LGPD** Art. 6, 33, 46, 48 | Cleartext transport of personal/business data (SEC-01/02), international transfer to Google (SEC-07), missing technical safeguards (SEC-03/05/08), incident detection/notification readiness |
| **CONAMA 313 / SINIR (MTR)** | Integrity and authenticity of manifest records (SEC-01/02/04) |
| **Google Play policy** | Debuggable, self-signed APK is not publishable (SEC-03/06) |
| **OWASP MASVS** | NETWORK-1/2 (SEC-01), STORAGE-1/2 (SEC-05/07/08), CRYPTO-1 (SEC-08), PLATFORM-2 (SEC-04), RESILIENCE-1/2 (SEC-03/12) |
| **ISO/IEC 27001** A.8.24–8.28, A.5.19–5.22 | Key custody (SEC-06), supplier/source-code handover, secure development (SEC-11) |

## 8. Remediation roadmap

### Phase 0 — Stop the bleeding (0–7 days)

1. Freeze distribution of the `-DEBUG` APK; rebuild as a release variant (`debuggable=false`, `allowBackup=false`, `usesCleartextTraffic=false`), even before functional changes.
2. Put an HTTPS reverse proxy with a valid certificate (owned domain) in front of ORDS; switch `BASE_URL` to HTTPS; add `network_security_config` denying cleartext.
3. Add a stopgap API credential (per-device token issued at onboarding, rotated server-side) and rate limiting at the proxy; block direct access to port 8085 from the internet.
4. Rotate the admin password; disable the admin dialog in production builds.
5. Restrict `/ords` exposure by IP allow-list/VPN at the edge.

### Phase 1 — Hardening (30–60 days)

6. Replace the stopgap with OAuth 2.0/OIDC per driver + server-side authorisation and audit trail; add idempotency to uploads.
7. Encrypt the local database (SQLCipher, Keystore-wrapped key), exclude it from backup, add `dataExtractionRules`.
8. Disable or corporate-govern the Drive backup; document LGPD basis and retention.
9. Certificate pinning, Play Integrity, R8, `FLAG_SECURE`, release-safe logging, dependency upgrades (OkHttp 4/5, SDK refresh), SBOM.

### Phase 2 — Replace (60–90 days)

10. Rebuild on a supported stack with CI/CD, corporate signing (Play App Signing or MDM), offline-first sync, migration from `bf_app_ambientus.db`, and a documented API contract. See [APP-ARCHITECTURE-AND-RECONSTRUCTION.md](APP-ARCHITECTURE-AND-RECONSTRUCTION.md).

## 9. Indicators for monitoring

| Indicator | Value |
|---|---|
| Package | `com.coleta.ambientuus.debug` |
| Backend host | `ambientuus-tipartner.ddns.com.br:8085` (path `/ords/portalcliente/appcoleta/`) |
| Signer cert SHA-256 | `99F3 8497 D617 5365 7B25 FC64 1533 4A21 56DF 444F CC50 304A 34B1 8CBB 2F7E B8F9` |
| Google OAuth client (web) | `903755048894-pkcg2hc4f49ckn2qdsdegvo78imiui5c.apps.googleusercontent.com` |
| Google OAuth client (Android) | `903755048894-rnt9c9dcece0no3ipun5etu80f8o9fbo.apps.googleusercontent.com` |
| Local DB | `bf_app_ambientus.db` |
| Admin literal | `@tenas66` (treat as compromised) |

## 10. Limitations of this assessment

- Static analysis: no traffic capture, no dynamic instrumentation, no server-side testing. The only runtime activity was the build-fidelity smoke test described above.
- Signature **not** cryptographically verified by the tool; findings describe declared structures.
- Decompiled code is reconstructed Java; aliases and inlining may differ from original source.
- Server-side controls are unobservable from the APK; SEC-02 states that the client authenticates nothing, not that the server accepts everything.
- Reachability of the DDNS endpoint was deliberately not tested.

---

**Evidence index:** [../../artifacts/EVIDENCE-INDEX.md](../../artifacts/EVIDENCE-INDEX.md)
**Machine-readable artifacts:** `artifacts/strings/`, `artifacts/apktool/`, `artifacts/rea-evidence-bundle.json`
