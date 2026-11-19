# Target Platform Architecture & Technology Decisions

**Status:** Proposed for approval  
**Date:** 2026-11-18  
**Supersedes (for now):** the Android-only reconstruction plan in [`APP-ARCHITECTURE-AND-RECONSTRUCTION.md`](../analysis/APP-ARCHITECTURE-AND-RECONSTRUCTION.md)  
**Input:** recovered behaviour in [`LEGACY-APP-SPEC.md`](LEGACY-APP-SPEC.md) and the security findings in [`APK-SECURITY-ASSESSMENT.md`](../analysis/APK-SECURITY-ASSESSMENT.md)

---

## 1. Decision in one page

Build **one product platform**, not four unrelated apps:

| Surface | Recommendation | Why |
|---|---|---|
| Web platform | **Next.js 16.4 (App Router, React 19.3)** | Best fit for an authenticated operations console plus public/customer pages (the customer portal is a fast-follow); strong SSR/streaming, server actions, ecosystem, and React reuse with the desktop UI. |
| iOS + Android | **Expo SDK 58 / React Native 0.88** | Fastest path to a high-quality cross-platform field app with offline SQLite, camera scanning, secure storage, OTA updates, and a native escape hatch for Bluetooth. |
| Windows desktop | **Tauri 2.12: Rust core + React UI** | Small signed installer, Windows hardware access in Rust, auto-update, and reuse of the web design system. Strict-Rust fallback: Dioxus 0.7. |
| Backend | **TypeScript API (Fastify) + PostgreSQL + Redis/BullMQ + S3** | Owns the difficult domain: sync, idempotency, audit, ORDS integration, reporting. Shares schemas/types with web and mobile; Rust desktop consumes a generated client. |
| Legacy Oracle ORDS | **Anti-corruption adapter, not the platform database** | The legacy API has no auth, no idempotency, no delta sync, and an unknown schema. Keep it as an integration until the client decides whether ORDS remains the system of record. |
| Sync | **Custom outbox + change-cursor protocol** | The domain is asymmetric (server-authoritative reference data, append-only field events). A generic sync engine adds semantics and vendors we do not need. |

**One-sentence architecture:** a TypeScript/React product surface (Next.js, Expo, Tauri) on a contract-first TypeScript API and PostgreSQL, with Rust owning Windows-native and hardware-heavy work, and Oracle ORDS isolated behind an adapter.

This is a **Rust-first desktop**, not a Rust-only product. If the requirement is literally "no JavaScript in the Windows app", choose Dioxus instead of Tauri (section 6.2).

**Team-fit caveat:** this stack assumes the team can staff React/TypeScript engineers and at least one Rust-capable engineer. If the team is Dart- or Kotlin-only, Flutter or Kotlin Multiplatform may deliver faster despite weaker code sharing with the web/desktop surfaces; revisit the choice before committing.

---

## 2. Goals and non-goals

### 2.1 Goals

1. Replace the Android-only field app with a supported platform that has a web operations console, an iOS/Android field app, and a Windows desktop app.
2. Preserve the operational rules that make the business work: routes by weekday, MTR/DC validation, label ranges, weight/tare, container state machine, exceptions, offline capture, sync.
3. Make the platform safe enough to operate: authentication, authorisation, audit, encrypted local data, TLS, LGPD-aware retention.
4. Make the platform extensible: multi-tenant from day one, feature flags, custom fields, integration adapters, reporting read models.
5. Keep field capture fast and reliable on low-end devices and poor networks.
6. Make migration from the legacy SQLite database and ORDS possible without losing or duplicating records.

### 2.2 Non-goals for the first release

- Route optimisation / vehicle routing solvers.
- Offline maps and turn-by-turn navigation.
- Customer self-service portal in the pilot (fast-follow after operations stabilise; the data model supports it).
- Customer invoicing, fiscal documents, or payments.
- Live telematics, driver scoring, or continuous GPS tracking.
- AI/ML features (weight anomaly detection, photo classification).
- A fully offline web driver app (see section 4.4).
- White-label multi-brand theming, multiple languages, or a public marketplace.
- Replacing Oracle ERP functions that ORDS exposes.

These can be added later because the architecture keeps the domain, API, and integrations separate from the surfaces.

---

## 3. Architecture principles

1. **Never lose a field record.** Capture writes to local storage first; network is an optimisation, not a requirement.
2. **Server-authoritative reference data, append-only field events.** Routes, clients, manifests, and containers come from the server. Collections and movements are facts that are appended, not silently overwritten.
3. **Idempotency everywhere.** Every client-generated record has a stable id and an idempotency key; retries are safe.
4. **One canonical domain, many surfaces.** Web, mobile, and desktop use the same API contract and the same validation vocabulary. UI components are shared where the rendering technology allows it.
5. **Anti-corruption at the edges.** Oracle ORDS, Google Drive, printers, scales, and future ERPs are adapters. They do not leak into the domain model.
6. **Boring infrastructure, modular monolith.** One API deployable and one worker deployable first; split only when measurements demand it.
7. **Security and audit by default.** RBAC, tenant isolation, encrypted storage, signed releases, and an append-only audit trail are part of the first release, not a hardening phase.
8. **Design for the field.** Gloves, sunlight, one hand, intermittent connectivity, low battery, and low-end Android phones are design constraints.
9. **Contract-first.** OpenAPI is generated from the same schemas the API validates; clients are generated or type-checked against it.
10. **Measure before optimising.** Performance budgets, sync telemetry, and field pilot metrics decide where Rust or caching is needed.

---

## 4. Web platform decision

### 4.1 Decision

Use **Next.js 16.4** with the App Router, React 19.3, TypeScript, Tailwind CSS, and a component system based on Radix/shadcn. Deploy either on Vercel in the São Paulo region (`gru1`) or self-host the standalone build in containers in Brazil.

Use Next.js for:

- the authenticated operations console (dashboard, dispatch, master data, reports, admin);
- the customer portal as a fast-follow (collections, MTRs, weights, downloads, extra-collection requests);
- public marketing/landing pages, if the client wants them;
- thin BFF route handlers for auth/session concerns only.

Do **not** put domain rules in Server Actions or route handlers. They call the API like every other client. This keeps mobile/desktop and web on one contract and prevents a Next.js upgrade from becoming a domain rewrite.

Next.js 16.4 makes **Cache Components** the recommended caching model and enables it by default for new apps. Use it deliberately: public/static pages can be cached, but authenticated dashboards must stay dynamic or use per-user cache keys. Never put personalized data behind a shared `use cache` boundary without a user-specific key.[^next16]

### 4.2 Evaluation matrix

| Criterion | Next.js 16.4 | TanStack Start | SvelteKit | Vite SPA + API |
|---|---|---|---|---|
| Public pages / SEO | Best | Good | Best | Weak |
| Complex authenticated dashboards | Good | Best | Best | Best |
| Server rendering / streaming | Best | Good | Good | None |
| React reuse with desktop | Best | Best | None | Best |
| Ecosystem, hiring, templates | Best | Good | Good | Best |
| Type-safe routing/data | Good | Best | Good | Good |
| Operational simplicity | Good | Best | Best | Best |
| Offline/PWA support | Good | Good | Good | Good |
| Risk of framework churn | Medium | Medium | Low | Low |

