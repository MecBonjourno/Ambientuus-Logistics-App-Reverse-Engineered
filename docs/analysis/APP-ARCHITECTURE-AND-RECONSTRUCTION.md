# Ambientuus Coleta — Application Architecture & Reconstruction Plan

**Subject:** `app_coleta_ambientuus_hom_1.59 2.apk` (`com.coleta.ambientuus.debug`, 1.59)
**Date:** 2026-11-17
**Purpose:** Explain what the shipped app does, map its internals, and define a realistic path to a supported replacement now that the original source is unavailable.

> **Superseded for planning (2026-11-18):** the Android-only reconstruction plan is on hold. The
> multi-platform web + iOS/Android + Windows plan is in [docs/platform/README.md](../platform/README.md).
> This document remains a record of the Android-only analysis and effort estimate.

---

## 1. What the app does

A driver-facing Android app for **waste collection operations**: the driver selects a route and vehicle plate, scans barcode/QR labels on containers (bombonas) and collection points, records weights and MTR (waste-transport manifest) numbers, works offline against a local SQLite database, then synchronises reference data and collected records with an Oracle ORDS backend.

Primary user journeys recovered from the manifest and activities:

1. **Start shift** — `SelecaoActivity` → `MainActivity`: choose route, plate, driver, collection date.
2. **Scan** — camera + ML Kit barcode → `LeitorColetaActivity`, `LeitorEtiquetaActivity`, `LeitorBombonaActivity`, `ReaderLeitorActivity`, `PontoColetaEtiquetaActivity`.
3. **Weigh** — Bluetooth scale integration (`BluetoothConnector`, `BluetoothReader`, `BuscaDispositivoActivity` for pairing/serial device selection).
4. **Record** — collection, volume, manifest (MTR), type of residue, observation; written to `bf_coleta` and related tables.
5. **Container operations** — load/unload/collect bombonas (`CarregarBombonaActivity`, `BaixaBombonaActivity`, `LerBombonaActivity`), third-party containers (`TerceirosActivity`).
6. **Collection points** — list, cover, start collection, extras (`pontoColeta.*`).
7. **Sync** — pull reference data (drivers, routes, plates, points, residue types, volumes, screens, third parties, manifests) and push collections / container movements.
8. **Backup** — optional full-database upload to Google Drive (`DriveServiceHelper`).
9. **Admin** — hidden admin list of collections behind a password dialog (`TelaAdmActivity`).

## 2. Package map

```
com.coleta.ambientuus
├── activities/            22 screens (main, bombona, pontoColeta, readers, admin)
├── adapters/              13 list adapters
├── async/                 AsyncResponse callback
├── database/              DatabaseHelper (SQLiteOpenHelper, bf_app_ambientus.db)
│   └── managers/          14 table managers (create/insert/query per entity)
├── domain/model/          ModoSincronizacao, SyncState, TipoPesagem
├── dto/                   15 DTOs + list wrappers (Gson-mapped)
├── fragments/             4 fragments (date picker, label/manifest lists)
├── googleDrive/           GoogleSignInHelper, DriveServiceHelper
├── ui/                    MaterialAlertUtil, ProgressDialogHelper, SearchableSpinnerDialogHelper
├── utils/                 BluetoothConnector/Reader, PesagemPreferences, SyncStatus, UtilWs, styles
├── views/                 OverlayView (scanner overlay)
└── ws/                    RetrofitClient, ApiService, Repository
    └── Services/          14 services (one per endpoint + 2 uploaders)
```
128 application classes, 11,250 classes overall (libraries included).

## 3. Networking

**Client:** Retrofit 2 + Gson + OkHttp 3.14.9. One base URL, no interceptors, no auth, no pinning, 30/90/60 s timeouts.

**Base URL (hardcoded, cleartext):** `http://ambientuus-tipartner.ddns.com.br:8085/ords/portalcliente/appcoleta/`

| Method | Call | Direction |
|---|---|---|
| GET | `getBombonas()` | pull containers |
| GET | `getClientesMTR()` | pull MTR clients |
| GET | `getConsultaEtiqueta(String)` | look up a label |
| GET | `getManifesto(int, String)` | pull manifests |
| GET | `getMotorista()` | pull drivers |
| GET | `getPlacas()` | pull plates |
| GET | `getPontoColeta(int, String)` | pull collection points |
| GET | `getRotas()` | pull routes |
| GET | `getTelas()` | pull screen configuration |
| GET | `getTerceiros()` | pull third parties |
| GET | `getTipoResiduo()` | pull residue types |
| GET | `getVolumes()` | pull volumes |
| POST | `postBombona(MovimentoBombonaList)` | push container movements |
| POST | `postColeta(ColetaList)` | push collections |

Endpoint path literals observed in DEX: `coletas`, `manifesto`, `bombonas`, `motoristas`, `rotas`, `placas`, `terceiros`, `volumes`, `pontosColeta`, `telas`, `tipoResiduo`, `clientesMTR`, `insericoletas`, `inseriMovimentoBombona`.

**Sync sequence (recovered):** `MainActivity.sincronizarApp()` → `Repository` → for each service: `api.getX().execute()` → `XTableManager.insert(...)`; uploads build a `*List` wrapper and call `postColeta`/`postBombona` synchronously, logging failures.

## 4. Local data model

SQLite database `bf_app_ambientus.db` (plaintext, 14 tables). Example — `bf_coleta`:

```sql
CREATE TABLE bf_coleta (
  id_coleta INTEGER PRIMARY KEY AUTOINCREMENT,
  peso TEXT, numero_mtr TEXT, data_coleta TEXT,
  id_rota TEXT, id_volume TEXT, cliente_ausente TEXT,
  coleta_sem_residuo TEXT, coleta_extra TEXT, observacao TEXT,
  enviado TEXT, id_cliente_emite_mtr INTEGER, tipo_coleta TEXT,
  cod_bombona TEXT, data_envio TEXT, id_coleta_controlado TEXT,
  id_coleta_servidor INTEGER, cod_etiqueta TEXT,
  id_tipo_residuo INTEGER, id_volume_extra INTEGER,
  id_coleta_logradouro INTEGER, id_dia_coleta INTEGER
);
```

Related tables mirror the DTOs: bombona, cliente_mtr, etiqueta, manifesto, motorista, movimento_bombona, placas, ponto_coleta, rota, telas, terceiro, tipo_residuo, volume. `enviado` acts as the upload flag; `id_coleta_servidor` maps local rows to server ids.

**Preferences:** `ArquivoPreferencia` (date, route/driver/vehicle ids and labels) and `TIPO_PESAGEM` (weighing mode). Neither is encrypted.

## 5. Device integrations

- **Camera + ML Kit barcode scanning** (bundled models, on-device): label/QR reading, with a custom `OverlayView`.
- **Bluetooth** (classic SPP): scale/reader connection, device discovery (`BuscaDispositivoActivity`), read loop (`BluetoothReader`).
- **Audio**: success/error beeps (`beep_ok.mp3`, `beep_erro.mp3`).
- No WebView, no dynamic code loading, no wearable/print integration observed.

## 6. Reconstruction options

| Option | Description | Pros | Cons | Recommendation |
|---|---|---|---|---|
| **A. Native rewrite (Kotlin + Compose)** | Rebuild UI and domain on modern Android, new HTTPS API | Full control, Play/MDM ready, best device integration, maintainable | Highest effort; needs backend work in parallel | ✅ **Recommended** |
| B. Flutter / React Native | Cross-platform shell, native plugins for BT/camera | Faster UI iteration, one codebase for iOS later | BT SPP and scanner plugins need native work; team skills; still needs API rewrite | Consider if iOS is on the roadmap |
| C. Salvage decompiled code | Patch the recovered Java and recompile | Fastest "same app" | Poor quality, no tests, copyright/ownership ambiguity, unmaintainable; security defects persist | ❌ Not as a deliverable — use only as a specification |

The decompiled app is valuable as a **functional specification**: screen inventory, field lists, table schemas, sync semantics and device commands are all recoverable. It is not a codebase to ship.

## 7. Target architecture (recommended)

```
Android (Kotlin, minSdk 26, targetSdk 35)
  UI        Jetpack Compose, Navigation, Material 3
  Domain    Use cases + repository interfaces (clean-ish architecture)
  Data      Room (SQLCipher) + DataStore; WorkManager sync queue
  Network   OkHttp 4/5 + Retrofit, TLS only, certificate pinning
  Auth      OAuth2/OIDC (per driver), token in Keystore, refresh
  Device    CameraX + ML Kit; Bluetooth SPP wrapper with timeouts
  Security  Play Integrity, FLAG_SECURE, release signing (Play App Signing)
Backend
  API gateway (TLS, WAF, rate limit) → ORDS or new service
  OAuth2 provider, per-route authorisation, audit log, idempotent uploads
  Object storage for backups (server-side, encrypted, retention policy)
```

**Data migration.** The existing SQLite schema is a usable contract: export rows, map `id_coleta_servidor`/`enviado` to server ids, and replay unsent collections through the new idempotent upload endpoint. Keep a one-release compatibility window that still reads the old database.

## 8. Indicative effort

| Workstream | Estimate |
|---|---|
| Discovery: screen/field inventory from decompiled app + client interviews | 2 weeks |
| Backend contract, gateway, auth, ORDS mapping | 3–4 weeks (parallel) |
| Android MVP: login, route/plate selection, scan, collect, local DB, sync | 6–8 weeks (2 devs) |
| Full parity: bombonas, MTR, third parties, points, admin, Bluetooth scale, backup replacement | 4–6 weeks |
| QA, homologation, field pilot, migration rehearsal | 3 weeks |
| **Total (single stream)** | **~14–17 weeks** |

Assumptions: two Android developers, one backend developer, one QA; client provides API/schema access, device samples and MTR business rules. Estimates are indicative until discovery closes.

## 9. Information we need from the client

1. **Backend**: ORDS workspace credentials, schema/ERD, current endpoint documentation, hosting topology and who operates it.
2. **Signing**: the original keystore and passwords, or a written decision to rotate and re-onboard the fleet.
3. **Devices**: models, Android versions, Bluetooth scale/reader models and protocol notes, label symbology (Code128/QR) and printing process.
4. **Business rules**: MTR issuance rules, residue types, tolerance/rounding for weights, offline limits, who may use admin functions.
5. **Legal**: LGPD basis for driver/client data, retention, whether Google Drive backup is contractually required.
6. **Distribution**: Play Store, MDM, or sideload; fleet size and update logistics.
7. **Ownership**: confirm IP assignment from the previous developer for the app, data model and backend schema.

## 10. Immediate engineering decisions

- Freeze the debug build (see security assessment Phase 0).
- Stand up HTTPS in front of ORDS **before** any new driver is onboarded.
- Decide package identity now: `com.coleta.ambientuus` (release) with a documented migration from `…debug`.
- Treat `bf_coleta` and the DTOs as the canonical field contract for the rewrite.
