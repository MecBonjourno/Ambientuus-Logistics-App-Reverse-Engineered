# Delivery Plan, Migration & Risk

**Status:** Proposed for approval  
**Date:** 2026-11-18  
**Companion documents:** [PLATFORM-ARCHITECTURE.md](PLATFORM-ARCHITECTURE.md), [LEGACY-APP-SPEC.md](LEGACY-APP-SPEC.md)

---

## 1. Delivery strategy

Do not build four apps in sequence. Build **one vertical slice end to end**, then widen.

### 1.1 The tracer bullet (first 6-8 weeks)

One route, one driver, one stop, one label, one weighing, one sync batch, one web dashboard tile, and one Windows capture screen:

~~~text
dispatcher publishes route
  -> driver logs in on Android
  -> app pulls route/stop/manifest/label
  -> driver scans label, weighs on a real scale, saves offline
  -> app syncs a batch (idempotent)
  -> dispatcher sees the collection and totals on the web
  -> Windows app reads the same record and prints a receipt
~~~

This proves the hard parts (auth, offline DB, camera, scale, sync, ORDS adapter, web read model) before the team builds dozens of screens.

### 1.2 Parallel tracks after the slice

- **Web/ops track:** dashboard, dispatch, master data, reports, admin.
- **Mobile track:** route, scanners, containers, exceptions, sync UX.
- **Desktop track:** Tauri shell, local DB, serial/BLE scale, USB scanner, printing, updater.
- **Platform track:** API modules, sync, ORDS adapter, audit, observability.
- **Design/QA track:** field UX, design system, device lab, pilot.

### 1.3 Delivery principles

- Ship a usable pilot to one depot before full parity.
- Keep the old app and legacy adapter running during the pilot.
- Every week, test on a real low-end Android device and a real scale.
- No feature is "done" until it works offline, syncs, and is visible in the web console.
- Every schema/API change is backward compatible for at least one mobile release.
- Prefer manual/admin fallbacks over blocking a field workflow.

---

## 2. Assumptions and team

### 2.1 Assumptions

- The client provides ORDS credentials, schema/ERD, and sample responses by the end of Phase 0.
- The client provides at least one real scale of each model, a barcode scanner, a label printer, and representative Android devices.
- The initial deployment is single-tenant for Ambientuus, but the data model is multi-tenant.
- The fleet is primarily Android; iOS is required but may be phased if scales are Classic-only.
- Portuguese (pt-BR) is the only language for v1.
- The legacy app remains available during the transition; no big-bang cutover.
- Hosting/data residency in Brazil is required or strongly preferred.

### 2.2 Recommended team

| Role | Allocation | Responsibility |
|---|---|---|
| Tech lead / architect | 1.0 | Architecture, API/domain, code review, client decisions |
| Full-stack web/API | 1.0 | Next.js, API modules, reports, admin |
| Mobile engineer | 1.0 | Expo app, offline DB, camera, BLE/Classic, sync UX |
| Rust/desktop engineer | 1.0 | Tauri core, SQLite, serial/BLE, printing, updater |
| Product designer | 0.5 | Field UX, design system, usability tests |
| QA/automation | 0.5-1.0 | Test strategy, device lab, E2E, release validation |
| DevOps/security | 0.25-0.5 | CI/CD, infra, observability, pen-test coordination |
| Client domain expert | 0.25 | Business rules, MTR/label/scale validation, pilot |

A 4-5 person core team can deliver the pilot in roughly 4-5 months and full parity in roughly 6-8 months. A solo developer should plan 12-18 months.

### 2.3 Local toolchain prerequisites