**Why Next.js wins for this scope:** the platform is not only an internal dashboard. It needs a public/customer-facing portal, SEO for public pages, server-side auth/session handling, and the broadest React ecosystem. Next.js 16.4 also brings Cache Components, React 19.3, Turbopack memory/build improvements and Instant Navigations, plus a mature App Router story.[^next16]

**When TanStack Start would be better:** if the web app is strictly an authenticated internal console, the team wants Vite-speed iteration and end-to-end type safety, and no public/SEO pages are planned. It is a credible alternative, not a wrong choice. Keep it as the fallback if Next.js RSC complexity becomes a delivery risk. React Router framework mode occupies a similar position; it is also credible, but does not change the tradeoff against Next.js for public/customer pages.

**Why not SvelteKit:** excellent framework, but it gives up React/TypeScript component reuse with the Tauri desktop app and has a smaller hiring pool for this stack.

**Why not a plain Vite SPA:** simplest to host, but weak for public pages, SEO, and server-side session/auth. It is the right choice only if the web platform is a pure internal tool with no public surface.

### 4.3 Next.js risks and mitigations

| Risk | Mitigation |
|---|---|
| React Server Components add a learning curve and blur client/server boundaries | Keep data access in a typed API client; use client components for tables, maps, and forms; document the boundary in the repo. |
| Caching semantics changed in Next 16; Cache Components is now recommended/default for new apps | Keep auth-sensitive routes dynamic; use per-user cache keys and explicit `use cache` only for safe, measured cases; add regression tests for tenant/user data leakage. |
| Vercel coupling / data residency | Keep the API separate; support `output: "standalone"` Docker deployment in AWS São Paulo from day one. |
| Long-lived build memory | Use Turbopack and the 16.4 memory improvements; CI builds on a machine with enough RAM. |
| Token exposure in the browser | Use Authorization Code + PKCE through a Next.js route handler; store tokens in encrypted, httpOnly, SameSite cookies; never localStorage. |

### 4.4 Web offline position

The web console is **online-first**. A PWA can cache the shell and read-only data, but it will not be the primary field-capture surface:

- Web Bluetooth is Chromium-only and BLE-only; Safari/iOS has no native Web Bluetooth.
- The BarcodeDetector API is Chromium-only; Safari does not enable it by default.
- Classic Bluetooth SPP scales are not reachable from a browser.
- Background sync and durable offline storage are possible (OPFS + SQLite WASM), but the hardware and OS integration story is not reliable across the fleet.

If a browser-based driver mode is ever required, scope it as a Chromium kiosk/tablet "lite" mode with a USB HID scanner and manual weight entry. Do not promise iOS Safari field capture with Bluetooth.

---

## 5. Mobile decision

### 5.1 Decision

Use **Expo SDK 58** (React Native 0.88, React 19.3) with:

- Expo Router for navigation;
- `expo-sqlite` + Drizzle ORM for the local database, with SQLCipher enabled;
- `expo-secure-store` for tokens and the database key;
- `expo-camera` for barcode/QR scanning;
- `expo-background-task` / TaskManager for best-effort sync;
- `expo-updates` for JS-only fixes;
- `expo-dev-client` + EAS Build because the Bluetooth module is a custom native dependency;
- `react-native-bluetooth-classic` (Android) and `react-native-ble-plx` (BLE) behind a hardware abstraction layer.

Expo SDK 58 is current as of November 2026 and requires the New Architecture; Expo Go cannot run custom native Bluetooth modules. Plan for development builds and EAS from day one.[^expo58]

The community Classic SPP module may lag the React Native New Architecture. Budget 1-2 weeks for a small Kotlin Expo module that exposes the SPP socket if the library fails on SDK 58. Do not let the app architecture depend on one third-party module.

React Native 0.88 makes the Strict TypeScript API the default and SDK 58 uses the iOS 27 scene lifecycle. Budget a short typing/native-template migration: deep imports from `react-native/Libraries/*` become type errors, refs use instance types such as `ViewInstance`, and custom `AppDelegate` code may need scene-lifecycle updates.

### 5.2 Evaluation matrix

| Criterion | Expo / React Native | Flutter | Kotlin Multiplatform + Compose | Rust mobile (Tauri/Dioxus) |
|---|---|---|---|---|
| Offline SQLite | Strong | Strong | Strong | Medium |
| Camera / barcode | Strong | Strong | Good | Weak/medium |
| BLE | Strong | Strong | Strong via native | Weak |
| Classic Bluetooth SPP | Android community module; iOS no | Android community module; iOS no | Android via expect/actual; iOS no | Very weak |
| Background sync | Good (OS-limited) | Good | Good | Limited |
| UI performance | Good (New Architecture/Hermes) | Excellent | Excellent | Good |
| Code sharing with web | Best (TypeScript/React) | None | None (Kotlin) | Partial (web UI) |
| OTA updates | EAS Update (excellent) | Shorebird/self-managed | Self-managed | Limited |
| Ecosystem / hiring | Best | Excellent | Good | Emerging |
| App-store/MDM maturity | Best | Best | Good | Medium |
| Team fit | React/TS | Dart | Kotlin | Rust |

**Why Expo wins:** the platform is already betting on TypeScript and React for web/desktop. Expo gives the fastest path to a polished field app, a large plugin ecosystem, and a native escape hatch for the one hard integration (Classic Bluetooth). The New Architecture/Hermes is more than fast enough for forms, lists, scanning, and sync; Rust would not make the UI meaningfully faster for this workload.

**When Flutter would be better:** if the team is Dart/Flutter-native, if the app is graphics-heavy, or if native hardware plugins become the dominant risk. Flutter is an excellent mobile choice; it just gives up TypeScript/React reuse and does not help the web/desktop requirement.

**When Kotlin Multiplatform would be better:** if the client has Android/iOS native teams and wants shared business logic with native UI. Compose Multiplatform is production-viable, but the web/desktop story and the Rust requirement make it a poorer fit for this specific scope.

**Why not Rust mobile:** Tauri mobile and Dioxus mobile are real, but the camera, BLE/Classic Bluetooth, background execution, app-store tooling, and accessibility ecosystems are not mature enough for a safety-critical field app. Use Rust where it has clear leverage: the Windows desktop core, the scale protocol, and optionally a shared validation kernel.

**Why not Capacitor around the web app?** It is tempting for code reuse, but it inherits the web's hardware limits (no generic Classic SPP, weaker background sync, browser storage constraints) and gives a less native field experience. It is a reasonable option for a customer-facing portal or an internal tablet console, not for the primary driver app.

**Why not one Flutter codebase for all three surfaces?** Flutter is excellent for mobile, but Flutter web is canvas-based and a poor fit for an SEO/public/customer portal and accessible data-dense dashboards; Flutter Windows would also conflict with the Rust desktop requirement. A single codebase sounds cheaper, but these three surfaces have different input, distribution, accessibility, and hardware constraints. Expo + Next.js + Tauri shares the parts that matter (TypeScript domain, API contract, design tokens) without forcing one rendering model everywhere.

