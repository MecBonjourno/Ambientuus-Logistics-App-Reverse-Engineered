# Ambientuus Platform Rebuild — Plan & Decisions

**Status:** Proposed for approval  
**Date:** 2026-11-18  
**Scope:** web platform + iOS/Android field app + Windows desktop app, built from the recovered legacy behaviour

---

## Why this exists

The previous work recovered and froze the shipped Android app, proved it can be rebuilt, and documented its data model, API and security defects. That was the right foundation, but the next step is no longer an Android-only replacement.

The target is a platform:

1. a **web platform** for dispatch, master data, collections, manifests, reports, admin and (later) customers;
2. a **mobile app for iOS and Android** for drivers in the field;
3. a **Windows desktop app** for field/office use, built with Rust at its core;
4. room to expand into route optimisation, customer portal, billing, telematics and other operators without rewriting the domain.

This plan evaluates the stack against that whole scope, not just "port the screens".

---

## Recommendation in one page

| Layer | Choice | Why |
|---|---|---|
| Web | **Next.js 16.4** (App Router, React 19.3) | Best fit for public/customer portal plus authenticated operations console; strong SSR/streaming and React reuse with desktop |
| Mobile | **Expo SDK 58** (React Native 0.88) | Fastest path to a polished cross-platform field app with offline SQLite, camera, secure storage, OTA and a native Bluetooth escape hatch |
| Desktop | **Tauri 2.12** (Rust core + React UI) | Small signed Windows installer, native hardware access in Rust, auto-update, reuse of the web design system |
| Desktop, strict Rust-only | **Dioxus 0.7** | Credible fallback if "no JavaScript in the Windows app" is a hard policy |
| Backend | **TypeScript Fastify API + PostgreSQL + Redis/BullMQ + S3** | Owns sync, idempotency, audit, ORDS integration and reporting; shares types with web/mobile |
| Legacy Oracle ORDS | **Anti-corruption adapter** | The old API has no auth, idempotency or delta sync; keep it as an integration, not the platform database |
| Sync | **Custom outbox + change cursor** | The domain is asymmetric (server-authoritative reference data, append-only field events); a generic sync engine adds semantics we do not need |
| Repo | **pnpm/Turborepo + Cargo workspace** | One product monorepo with TypeScript surfaces and Rust kernels |

**One-sentence architecture:** a TypeScript/React product surface on a contract-first TypeScript API and PostgreSQL, with Rust owning Windows-native and hardware-heavy work, and Oracle ORDS isolated behind an adapter.

This is **Rust-first desktop**, not a Rust-only product. Tauri's native core, local database, sync, scale protocol, printing, secure storage and updater are Rust; only the presentation layer is React in WebView2. If that does not satisfy the requirement, choose Dioxus.

---

## What was evaluated

### Web

Compared Next.js 16.4, TanStack Start, SvelteKit and a plain Vite SPA. Next.js wins because the platform is not only an internal dashboard: it needs public/customer pages, server-side auth/session handling, and the broadest React ecosystem. TanStack Start is the fallback if the web app is internal-only and the team wants Vite-speed iteration without RSC.

### Mobile

Compared Expo/React Native, Flutter, Kotlin Multiplatform/Compose and Rust mobile (Tauri/Dioxus). Expo wins on time-to-market and TypeScript/React reuse. Flutter is the strongest fallback if the team is Dart-native or hardware/performance dominates. Rust mobile is not mature enough for camera + Bluetooth + background sync + app-store operations.

**Critical hardware caveat:** the legacy scale uses Bluetooth Classic SPP. iOS does not expose generic Classic SPP to third-party apps; it requires MFi or a BLE scale. This must be resolved in Phase 0. If the client's scales are Classic-only, the iOS app may be supervisor/office-only until the hardware changes.

### Desktop

Compared Tauri 2.12, Dioxus 0.7, egui, Slint and WinUI 3. Tauri wins on Windows integration, installer/updater maturity and React reuse. Dioxus is the strict-Rust fallback. egui is a tooling UI, Slint has licensing/DSL constraints, and WinUI violates the Rust requirement.

### Backend

Compared Supabase-only, a TypeScript API + Postgres, a Rust API + Postgres, and ORDS-only. The TypeScript API wins because the hard parts are sync, idempotency, audit, legacy mapping and ORDS publishing, not CRUD. Supabase can still be used as managed Postgres/Auth/Storage in São Paulo, but the domain stays in the API.

---

## Documents

| Document | What it covers |
|---|---|
| [LEGACY-APP-SPEC.md](LEGACY-APP-SPEC.md) | Recovered screens, workflows, SQLite schema, API contract, business rules, hardware integrations, parity checklist |
| [PLATFORM-ARCHITECTURE.md](PLATFORM-ARCHITECTURE.md) | Technology evaluation, target architecture, domain model, sync protocol, API surface, security, testing, repo layout, ADRs |
| [DELIVERY-PLAN.md](DELIVERY-PLAN.md) | Phases, timeline, effort, migration/cutover, QA/pilot, risks, open decisions, next two weeks |

Related existing documents:

- [Original source snapshot](../../original-source/README.md)
- [Architecture & reconstruction analysis](../analysis/APP-ARCHITECTURE-AND-RECONSTRUCTION.md) (superseded for now by this plan)
- [Security assessment](../analysis/APK-SECURITY-ASSESSMENT.md)
- [Evidence index](../../artifacts/EVIDENCE-INDEX.md)

---

## Key decisions needed from the client

1. **ORDS:** Is it the system of record, a downstream mirror, or can it be replaced? We recommend new Postgres as canonical, with ORDS as an integration until proven otherwise.
2. **iOS:** Are the scales BLE/MFi, or Classic-only? This determines whether iOS is a full field app or a supervisor/office app.
3. **Rust desktop:** Is Tauri (Rust core + React UI) acceptable, or is a pure-Rust UI (Dioxus) required?
4. **Web scope:** Internal operations only, or also a customer portal/public site? We recommend the operations console first and the customer portal as a fast-follow.
5. **Distribution:** Play Store, App Store, MDM, sideload; fleet size and device models.
6. **LGPD/data residency:** Brazil hosting, retention, DPIA, subprocessors, and whether Google Drive backup is contractually required.
7. **ORDS access:** Credentials, schema/ERD, sample responses, authentication method, hosting/owner.

If 1-3 cannot be answered before kickoff, proceed with the recommended defaults and mark them reversible in Phase 0.

---

## What can start immediately

- ORDS discovery and mock adapter with fixtures.
- Legacy DB profiling and dry-run importer.
- Hardware spike (Classic SPP on Android/Windows, BLE on iOS, serial on Windows).
- Monorepo scaffold, CI, staging, design tokens.
- API contract v0.1 and ERD v0.1.
- Clickable mobile/web prototype and a one-day driver shadowing session.

---

## Immediate recommendation

Approve the stack and the Phase 0 plan, then run a **2-week discovery sprint** before committing to a fixed delivery date. The first usable pilot slice is realistically **10-14 weeks** from kickoff; full parity is **6-8 months** for a 4-5 person team, contingent on ORDS access and scale hardware.

> Version baseline checked on 2026-11-18 against npm: `next` 16.4.6, `expo` 58.0.26,
> `@tauri-apps/cli` 2.12.5. Pin exact versions in the lockfile and re-check before kickoff.