| Tool | Current workspace | What to install |
|---|---|---|
| Node + pnpm | Node 24.14 and pnpm 10.33 available | Keep Node 24 LTS; pin with `.nvmrc`/Corepack |
| Rust | Not on PATH | rustup, stable 1.90+, MSVC C++ build tools, WebView2 (Windows 10/11) |
| JDK / Android SDK | Not on PATH | JDK 21 + Android Studio/SDK, or use EAS Build for cloud builds |
| iOS toolchain | Not available on Windows | macOS + Xcode, or EAS Build cloud (recommended) |
| Docker | Not installed | Optional; use managed Postgres/Redis or install Docker Desktop for local dependencies |
| Windows signing | Not set up | OV/EV code-signing certificate and CI secret |

---

## 3. Phase plan

Durations are ranges for a 4-5 person team, not commitments. They assume Phase 0 access to ORDS and hardware.

### Phase 0 - Discovery, decisions and foundations (2-3 weeks)

**Objective:** remove the unknown unknowns before committing to a build.

Deliverables:

- Approved architecture and ADRs (web, mobile, desktop, backend, sync).
- ORDS access/schema/sample responses; documented gaps.
- Hardware compatibility report: Android scale, iOS BLE/MFi, Windows serial/BLE, barcode scanners, printers.
- Legacy DB profiling: table sizes, duplicate rates, date/format anomalies, unresolved clients/labels.
- Screen/feature map and MVP scope sign-off.
- API contract v0.1 and ERD v0.1.
- Design tokens and 5 key mobile screens (Today, Route, Stop, Collect, Sync).
- Monorepo scaffold, CI, local Docker Compose, environments.
- Security/LGPD kickoff: data map, subprocessors, retention questions.

Exit criteria:

- The client confirms ORDS system-of-record strategy (keep vs replace vs mirror).
- The scale/iOS decision is made or explicitly deferred with a plan.
- The MVP/non-goals list is signed off.
- The team can run web/API/mobile/desktop "hello world" through CI.

### Phase 1 - Platform core (4-5 weeks)

**Objective:** identity, tenancy, master data, and the web shell.

Deliverables:

- Auth/OIDC, device registration/revocation, RBAC, tenant isolation.
- Postgres schema/migrations for tenants, users, clients, points, drivers, vehicles, routes, route days, stops, manifests, labels, containers, collections, audit, change log.
- API modules for master data, routes, bootstrap/sync read path.
- Web shell: login, navigation, dashboard skeleton, master-data CRUD, route/stop list.
- Design system v1 (tokens, tables, forms, empty/error states).
- ORDS adapter skeleton + recorded fixtures/mock.
- Observability baseline (logs, metrics, traces, Sentry).
- CI/CD to staging; backups; migration workflow.

Exit criteria:

- A dispatcher can create/import clients, points, drivers, vehicles, routes, and publish a route day.
- A driver record can authenticate and fetch a route via API.
- Tenant isolation and audit tests pass.
- Staging is deployable from main with one command.

### Phase 2 - Field vertical slice (5-7 weeks)

**Objective:** one real route, captured offline on Android, synced, visible on web.

Deliverables:

- Expo app shell, auth, device registration, SQLite/SQLCipher, migrations.
- Today/Route/Stop/Collect screens for normal collection.
- Camera scanning (label/container/MTR), manual fallback.
- Bluetooth Classic scale integration on Android + simulator.
- Local outbox, sync push/pull, retry/backoff, sync status UI.
- Server collection validation, idempotency, change log, audit.
- Web dashboard tile/route progress + collection detail.
- ORDS publish of accepted collections (or mock if access delayed).
- Field test script + first pilot with 2-3 drivers.

Exit criteria:

- 50 collections captured offline on a real device, synced with zero duplicates/loss.
- Dispatcher sees the route progress and totals within one sync interval.
- Scan-to-save under 2 seconds on a mid-range Android device.
- App survives kill/restart/reboot with pending outbox intact.
- Scale reads and manual entry produce identical stored weights.

### Phase 3 - Desktop slice (4-5 weeks, overlaps Phase 2)

**Objective:** prove the Rust/Windows path with the same data.

Deliverables:

- Tauri 2 app shell, Windows installer, auto-update, code signing setup.
- Local SQLite/SQLCipher + sync engine (same protocol) in Rust.
- Field mode: route, scan (USB HID/camera), serial/BLE scale, collect, sync.
- Office mode: read-only dashboard/collections, CSV export.
- PDF receipt/MTR generation + Windows printing spike.
- Diagnostics/log export.
- Tauri E2E smoke test in CI/Windows runner.

Exit criteria:

- Installer runs on a clean Windows 10/11 machine.
- Offline capture + sync works with the same backend.
- Serial scale reads and prints a receipt.
- Auto-update from a signed artifact works in staging.

### Phase 4 - Parity and operations (5-7 weeks)

**Objective:** cover the legacy workflows and the operational console.

Deliverables:

- Full collection variants: normal, extra, absent, no-waste.
- Label ranges, next-label advancement, manifest/client validation.
- Container lifecycle: allocate, load, collect, third-party, release, inventory.
- Point cover/status/finalize/partial/edit/delete.
- MTR/DC lists with gross/net totals, manifest search, QR lookup.
- Web dispatch: route board, map, assignments, publish, exceptions.
- Web master data: manifests, labels, containers, residue types, volumes, third parties, users/roles.
- Reports: route progress, collections, weight reconciliation, CSV/XLSX/PDF exports.
- Admin/audit UI; feature flags/screen config.
- Legacy adapter (old 14 endpoints) + legacy DB importer + reconciliation report.
- Background sync, conflict resolution UX, diagnostics.
- Security hardening: pen test fixes, rate limits, CSP, certificate pinning, audit review.
- Accessibility pass and pt-BR copy review.

Exit criteria:

- Feature parity checklist (legacy spec section 10) is green or explicitly waived.
- Legacy DB dry-run imports with a signed reconciliation report.
- One depot completes a full week in dual-run with no data loss.
- Pen test has no open critical/high findings.

### Phase 5 - Pilot, migration and rollout (4-6 weeks)

**Objective:** move from a working product to an operated service.

Deliverables:

- Pilot with 1 depot / 5-15 drivers for 2-4 weeks.
- Daily reconciliation old vs new; defect triage; field feedback.
- Migration runbook per device and per depot.
- Support runbook, on-call, incident response, status page.
- Training materials: driver quick card, dispatcher guide, admin guide.
- App Store/Play/MDM submissions; Windows signing/SmartScreen; update channels.
- Performance/load test at target fleet size; capacity plan.
- LGPD/DPIA sign-off; retention jobs; backup restore drill.
- Cutover decision and rollback plan.

Exit criteria:

- 100% of pilot devices migrated; zero unresolved unsynced records.
- Crash-free sessions > 99.5%; sync success > 99%; p95 API < 300 ms.
- Client sign-off on reconciliation and support model.
- Rollback rehearsed and documented.

---

## 4. Timeline

| Month | Phase | Main outcome |
|---|---|---|
| 1 | Phase 0 | Decisions, access, hardware proof, scaffold |
| 2 | Phase 1 | Auth, master data, web shell, API core |
| 3 | Phase 2 (start) + Phase 3 (start) | Android offline slice; Windows shell |
| 4 | Phase 2/3 | Real route pilot slice; desktop scale/print |
| 5 | Phase 4 | Parity: containers, labels, reports, migration |
| 6 | Phase 4/5 | Hardening, dual-run, pilot |
| 7 | Phase 5 | Rollout, training, cutover |
| 8 | Buffer | Contingency, remaining depots, stabilisation |

A realistic range is **6-8 months** for a 4-5 person team. The first usable pilot slice is **10-14 weeks** from kickoff if ORDS/hardware access is available. If ORDS access is delayed, the mock adapter keeps the team moving but pushes integration and cutover.

---

## 5. Work breakdown and effort

Rough person-weeks (planning ranges; re-estimate after Phase 0):