### 5.3 The iOS/Bluetooth decision (critical)

The legacy app uses **Bluetooth Classic SPP**. On iOS, Classic SPP requires MFi certification and the External Accessory framework; generic SPP is not available to third-party apps. BLE is available cross-platform.

Therefore:

- **If the client's scales are Classic-only:** Android and Windows can talk to them; iOS cannot, unless the scale vendor provides an MFi-certified model or a BLE bridge. Do not promise a full iOS field app until the hardware is tested.
- **If the client can standardise on BLE scales:** iOS, Android, and Windows can all support the field flow, and the mobile app can be genuinely cross-platform.
- **If the fleet is Android-only in practice:** build the best Android app first; ship iOS as a supervisor/office app (view routes, collections, reports) until BLE/MFi hardware is available.

This is a Phase 0 hardware spike, not a Phase 3 surprise.

### 5.4 Mobile distribution

- **Android:** Play Store internal/closed testing, then production or MDM-managed private app. Target API 36 for new apps; Android 12+ Bluetooth permissions; Android 14+ foreground-service rules.
- **iOS:** TestFlight, then App Store or MDM custom app. Expo SDK 58 builds against the iOS 27 SDK; verify the exact minimum deployment target in Phase 0 (plan for iOS 16.4+ and confirm older devices). Plan privacy manifest, encryption export compliance, camera/Bluetooth usage strings.
- **OTA:** EAS Update for JS/assets; native changes require a store build. Keep a minimum-supported-version gate in the API.
- **MDM:** managed app configuration for API URL/tenant; per-device registration; remote revocation.

---

## 6. Windows desktop decision

### 6.1 Decision

Use **Tauri 2.12** with a Rust core and a React/Vite front-end.

Rust owns:

- local SQLite (SQLCipher) and migrations;
- sync engine/outbox;
- scale protocols (serial SPP, BLE);
- USB HID / serial barcode scanner handling;
- PDF/label generation and Windows printing;
- secure storage (DPAPI/Windows Credential Manager);
- file import/export;
- auto-update signature verification;
- native diagnostics and logging.

The UI is React + TypeScript in the system WebView2, reusing the web design system. This is the pragmatic meaning of "developed using Rust": the application's native core, data, hardware, and update path are Rust; only the presentation layer is web technology.

Tauri 2.12 is current (November 2026), requires Rust 1.90+, and targets Windows 10 1803+ with WebView2.[^tauri212] It produces MSI/NSIS installers, supports signed auto-updates, and has a plugin ecosystem for the pieces above.

### 6.2 Evaluation matrix