| Workstream | Person-weeks | Notes |
|---|---|---|
| Discovery, architecture, design system | 6-8 | Includes hardware/LGPD/ORDS discovery |
| API/domain/Postgres/sync | 18-24 | Largest backend workstream |
| Web console/portal | 16-22 | Master data, dispatch, reports, admin |
| Mobile app | 22-28 | Offline, camera, Bluetooth, UX, store builds |
| Desktop app | 18-24 | Tauri, Rust core, serial/BLE, printing, updater |
| ORDS adapter + legacy importer | 6-8 | Depends heavily on access/schema |
| QA/automation/security | 10-14 | Device lab, E2E, pen test coordination |
| DevOps/observability | 5-7 | CI/CD, infra, monitoring, backups |
| Pilot/training/rollout | 6-8 | Field support, migration, training |
| **Total** | **~107-143 person-weeks** | 4-5 FTE over 6-8 months, plus contingency |

Add **20-30% contingency** for ORDS surprises, hardware incompatibility, app-store review, and scope changes.

### 5.1 Cost ranges (excluding team)

| Item | Indicative |
|---|---|
| Cloud/DB/storage/monitoring (pilot) | US$300-1,500/month |
| Vercel Pro / EAS / Sentry / maps | US$200-800/month |
| Apple Developer Program | US$99/year |
| Google Play Console | US$25 one-time |
| Windows code-signing certificate (OV/EV) | US$300-700/year |
| Test devices/scales/printers | US$2,000-6,000 one-time |
| External pen test | US$5,000-15,000 |
| LGPD/legal review | Client-side/legal budget |

These are planning numbers, not quotes.

---

## 6. Migration and cutover

### 6.1 Preconditions

- ORDS access and sample data.
- At least one real legacy device DB copy (anonymised) for profiling.
- Agreement on which records are authoritative (ORDS vs legacy device).
- All devices have synced or exported their unsynced rows.
- Pilot depot and drivers selected; support contact named.

### 6.2 Migration path

1. **Profile** the legacy DB: row counts, date formats, duplicate labels, orphan clients, container state mismatches.
2. **Build the importer** (CLI) with dry-run and JSONL output; verify SHA-256 of the source.
3. **Reconcile** counts, sums, per-route totals, and status distributions.
4. **Import** into staging; run the web reports; compare to legacy admin lists.
5. **Pilot** one depot in dual-run: old app and new app both capture; compare daily.
6. **Cut over** one depot at a time; keep the legacy adapter for a bounded window.
7. **Archive** the old DB encrypted; delete per retention policy after sign-off.

### 6.3 Device migration runbook

For each device:

1. Ensure the old app has uploaded all unsent collections/movements (enviado = S), or export the DB.
2. Record device id, driver, route, last sync time, pending counts.
3. Install the new app (MDM/Play/TestFlight); register device; log in.
4. Pull the route for the day; verify stop count and manifest/label counts against the old app.
5. Capture a test collection offline; sync; verify in web.
6. Mark the device migrated; keep the old app installed but logged out for one week.
7. Revoke the old device/credentials; remove the old app per policy.

### 6.4 Rollback

- Keep the old app and legacy adapter available for the pilot window.
- New app writes are additive; do not delete legacy data until reconciliation is signed off.
- If a depot rolls back, stop new writes, export new records, reconcile, and resume old app; document the incident.
- Database migrations are expand/contract; a rollback must not require a destructive down-migration.

---

## 7. QA and field pilot

### 7.1 Test matrix

| Layer | What | Tooling |
|---|---|---|
| Unit | Weight/tare, labels, state machine, idempotency | Vitest, cargo test |
| Contract | OpenAPI schemas, generated clients | Schemathesis/openapi-diff, compile checks |
| Integration | Postgres/Redis/S3/ORDS mock | Testcontainers, fixtures |
| Sync | Offline N days, duplicates, conflicts, clock skew | Deterministic simulator |
| E2E web | Login, dispatch, master data, reports | Playwright |
| E2E mobile | Route, scan, collect, sync | Maestro + device farm |
| E2E desktop | Install, capture, print, update | tauri-driver/WebdriverIO |
| Load | 1k devices, batch uploads, reports | k6 |
| Security | AuthZ, tenant isolation, injection, secrets | SAST/DAST, pen test |
| Accessibility | Web WCAG 2.2 AA, mobile labels | axe, manual |

### 7.2 Field pilot script

- 8-hour shift, offline for at least 4 hours.
- 50+ collections across normal, extra, absent, no-waste.
- At least 10 label-range creations, 5 container movements of each type.
- Deliberate duplicate scan, wrong label, wrong manifest, scale disconnect, app kill, device reboot, low battery.
- Sync over weak 3G, then Wi-Fi; verify per-item results and retries.
- Dispatcher reconciles totals and statuses at end of day.
- Driver feedback: gloves, sunlight, one hand, typing, error messages.

### 7.3 Performance budgets

| Metric | Target |
|---|---|
| Mobile cold start | < 3 s on mid-range Android (4 GB RAM) |
| Scan-to-save | < 2 s |
| Route list 500 stops | < 1 s scroll, paginated/virtualised |
| Sync 1,000 events | < 30 s on stable network |
| API p95 | < 300 ms (excluding exports) |
| Web dashboard first load | < 2.5 s on 4G |
| Desktop installer | < 15 MB (WebView2 bootstrapper separate) |
| Crash-free sessions | > 99.5% |

---

## 8. Risk register

| # | Risk | Prob. | Impact | Mitigation |
|---|---|---|---|---|
| R1 | ORDS access/schema/sample data delayed or unavailable | High | High | Contract-first mock adapter; Phase 0 escalation; build against fixtures; time-box integration |
| R2 | Legacy scales are Classic-only; iOS cannot use them | High | High | Week-1 hardware spike; BLE/MFi alternative; Android-first; iOS supervisor mode; do not promise iOS field parity until proven |
| R3 | Legacy data quality/duplicates/orphans | High | Medium | Profile real DB; dry-run import; reconciliation report; quarantine unresolved rows |
| R4 | Offline conflicts/duplicate uploads | Medium | High | Idempotency keys, unique constraints, sync simulator, per-item results, conflict UX |
| R5 | Scope creep (portal, billing, AI, optimisation) | High | Medium | MVP/non-goals sign-off; change control; phase gates |
| R6 | App Store/MDM/signing delays | Medium | High | Start accounts/CI early; TestFlight/Play internal; EV cert lead time; MDM pilot |
| R7 | LGPD/data residency/subprocessors | Medium | High | DPIA, Brazil hosting, DPA review, retention, remove personal Drive backup |
| R8 | Low-end device performance/battery | Medium | Medium | Device lab, budgets, FlashList, pagination, image compression, background limits |
| R9 | Rust/Tauri team ramp-up | Medium | Medium | Phase 0 spike, templates, pair programming, Dioxus fallback |
| R10 | Printing/label hardware variability | Medium | Medium | Printer matrix, PDF/ZPL abstraction, test with client devices |
| R11 | Next.js/RSC complexity or Vercel lock-in | Low | Medium | Keep API separate, client components for interactive screens, Docker/self-host |
| R12 | Real-time tracking privacy concerns | Medium | Medium | Feature flag, opt-in, shift-only, coarse precision, retention, DPIA |
| R13 | ORDS API changes without notice | Medium | High | Adapter versioning, contract tests, monitoring, fallback queue |
| R14 | Key-person dependency | Medium | Medium | Document ADRs/runbooks, pair on critical paths, code review |

Top three to resolve before build: **R1 (ORDS), R2 (iOS scale), R3 (data quality)**.

---

## 9. Decisions needed