| Criterion | Tauri 2.12 | Dioxus 0.7 | egui/eframe | Slint | WinUI 3 (C#) |
|---|---|---|---|---|---|
| Rust core / native work | Best | Best | Best | Best | None |
| UI reuse with web | Best (React) | None (RSX) | None | None | None |
| Complex forms/tables | Best | Good | Medium | Good | Best |
| Printing/PDF | Rust crates | Rust crates | Rust crates | Rust crates | Native |
| Serial/BLE/HID | Rust crates/plugins | Rust crates | Rust crates | Rust crates | Native |
| Installer/updater | Best | Good | Good | Good | Best |
| Ecosystem/maturity | Best | Good | Good | Good | Best |
| Binary size | Small | Small | Small | Small | Medium |
| Main risk | WebView/JS policy | Younger UI ecosystem | Tool-like UI | GPL/commercial licensing | Not Rust |

**Why Tauri wins:** it gives the best combination of Windows-native capability, a small signed installer, an auto-update path, and reuse of the React design system. It also keeps the desktop app on the same API contract as web/mobile.

**Strict-Rust alternative:** **Dioxus 0.7** is the credible choice if the client requires no JavaScript in the Windows app. Dioxus 0.7 added a WGPU-based native renderer and improved desktop/mobile bundling, but its component/table/printing ecosystem is younger than React's. Choose Dioxus only after a 1-week spike proves the required screens (dense tables, forms, PDF preview, printing) are practical.

**Why not egui:** excellent for internal tools and diagnostics, but not for a polished, accessible business app with complex forms and printing.

**Why not Slint:** strong for embedded/industrial HMIs, but licensing and DSL constraints are a poor fit for a general business desktop app.

**Why not WinUI 3:** best Windows integration, but violates the Rust requirement and gives up code/design reuse.

### 6.3 Desktop product shape

Two responsive modes in one app:

- **Field mode:** touch-first, large controls, scan-first, offline capture, scale connection, sync status. For rugged Windows tablets/laptops.
- **Office mode:** dense tables, bulk import/export, route dispatch, manifest/label printing, reconciliation, reports, device admin. For dispatchers and back-office staff.

Windows specifics:

- Pair Classic SPP scales in Windows; they appear as COM ports and are read with the `serialport` crate.
- BLE scales use `btleplug`.
- USB HID barcode scanners act as keyboards; capture in a focused scan field or use raw HID via the `windows` crate for global capture.
- Camera scanning uses WebView2 `getUserMedia` plus a JS barcode library; USB scanners are the fallback.
- Printing: generate PDF with Rust (`printpdf`/`typst`) and send to the Windows spooler; label printers use ZPL/TSPL over TCP/USB.
- Installer: NSIS `setup.exe` and MSI; code signing (OV/EV certificate); signed updater artifacts; silent install for MDM.
- Security: restrictive CSP, Tauri capability allowlist, no remote content, encrypted DB, DPAPI-wrapped key, signed updates.

---

## 7. Backend and data decision

### 7.1 Decision

Build a **modular monolith API** in TypeScript:

- **Fastify 5** + Zod validation + OpenAPI 3.1;
- **PostgreSQL 17+**;
- **Redis + BullMQ** for jobs/queues;
- **S3-compatible object storage** for attachments and exports (São Paulo region);
- Drizzle ORM/migrations;
- OpenTelemetry + Sentry + structured logs;
- Docker deployment in Brazil (AWS `sa-east-1` or equivalent).

Start with one API service and one worker service. Split modules only when scaling or team boundaries require it.

### 7.2 Evaluation matrix

| Criterion | Supabase-only | TypeScript API + Postgres | Rust API + Postgres | ORDS-only |
|---|---|---|---|---|
| Auth/RBAC | Built-in | Build or integrate OIDC | Build or integrate OIDC | None |
| Complex sync/idempotency | RPC/Edge Functions, awkward | Best | Best | Weak |
| ORDS integration | Edge Functions | Best (worker/adapter) | Best | Direct but unsafe |
| Audit/legal reporting | RLS + triggers | Best | Best | Weak |
| Speed to MVP | Best | Good | Medium | Best |
| Control / lock-in | Low | Good | Best | Low |
| Ops burden | Low | Medium | High | Low |
| Team fit | TypeScript | TypeScript | Rust | Java/PLSQL |

**Why a custom API:** the hard parts are not CRUD. They are idempotent sync, per-item validation, audit, legacy mapping, ORDS publishing, reconciliation, and reporting. Those belong in a domain layer with tests, not in database policies or edge functions.

**Supabase is still useful:** use it as managed Postgres/Auth/Storage in São Paulo if it accelerates the team, but keep the domain in the API. Do not make Supabase RPCs the only implementation of business rules. Subject the DPA/subprocessors to LGPD review.

**Why not Rust for the API now:** Rust would be excellent for throughput and for sharing a domain crate with desktop, but it slows down auth, admin, reporting, and integration work. Revisit Rust for a high-volume sync/telemetry service once the domain is stable; the API contract makes that extraction safe.

**Why not ORDS-only:** no client authentication, no schema control, no idempotency, no delta sync, and no audit. It is an integration endpoint, not a platform.

### 7.3 Data residency and hosting

- Primary database and object storage in **Brazil (São Paulo)**.
- Web/API compute in Brazil where possible; CDN at the edge for static assets.
- Backups encrypted, tested, and retained per contract; cross-region only if LGPD/contract allows.
- No production PII in development/staging; use anonymised fixtures.
- Document subprocessors (hosting, email, SMS/WhatsApp, crash reporting, maps) and their data locations.

### 7.4 Auth

Recommended: **OIDC/OAuth 2.1 authorization code + PKCE** with a managed IdP or self-hosted Keycloak/Zitadel.

- Web: Authorization Code + PKCE via Next.js route handler; tokens in encrypted httpOnly cookies.
- Mobile/desktop: system browser + PKCE + deep link; access token in memory, refresh token in Keychain/Keystore/DPAPI.
- Short-lived access tokens (10-15 min), rotating refresh tokens (30 days), device binding, remote revocation.
- Admin accounts require MFA/passkeys.
- Service integrations use scoped API keys or mTLS, never a shared APK secret.

If the team wants the fastest MVP, a TypeScript auth library (Better Auth/Auth.js) or Supabase Auth is acceptable, provided the API still enforces authorization and the tokens are standard OIDC/JWT. Do not invent a custom password store.

---

## 8. Shared code and contract strategy

### 8.1 What is shared

| Layer | Shared? | How |
|---|---|---|
| Domain vocabulary/types | Yes | `packages/domain` with Zod schemas and TypeScript types |
| Validation rules | Yes (server authoritative) | Same Zod refinements on server; clients use them for UX; server re-validates |
| API client | Yes | `packages/api-client` generated from OpenAPI; web/mobile/desktop use it |
| Design tokens | Yes | CSS variables/Tailwind theme + React Native token export |
| React UI components | Web + desktop | `packages/ui` (React DOM, Tailwind, Radix) |
| React Native UI | Mobile only | RN primitives + tokens; do not force React DOM components into RN |
| Rust domain kernels | Desktop (+ optional mobile) | `crates/`; scale protocol, weight/label rules, sync validation |
| Rust API client | Desktop | Generated from OpenAPI (`progenitor`/reqwest) |

### 8.2 Contract-first workflow

1. Define request/response schemas in `packages/domain` (Zod).
2. Generate OpenAPI 3.1 from those schemas in the API build.
3. Generate TypeScript types/client for web/mobile; generate/compile the Rust client for desktop.
4. Run contract tests: every endpoint validates against the schema; generated clients compile; fixtures round-trip.
5. Version additively (`/v1`); deprecate with headers and a published window.

**Why not share React components with mobile:** React DOM and React Native have different primitives, layout, accessibility, and gesture models. Sharing them usually produces a worse app on both sides. Share tokens, logic, and API types instead.

### 8.3 Rust kernels

Start with:

- `crates/scale-protocol`: legacy 150-byte frame parser, BLE frame parser, golden test vectors, simulator.
- `crates/desktop-core`: Tauri commands, SQLite, sync, printing, secure storage.

Optional later:

- `crates/domain-rules`: weight/tare/label/state-machine rules compiled to native, WASM, and UniFFI for mobile. Only do this if duplication becomes a real defect source; the TypeScript rules are the reference until then.

---

## 9. Target system architecture

### 9.1 Container diagram

~~~text
+-----------------------------+
| Oracle ORDS / ERP (legacy)  |
+--------------+--------------+
               | server-side adapter
               | TLS, allow-list, credentials
               v
+-----------------------------+        +----------------------+
| Web (Next.js)               |        |                      |
+-----------------------------+        |  PostgreSQL          |
| Mobile (Expo)               |------->|  (Sao Paulo)         |
+-----------------------------+        |                      |
| Desktop (Tauri)             |        +----------------------+
+--------------+--------------+
               |
               v
+-----------------------------+        +----------------------+
| API (Fastify)               |------->| Redis / BullMQ       |
| identity, master data,      |        +----------------------+
| routes, collections, sync   |
+--------------+--------------+        +----------------------+
               |---------------------->| S3 (attachments)     |
               v                       +----------------------+
+-----------------------------+
| Worker: ORDS publish,       |
| exports, notifications      |
+-----------------------------+
~~~

### 9.2 Components

| Component | Responsibility | Technology |
|---|---|---|
| `apps/web` | Operations console, customer portal, public pages | Next.js 16.4, React 19.3, Tailwind, shadcn/Radix, TanStack Query/Table, MapLibre |
| `apps/mobile` | Driver field app | Expo SDK 58, Expo Router, expo-sqlite/Drizzle, expo-camera, BLE/Classic modules |
| `apps/desktop` | Windows field/office app | Tauri 2.12, Rust core, React/Vite, shared UI |
| `apps/api` | Domain API, auth, sync, reporting, admin | Fastify 5, Zod, Drizzle, Postgres, OpenAPI |
| `services/worker` | Async jobs, ORDS publish, exports, notifications, cleanup | Node/BullMQ or a Rust worker for specific adapters |
| `services/legacy-adapter` | Temporary old-API compatibility gateway | Fastify/Node, time-boxed |
| `crates/desktop-core` | Desktop native core | Rust, Tauri, rusqlite/sqlx, reqwest, serialport, btleplug |
| `crates/scale-protocol` | Scale frame parsing and test vectors | Rust + fixtures |
| `packages/domain` | Schemas, types, rules, enums, fixtures | TypeScript/Zod |
| `packages/api-client` | Generated API client | OpenAPI + openapi-fetch |
| `packages/ui` | Web/desktop design system | React DOM, Tailwind, Radix |
| `packages/config` | Lint, TS, Tailwind, build presets | Shared config |
| `packages/i18n` | pt-BR strings, date/number formats | JSON/TypeScript |
| `infra` | Docker Compose, Terraform, migrations, CI | IaC |

### 9.3 Web route groups

```text
app/
  (public)/            marketing, status, legal
  (auth)/              login, callback, MFA, reset
  (app)/               authenticated shell
    dashboard/
    routes/
    collections/
    containers/
    manifests/
    reports/
    admin/
    settings/
  (portal)/            customer portal (scoped by client)
  api/                 thin BFF: session, uploads, webhooks
```

### 9.4 Mobile navigation

```text
Today (home)
  - shift status, route progress, sync badge
  - primary action: continue route / start collection
Route
  - stop list, map, search, filters
  - stop detail -> label range -> collect -> finalize
Collect
  - scanner, weight, volume, residue, notes
  - normal / extra / absent / no-waste
Containers
  - allocate, load, collect, third-party, release
  - scan history, state
History
  - collections, MTR/DC totals, sync errors
Settings
  - scale pairing/test, diagnostics, sync, logout
```

### 9.5 Desktop navigation

- **Field mode:** Today, Scan/Collect, Containers, Sync.
- **Office mode:** Dashboard, Dispatch, Master data, Manifests/Labels, Containers, Reports, Admin, Diagnostics.
- Switch modes by role/device configuration, not a separate installer.

---

## 10. Canonical domain model

### 10.1 Modelling choices

- **Tenant everywhere.** `tenant_id` on every business table, even for the first single-tenant deployment. This is the cost of future SaaS expansion.
- **UUIDv7** for new ids. Time-ordered, client-generatable, safe to expose.
- **Legacy ids are external ids.** Keep `legacy_id` and `legacy_source` on imported rows; never reuse legacy numeric ids as primary keys.
- **Weight in integer grams.** Avoid floating point for legal weights. Display kg with comma separator. API exposes both `weightG` (exact) and `weightKg` (formatted string/decimal).
- **Business date vs timestamp.** `collection_date` is a `date`; `occurred_at`/`received_at` are `timestamptz`. Do not overload one string as the legacy app does.
- **Soft delete + tombstones** for sync. Hard delete only via retention jobs.
- **Audit and change log** are append-only. Do not update history rows.
- **Custom fields** as `jsonb` on clients, points, collections, and containers for future expansion.

### 10.2 Table groups

| Group | Tables |
|---|---|
| Tenancy/identity | `tenants`, `users`, `memberships`, `roles`, `devices`, `sessions`/`refresh_tokens` |
| Master data | `clients`, `client_units`, `drivers`, `vehicles`, `third_parties`, `residue_types`, `volume_types` |
| Routes | `routes`, `route_days`, `route_stops`, `shifts` |
| Manifests/labels | `manifests`, `manifest_items`, `labels`, `label_ranges` |
| Containers | `containers`, `container_movements` |
| Collections | `collections`, `collection_attachments`, `collection_discrepancies` |
| Sync | `change_log`, `idempotency_keys`, `sync_batches` (server-side), client outbox (local) |
| Audit/integration | `audit_log`, `integration_jobs`, `legacy_imports`, `files`, `notifications` |
| Feature config | `feature_flags`, `screen_configs` |

### 10.3 Key entities

**Client / collection point**

- `clients`: code, legal name, trade name, CNPJ, status, contacts, custom fields.
- `client_units`: client, code, address, geo, schedule/periodicity, residue type, default volume type, manifest, status.
- The legacy `bf_ponto_coleta` maps to a `client_unit` plus a `route_stop` for a date.

**Route / route day / stop**

- `routes`: code, name, weekday mask, default driver/vehicle.
- `route_days`: route + date + driver + vehicle + status + published_at.
- `route_stops`: route_day + client_unit + sequence + planned window + status + manifest.
- A stop is a dated execution of a client unit, not a permanent property of the client.

**Manifest**

- `manifests`: number, type (MTR/DC), client, generator, destination, issued_at, status.
- `manifest_items`: residue type, quantity/unit.
- `labels`: code, manifest, status, assigned_at.
- `label_ranges`: manifest, start, end, created_by.

**Container**

- `containers`: code/barcode, volume type, owner client, status, last movement.
- `container_movements`: type, container, client/third party, route_day/shift, occurred_at, recorded_at, device, geo, notes.
- Movement type enum: `allocate`, `load`, `collect`, `unload_third_party`, `release`, `adjust`.
- Derive current status from the latest valid movement; keep a cached status column for queries, but make the event log authoritative.

**Collection**

- `collections`: one row per weighing/exception, not one row per stop.
- Fields: client, client_unit, route_day, stop, shift, manifest, label, container, residue type, volume type, gross weight g, tare g, net weight g, type (normal/extra/absent/no_waste), status, occurred_at, recorded_at, device, notes, geo, legacy_id.
- `collection_attachments`: photo/signature, object key, hash.
- A stop's status is derived from its collections/labels, not duplicated blindly.

**Shift**

- Driver, vehicle, route_day, start/end, odometer, status.
- A device can have one open shift at a time; the server enforces it.

### 10.4 Status enums (proposed)

| Entity | Values |
|---|---|
| Collection | `draft`, `pending_sync`, `synced`, `accepted`, `rejected`, `voided`, `reconciled` |
| Stop | `pending`, `in_progress`, `collected`, `no_waste`, `client_absent`, `skipped`, `done` |
| Container | `available`, `loaded`, `at_client`, `collected`, `at_third_party`, `returned`, `lost`, `maintenance` |
| Manifest | `draft`, `open`, `in_progress`, `closed`, `cancelled` |
| Route day | `draft`, `published`, `in_progress`, `completed`, `closed` |
| Shift | `open`, `closed` |
| Device | `active`, `revoked` |
| Sync item | `pending`, `syncing`, `synced`, `failed`, `conflict` |

Map legacy statuses explicitly in the migration layer: `000->pending`, `100->in_progress`, `200->collected`, `500->no_waste`, `600->client_absent`, `900->done`.

---

## 11. Offline-first sync protocol

### 11.1 Why custom

The data is asymmetric:

- **Reference data** (routes, clients, manifests, labels, containers) is server-authoritative and read-mostly.
- **Field events** (collections, movements, shifts, attachments) are append-only and created offline.
- **Conflicts** are rare but must be explicit: duplicate label, duplicate collection, invalid container transition, route changed after download.

A generic bidirectional sync engine would add a conflict model we do not control. A small, explicit protocol is easier to audit, test, and explain to the client.

### 11.2 Client state

Each device stores:

- `device_id` (registered, revocable);
- `sync_cursor` (last change sequence applied);
- `bootstrap_version` / tenant id;
- local tables mirroring the server;
- `outbox` with ordered items and retry metadata;
- `sync_state` (last attempt, last success, pending count, last error).

### 11.3 Pull

1. On first login or tenant change: `GET /v1/sync/bootstrap?routeDayId=&date=`.
   - returns global dictionaries, the selected route day, stops, manifests, labels, containers, feature flags, server time, minimum app version.
2. On later syncs: `GET /v1/sync/changes?cursor=&limit=`.
   - returns changed/deleted rows in `seq` order, plus `nextCursor` and `hasMore`.
3. Apply in a single SQLite transaction per page; update `sync_cursor` only after commit.
4. Tombstones delete/flag local rows; never resurrect deleted reference data.
5. If the cursor is too old (change log compacted), server returns `410` with a bootstrap requirement.

### 11.4 Push

1. Capture writes the domain row and an outbox item in one transaction.
2. Outbox item:
   ```json
   {
     "clientId": "019...uuidv7",
     "type": "collection.created",
     "idempotencyKey": "device:019...:collection:019...",
     "occurredAt": "2026-11-18T14:32:10-03:00",
     "clientSeq": 42,
     "payload": { "...": "..." }
   }
   ```
3. Sync sends a batch: `POST /v1/sync/push` with up to N items (e.g. 50) and a batch idempotency key.
4. Server validates each item, applies it in a transaction, and returns per-item results:
   `accepted` (canonical id/version), `duplicate` (existing record), `rejected` (field errors), `conflict` (state mismatch).
5. Client marks accepted/duplicate items synced; rejected items become visible failures with a correction path; conflict items show the server state.
6. Attachments use a separate presigned upload + complete call; the collection can sync before the photo, but the UI shows "photo pending".

### 11.5 Idempotency and ordering

- Unique `(tenant_id, client_id)` on collections/movements/shifts.
- Unique `(tenant_id, idempotency_key)` on the idempotency table; store request hash + response for 30 days.
- Per-container ordering: server rejects out-of-order movements with a conflict; client can reorder by `clientSeq`.
- Per-label uniqueness: a label can be used once; duplicate returns `duplicate` with the existing collection.
- Clock skew: keep `occurred_at` from the device as evidence, but use `received_at` and `client_seq` for ordering. Never trust device time for legal sequence alone.

### 11.6 Conflict policy

| Data | Policy |
|---|---|
| Reference data | Server wins; client replaces. Show "route updated" if the active route day changed. |
| Collection | Append-only; duplicate label/collection returns the existing record; edit only while draft/editable and with version check. |
| Container movement | State machine; invalid transition returns conflict with expected/current state. |
| Stop status | Derived from collections/labels; server recomputes; client refreshes. |
| Label assignment | Unique constraint; duplicate returns the existing manifest/label. |
| Shift | One open shift per device/driver; closing is idempotent. |

### 11.7 Retry and limits

- Exponential backoff with jitter: 2s, 5s, 15s, 1m, 5m, 15m; cap at 30m.
- Retry on network/5xx/429; do not retry 4xx validation errors.
- Dead-letter after N attempts; show in "Sync problems" with export/share diagnostics.
- Batch limits: 50 items or 1 MB per request; attachments separate.
- Local retention: purge synced collections after 30-90 days or when DB size exceeds a threshold; keep unsynced forever until resolved.
- Background sync is best-effort; foreground sync on app open, network regain, and manual pull is the guaranteed path.

### 11.8 Why not PowerSync/Electric/Replicache

- They solve general Postgres-to-client replication; our reference data is route-scoped and our writes are append-only events with legal validation.
- They add a vendor/runtime and a conflict model that the client would have to understand.
- We still need server-side validation, idempotency, audit, and ORDS publishing regardless.
- Revisit if the platform grows into many collaborative, editable datasets; the API contract keeps that option open.

---

## 12. API surface (proposed v1)

### 12.1 Conventions

- Base: `https://api.<domain>/v1`.
- JSON, UTF-8, ISO 8601 timestamps with offset, `date` for business dates.
- Auth: `Authorization: Bearer <access_token>` (web may use httpOnly cookie at the BFF).
- Idempotency: `Idempotency-Key` header on POST/PATCH that create or mutate.
- Pagination: cursor-based (`cursor`, `limit`), never offset for large tables.
- Errors: RFC 9457 Problem Details + stable `code` + field errors + `requestId`.
- Versioning: additive within `/v1`; deprecation headers; no breaking change without `/v2`.
- ETag/If-Match on editable resources (collections, stops, master data).

### 12.2 Endpoint groups

| Group | Examples |
|---|---|
| Session/identity | `GET /me`, `GET /tenants`, `POST /devices`, `POST /devices/{id}/revoke` |
| Bootstrap/sync | `GET /sync/bootstrap`, `GET /sync/changes`, `POST /sync/push`, `GET /sync/status` |
| Reference | `GET /clients`, `GET /client-units`, `GET /routes`, `GET /routes/{id}`, `GET /manifests`, `GET /labels/{code}`, `GET /containers` |
| Shift/route | `POST /shifts`, `PATCH /shifts/{id}`, `POST /shifts/{id}/close`, `GET /route-days/{id}/stops` |
| Collections | `POST /collections` (batch), `PATCH /collections/{id}`, `POST /collections/{id}/void`, `GET /collections` |
| Containers | `POST /container-movements` (batch), `GET /containers/{id}/movements` |
| Labels | `POST /label-ranges`, `POST /labels/{code}/assign`, `GET /manifests/{id}/labels` |
| Attachments | `POST /attachments/presign`, `POST /attachments/{id}/complete` |
| Reports | `GET /reports/route-progress`, `GET /reports/collections`, `GET /reports/weight-reconciliation`, `POST /exports` |
| Admin | CRUD for clients, points, routes, drivers, vehicles, manifests, residue types, volumes, containers, third parties, users, feature flags |
| Integrations | `GET /integrations/ords/status`, `POST /integrations/ords/sync`, `GET /integrations/ords/jobs` |
| Audit | `GET /audit`, `GET /audit/{id}` |

### 12.3 Example collection push

```http
POST /v1/sync/push
Authorization: Bearer ...
Idempotency-Key: device-7f3a-batch-20261118-1432
Content-Type: application/json

{
  "deviceId": "dev_01...",
  "clientSeq": 42,
  "items": [
    {
      "clientId": "0193...",
      "type": "collection.created",
      "idempotencyKey": "dev_01...:collection:0193...",
      "occurredAt": "2026-11-18T14:32:10-03:00",
      "payload": {
        "routeDayId": "0192...",
        "stopId": "0192...",
        "clientId": "0191...",
        "manifestNumber": "1234567890",
        "labelCode": "000123",
        "containerCode": "BOM-001",
        "volumeTypeId": "0190...",
        "residueTypeId": null,
        "grossWeightG": 12340,
        "tareG": 1200,
        "type": "normal",
        "notes": "",
        "coletaExtra": false,
        "clienteAusente": false,
        "semResiduo": false
      }
    }
  ]
}
```

Response:

```json
{
  "batchId": "0194...",
  "results": [
    {
      "clientId": "0193...",
      "status": "accepted",
      "serverId": "0195...",
      "version": 1
    }
  ]
}
```

### 12.4 API modules

- `identity`: users, memberships, devices, sessions, roles.
- `tenancy`: tenants, settings, feature flags.
- `master-data`: clients, points, drivers, vehicles, third parties, residue types, volume types.
- `routing`: routes, route days, stops, shifts.
- `manifests`: manifests, items, labels, ranges.
- `collections`: collection commands, validation, attachments, discrepancies.
- `containers`: registry, movements, state machine.
- `sync`: bootstrap, change feed, push, idempotency.
- `reports`: read models, exports.
- `integrations`: ORDS adapter, future ERP/webhooks.
- `audit`: append-only audit and admin views.

---

## 13. Hardware abstraction

### 13.1 Capability matrix

| Capability | Android | iOS | Windows (Tauri) | Web |
|---|---|---|---|---|
| Camera barcode/QR | Yes (ML Kit/ZXing) | Yes (AVFoundation/Vision) | Yes (WebView2 getUserMedia + JS) | Chromium only reliably |
| Bluetooth Classic SPP | Yes | MFi only | Yes (COM port) | No |
| Bluetooth LE | Yes | Yes | Yes (`btleplug`) | Chromium BLE only; iOS no native |
| USB HID scanner | Yes (OTG) | No (Lightning/USB-C limited) | Yes | Keyboard wedge |
| Serial scale | No | No | Yes | No |
| GPS | Yes | Yes | Optional | Geolocation |
| Print | Share/PDF | AirPrint/PDF | Windows spooler/PDF/ZPL | Browser print |
| Offline local DB | SQLite | SQLite | SQLite | OPFS/SQLite WASM (not field-primary) |

### 13.2 Scale driver interface

```ts
type ScaleReading = {
  grossG: number;
  stable: boolean;
  unit: "kg" | "g";
  raw: string;
  at: string;
};

interface ScaleDriver {
  id: string;
  connect(): Promise<void>;
  disconnect(): Promise<void>;
  read(timeoutMs: number): Promise<ScaleReading>;
  tare(): Promise<void>;
  status(): "disconnected" | "connecting" | "connected" | "error";
}
```

Rust desktop implements the same interface via Tauri commands. Mobile uses a native module wrapper for Classic SPP/BLE.

### 13.3 Legacy scale protocol

- UUID `00001101-0000-1000-8000-00805F9B34FB`.
- 150-byte read buffer; write `0x04` every 1 s; parse fixed offsets 33..37.
- Treat this as a hypothesis until validated against the actual scale model; capture raw frames from a real device and build golden fixtures.
- Build a simulator (serial/TCP) that emits the same frames so mobile/desktop/CI can test without hardware.

### 13.4 Barcode and printing

- Camera scanning: native ML Kit/Vision on mobile; WebView2 + ZXing on desktop; USB HID scanner as keyboard fallback.
- Normalise scanned values: trim, uppercase where appropriate, reject control characters, enforce max length, support Code128/QR/EAN.
- Printing: PDF for MTR/receipts; ZPL/TSPL for labels; Windows spooler and mobile share sheet. Keep a printer compatibility matrix and test with the client's actual devices.

---

## 14. Security, privacy and compliance

### 14.1 Identity and access

- OIDC/OAuth 2.1 + PKCE; short-lived access tokens; rotating refresh tokens; device binding.
- Roles: `platform_admin`, `tenant_admin`, `dispatcher`, `supervisor`, `driver`, `auditor`, `customer`, `integration`.
- Permissions scoped by tenant, route day, client, and action.
- PostgreSQL row-level security on tenant-scoped tables as defence in depth; the API remains authoritative and workers use narrowly scoped roles.
- Admin actions require MFA/passkeys; all admin actions audited.
- No hardcoded passwords; no client-side-only authorisation.

### 14.2 Transport and API

- TLS 1.3 only; HSTS; secure cookies; certificate pinning on mobile/desktop where operationally safe.
- WAF/rate limiting at the edge; request size limits; input validation; parameterised SQL; SSRF protections for integration URLs.
- CORS locked to the web origin; CSRF protection for cookie-based web sessions.
- Idempotency and replay protection; audit request ids.

### 14.3 Local data

- SQLCipher on mobile and desktop; key wrapped by Keystore/Keychain/DPAPI.
- No PII in logs; redact tokens, passwords, full addresses where not needed.
- Screen capture protection on admin/PII screens where the platform allows.
- Remote wipe/revocation for lost devices; local DB purge on logout/revocation (with unsynced-data warning).
- Backup excluded from OS cloud backup unless explicitly allowed and encrypted.

### 14.4 Audit and legal

- Append-only audit log: actor, action, entity, before/after (redacted), device, IP, timestamp, hash chain.
- MTR/weight changes are auditable end-to-end; no silent edits after submission.
- Retention configurable per tenant/document type; legal hold support.
- LGPD: DPIA, records of processing, data-subject request workflow, subprocessor list, Brazil data residency.
- Remove personal Google Drive backup; replace with server-side encrypted backup and a corporate retention policy.

### 14.5 Release integrity

- Android: Play App Signing or corporate keystore; Play Integrity at sync; no debuggable release builds.
- iOS: App Attest where appropriate; App Store/MDM distribution.
- Windows: code signing + signed Tauri updater; SmartScreen reputation; no unsigned installers.
- Web: CSP, SRI, dependency scanning, SBOM.

### 14.6 Legacy finding coverage

| Legacy finding | New control |
|---|---|
| SEC-01 cleartext HTTP | TLS 1.3 only, HSTS, certificate pinning where safe, no cleartext policy |
| SEC-02 no authentication | OIDC + PKCE, device binding, RBAC/ABAC, server-side authorization |
| SEC-03 debuggable build | Release build pipeline, Play App Signing, no debug artifacts |
| SEC-04 hardcoded admin password | Server-side roles + audit; supervisor mode via short-lived server PIN if needed |
| SEC-05 `allowBackup` | Encrypted DB; backup rules exclude app data; server-side backup only |
| SEC-06 personal signing key | Corporate keystore under dual control; Play App Signing; documented rotation |
| SEC-07 personal Google Drive backup | Removed; server-side encrypted backup with retention and access control |
| SEC-08 unencrypted SQLite | SQLCipher; key in Keystore/Keychain/DPAPI; remote wipe |
| SEC-09 outdated libraries | Dependency scanning, SBOM, update policy, current SDKs |
| SEC-10 verbose errors | Stable error codes; structured logs with PII redaction |
| SEC-11 debug app id | Production package/bundle id; migration plan from debug id |
| SEC-12 no integrity | Play Integrity / App Attest; signed desktop builds; no shared secrets |
| SEC-13 screenshots | `FLAG_SECURE`/platform screen-capture protection on admin/PII screens |
| SEC-14 minSdk 23 | Raise the supported Android floor (target API 26+ or higher after fleet audit) |

---

## 15. Observability, DevOps and testing

### 15.1 Environments

| Environment | Purpose | Data |
|---|---|---|
| Local | Developer laptops | Seeded fixtures, no real PII |
| Dev | Shared integration | Synthetic/anonymised |
| Staging | Client acceptance, migration rehearsal | Anonymised copy |
| Production | Live fleet | Real data, restricted access |

### 15.2 CI/CD

- GitHub Actions (or equivalent): lint, typecheck, unit tests, contract tests, migrations, build, e2e, security scan, SBOM.
- Web: container build + deploy; Vercel preview optional.
- API/worker: Docker image, migration job, rolling deploy.
- Mobile: EAS Build/Submit; internal testing tracks; OTA channels.
- Desktop: Windows runner, `cargo test`/`clippy`, Tauri build, code signing, updater artifacts, MSI/NSIS.
- Database: expand/contract migrations; no destructive change without a compatibility window.

### 15.3 Observability

- Structured JSON logs with `request_id`, `tenant_id`, `device_id`, `sync_batch_id`; no PII.
- Metrics: API latency/error rate, sync lag, pending outbox, duplicate rate, conflict rate, ORDS publish failures, queue backlog, crash-free sessions.
- Traces: OpenTelemetry across API, worker, ORDS adapter.
- Alerts: sync failure spike, ORDS outage, queue backlog, DB saturation, certificate expiry.
- Dashboards: operations (routes live), platform health, sync health, audit.

### 15.4 Testing

- Unit: domain rules, weight/tare, label ranges, state machines, idempotency.
- Contract: OpenAPI validation; generated clients compile; fixtures round-trip.
- Sync simulator: offline for N days, duplicate pushes, out-of-order movements, clock skew, partial failures, dead-letter recovery.
- Integration: Postgres/Redis/S3 via Testcontainers; ORDS adapter with recorded fixtures.
- E2E: Playwright web; Maestro mobile; tauri-driver/WebdriverIO desktop.
- Load: k6 for API and sync; 1k concurrent devices, batch uploads, report queries.
- Security: SAST/DAST, dependency audit, secrets scan, pen test before production.
- Accessibility: axe + manual keyboard/screen-reader checks for web; mobile labels and dynamic type.
- Field pilot: real devices, real scales, 8-hour offline shift, low battery, poor network.

---

## 16. Legacy integration and migration

### 16.1 Two seams

1. **Inbound:** old ORDS reference data and old APK clients.
2. **Outbound:** new collections/movements to ORDS/ERP.

Implement both behind adapters:

- `services/legacy-adapter` exposes the old 14 endpoints and translates them to the new API. It is time-boxed (e.g. 90 days), network-restricted, and monitored.
- `services/worker` publishes accepted collections/movements to ORDS with idempotency and retries; it stores mapping between new ids and old `id_app_coleta`.
- Neither adapter leaks into web/mobile/desktop; they only know the new API.

The shipped APK hardcodes its HTTP base URL. To route old devices through the adapter without rebuilding, point the DDNS hostname at a network-restricted reverse proxy for the transition window. Otherwise distribute a patched build; because the original signing key is unavailable, that is a fresh install and needs the device migration runbook.

### 16.2 Legacy DB import

- CLI/tool reads `bf_app_ambientus.db` read-only, verifies SHA-256, and outputs a signed import bundle.
- Replay container movements chronologically to derive current state; compare to `BF_BOMBONAS_CADASTRADAS.status`.
- Deduplicate collections by `id_coleta_controlado`, label + manifest + timestamp, and server id where available.
- Quarantine unresolved clients/labels/containers; produce a reconciliation report.
- Import idempotently; store `legacy_imports` stats and row-level mappings.
- Dry-run on a copy of a real device DB before any cutover.

### 16.3 Cutover

See [`DELIVERY-PLAN.md`](DELIVERY-PLAN.md) for the runbook. Principles:

- Pilot one route/depot; dual-run old and new; reconcile daily.
- Ensure all unsynced legacy rows are uploaded or exported before switching a device.
- Keep the old app read-only/legacy adapter available for a bounded window.
- Do not decommission ORDS or the old app until the client signs off on reconciliation and retention.

---

## 17. Repository layout

```text
ambientuus/
  apps/
    web/                 Next.js 16.4
    mobile/              Expo SDK 58
    desktop/             Tauri 2.12 + Vite/React
    api/                 Fastify + Zod + Drizzle + OpenAPI
  services/
    worker/              BullMQ jobs; ORDS publisher; exports; notifications
    legacy-adapter/      temporary old-API gateway
  packages/
    domain/              Zod schemas, types, rules, fixtures
    api-client/          generated OpenAPI client
    ui/                  React/Tailwind/Radix components (web + desktop)
    config/              eslint/biome, tsconfig, tailwind presets
    i18n/                pt-BR strings and formatters
  crates/
    desktop-core/        Tauri commands, SQLite, sync, printing, hardware
    scale-protocol/      frame parsers, simulators, golden fixtures
  infra/
    docker-compose.yml   Postgres, Redis, MinIO, Mailpit, ORDS mock
    migrations/          deployment/migration scripts
    terraform/           cloud resources
  docs/
    platform/            this plan
    adr/                 architecture decision records
    runbooks/            operations, migration, incident response
  package.json
  pnpm-workspace.yaml
  turbo.json
  Cargo.toml
```

Tooling:

- pnpm + Turborepo; Node 24 LTS; TypeScript strict.
- Biome or ESLint + Prettier; `cargo fmt` + `clippy` with warnings denied.
- Vitest, Playwright, Maestro, cargo test.
- Changesets for package versioning; Dependabot/Renovate.
- Docker Compose for local dependencies; Testcontainers for CI.
- OpenAPI linting and breaking-change checks.

---

## 18. ADR summary

| ADR | Decision | Status |
|---|---|---|
| ADR-001 | Web: Next.js 16.4 App Router | Proposed |
| ADR-002 | Mobile: Expo SDK 58 / React Native 0.88 | Proposed |
| ADR-003 | Desktop: Tauri 2.12 (Rust core + React UI) | Proposed |
| ADR-004 | Backend: TypeScript Fastify API + PostgreSQL | Proposed |
| ADR-005 | Sync: custom outbox + change cursor | Proposed |
| ADR-006 | Oracle ORDS behind an anti-corruption adapter | Proposed |
| ADR-007 | Polyglot monorepo: TS packages + Rust crates | Proposed |
| ADR-008 | Contract-first OpenAPI; generated clients | Proposed |
| ADR-009 | Multi-tenant `tenant_id` from day one | Proposed |
| ADR-010 | Legacy adapter + DB importer, time-boxed | Proposed |

Each ADR should get a short file in `docs/adr/` once approved, including context, decision, consequences, and alternatives.

---

## 19. References

[^next16]: Next.js 16.4 release, 6 Oct 2026: https://nextjs.org/blog/next-16-4
[^expo58]: Expo SDK 58 changelog, 15 Oct 2026: https://expo.dev/changelog/sdk-58
[^tauri212]: Tauri 2.12 announcement, Sep 2026: https://tauri.app/blog/tauri-2.12/ ; Tauri docs: https://v2.tauri.app/start/

Additional sources:

- TanStack Start vs Next.js vs React Router comparison (checked Sep 2026): https://tanstack.com/start/latest/docs/framework/react/comparison
- Dioxus 0.7 release: https://dioxuslabs.com/blog/release-070/
- Expo SQLite (SQLCipher support): https://docs.expo.dev/versions/v58.0.0/sdk/sqlite/
- Expo Background Task: https://docs.expo.dev/versions/v58.0.0/sdk/background-task/
- Apple developer forum on Classic Bluetooth/MFi: https://developer.apple.com/forums/thread/769197
- Google Play target API requirements: https://support.google.com/googleplay/android-developer/answer/11926878
- Web Bluetooth support (iOS unsupported): https://caniuse.com/web-bluetooth
- BarcodeDetector support: https://caniuse.com/mdn-api_barcodedetector