| # | Decision | Recommended default | Why it matters |
|---|---|---|---|
| D1 | Is ORDS the system of record, a downstream mirror, or replaced? | New Postgres is canonical; ORDS is an integration until proven otherwise | Determines sync direction, migration, and reporting |
| D2 | Is iOS a full field app or supervisor/office? | Full field only if BLE/MFi scales are available; otherwise Android-first with iOS supervisor | Determines mobile scope, hardware, and timeline |
| D3 | Is "Rust desktop" satisfied by Tauri (Rust core + React UI)? | Yes; strict Rust-only fallback = Dioxus | Determines desktop stack and UI reuse |
| D4 | Is the web platform internal-only or also customer-facing? | Operations console first; customer portal as a fast-follow | Determines Next.js vs TanStack Start and auth model |
| D5 | Multi-tenant now or later? | tenant_id from day one, single tenant initially | Avoids a painful migration |
| D6 | Hosting/data residency | Brazil (São Paulo), managed Postgres/S3 | LGPD, latency, cost |
| D7 | Distribution | Play + App Store + MDM; Windows MSI/NSIS | Signing, review, update policy |
| D8 | Legacy app transition | 90-day legacy adapter + dual-run | Cutover risk and security exposure |
| D9 | Auth provider | OIDC; managed IdP or Keycloak | SSO/MFA/ops burden |
| D10 | Maps | MapLibre + vector tiles; no offline maps in MVP | Cost, offline, vendor lock-in |

If the client cannot answer D1-D3 before kickoff, proceed with the recommended defaults and mark them as reversible in Phase 0.

---

## 10. Immediate next two weeks

### Week 1

- Review this plan with the client; confirm D1-D4.
- Request ORDS credentials, schema/ERD, and sanitised sample responses for all 14 endpoints.
- Collect hardware: Android devices, iPhone, Windows laptop/tablet, scales, scanners, printers.
- Run the hardware spike: Classic SPP on Android/Windows, BLE on iOS, serial on Windows; record raw frames.
- Copy one legacy device DB (with consent) for profiling.
- Create the monorepo scaffold and CI skeleton.
- Draft the API contract v0.1 and ERD v0.1.

### Week 2

- Build the ORDS mock adapter with fixtures.
- Build the legacy DB profiler/dry-run importer.
- Design the 5 key mobile screens and the web dashboard shell.
- Stand up staging (Postgres, Redis, S3/MinIO, API, web).
- Write the first ADRs and the migration runbook skeleton.
- Decide the pilot depot and drivers.
- Run a 1-day field observation with a driver (shadowing, no code changes).

### Deliverables by end of week 2

- Signed-off scope and architecture.
- Hardware compatibility report (go/no-go for iOS).
- ORDS gap report.
- Legacy data quality report.
- Clickable mobile/web prototype.
- Running staging environment.
- Phase 1 backlog with estimates.

---

## 11. Definition of done

A feature is done when:

- It works offline, syncs, and is visible in the web console.
- It has unit/contract/E2E coverage appropriate to risk.
- It handles errors, retries, and empty/loading states in pt-BR.
- It is accessible (web WCAG 2.2 AA, mobile labels/touch targets).
- It is observable (logs/metrics/traces, no PII).
- It is documented (API, runbook, ADR if architectural).
- It has been tested on a real low-end device and, where relevant, a real scale/printer.
- It has a rollback/feature-flag path.
- The client domain expert has accepted the business rules.

---

## 12. What to build first (ordered)

1. API contract + database schema + auth/tenancy.
2. ORDS mock + legacy DB profiler.
3. Expo shell + SQLite + bootstrap/route/stop screens.
4. Android camera + Classic SPP scale + collection + outbox + sync.
5. Web dashboard + route progress + collection detail.
6. Tauri shell + installer + local DB + serial scale + collection + sync.
7. Label ranges + manifests + point cover/status.
8. Container lifecycle.
9. Reports + admin/audit.
10. Legacy adapter + importer + pilot migration.
11. Hardening, pen test, store/MDM, rollout.

This order keeps the riskiest integrations early and produces a usable pilot before the long tail of parity work.
