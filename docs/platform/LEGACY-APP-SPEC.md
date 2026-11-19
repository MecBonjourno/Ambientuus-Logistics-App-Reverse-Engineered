# Legacy App Functional Specification

**Status:** Recovered specification for the multi-platform rewrite  
**Subject:** `app_coleta_ambientuus_hom_1.59 2.apk`  
**Package:** `com.coleta.ambientuus.debug` / version `1.59-DEBUG` (59)  
**Source used:** frozen extraction in [`original-source/`](../../original-source/README.md)  
**Date:** 2026-11-18  

> This is a behavioural specification recovered from the shipped APK. It is not the original source code.
> The smali tree is authoritative for bytecode behaviour; the JADX Java tree is readable but approximate.
> No request was deliberately sent to the client's servers while producing this document.

---

## 1. Purpose

The legacy Android app is a driver-facing field-collection client for waste collection. It:

1. downloads reference data (routes, drivers, vehicles, clients, manifests, collection points, labels, containers, residue types, volumes);
2. lets the driver select a route and vehicle plate for a date;
3. guides the driver through scanning labels/containers, weighing, and recording collections;
4. records container movements (allocate, load, collect, unload to a third party, release);
5. works offline against a local SQLite database;
6. uploads unsent collections and container movements to an Oracle ORDS backend;
7. optionally uploads the whole SQLite database to Google Drive.

This document is the source of truth for parity work. The target platform may improve the UX and security, but it must preserve the operational rules in section 7 unless the client explicitly changes them.

---

## 2. Actors and system context

| Actor / system | Role |
|---|---|
| Driver | Uses the Android app in the field; selects route/plate, scans, weighs, records collections and container movements. |
| Supervisor / admin | Currently uses a hidden on-device screen after tapping seven times and entering a password; sees all local collections. |
| Oracle ORDS | External backend at `http://ambientuus-tipartner.ddns.com.br:8085/ords/portalcliente/appcoleta/`; serves reference data and receives collections/movements. No client authentication. |
| Bluetooth scale | Classic Bluetooth SPP device paired with the phone; sends weight frames. |
| Camera / ML Kit | On-device barcode/QR scanning. |
| Google Drive | Optional full-database backup to the signed-in Google account. |
| Local SQLite | `bf_app_ambientus.db`, version 22, unencrypted. |

### 2.1 High-level data flow

```
ORDS  --(full reference pulls)-->  Android SQLite  --(UI)-->  driver
  ^                                     |
  |                                     +--(collections/movements, "enviado=N")--> ORDS POST
  |                                     |
  +----(manifestos, pontos de coleta, telas)---- Android
```

There is no incremental sync, no server cursor, no conflict resolution, and no authentication.

---

## 3. End-to-end workflows

### 3.1 App launch and shift start

1. `MainActivity` opens.
2. If online, it pulls screen configuration (`controleTelas`) in the background.
3. The driver picks a collection date (default today).
4. Routes are filtered by weekday: route list query uses `Calendar.DAY_OF_WEEK - 1` (Sunday = 0).
5. Selecting a route also selects its driver (`id_motorista`) and may pre-select a vehicle.
6. The driver selects a plate from `BF_PLACAS`.
7. The app stores `dataColeta`, `recebeIdRota`, `recebeIdMotorista`, `recebeIdFrotaVeiculo`, and the spinner labels in `SharedPreferences` (`ArquivoPreferencia`).
8. Tapping **COLETAR** opens `SelecaoActivity` and, if online, starts a background sync of manifests and collection points for that route/date.

The driver identity is implicit: it comes from the selected route, not from a login.

### 3.2 Route / collection-point collection (primary flow)

1. `SelecaoActivity` shows nine feature buttons, each toggled by a flag from `bf_telas`:
   - Consultar Rotas
   - Carregar Veículo
   - Alocar Bombona
   - Coletar Bluetooth
   - Coletar Manual
   - Descarregar Veículo
   - Liberar Bombona
   - Consultar Bombonas
   - Consultar Coletas
   - Consultar Manifestos
   - Atualizar Base
2. **Consultar Rotas** opens `ListagemPontoColetaActivity`, which lists collection points for the selected route/date.
3. The list can show only pending points or all points; it is searchable by client code, name, or address.
4. Selecting a point enables actions based on its status:
   - **COLETAR** for a pending point.
   - **EXTRA** for an extra collection, unless the point is already no-waste/absent.
   - **editar** when the point is editable.
   - **EXCLUIR** when the point is not pending.
5. **COLETAR** opens `CapaPontoColetaActivity` (the point cover):
   - shows client, address, MTR/DC, destination, residue, periodicity, notes, and linked labels;
   - has switches for **Sem Resíduos** and **Cliente Ausente**;
   - has **Iniciar Coleta** (first time) or **Finalizar Coleta**.
6. First-time **Iniciar Coleta** opens `PontoColetaEtiquetaActivity` to define the label range:
   - initial label and final label, scanned or typed;
   - quantity = final - initial + 1;
   - range is stored in `bf_etiqueta` for the point's manifest;
   - labels cannot already belong to another manifest.
7. **Iniciar Pesagem** opens `IniciarColetaActivity`:
   - MTR/DC is prefilled when the client does not issue its own MTR;
   - the label to use is the next unused label in the range;
   - weight is typed or read from the Bluetooth scale;
   - the driver selects a container/volume, residue type (for extra), and optional notes;
   - **Lançar** saves one collection row and advances the label;
   - **Finalizar** saves the current row if present and opens the cover again with a "finaliza" flag;
   - when the last label is used, the point status becomes collected.
8. On the cover, **Finalizar Coleta**:
   - if Sem Resíduos, inserts a zero-weight collection with `coleta_sem_residuo='S'` and sets point status `500`;
   - if Cliente Ausente, inserts a zero-weight collection with `cliente_ausente='S'` and sets point status `600`;
   - if finalizing after partial collection, sets point status `200` (collected);
   - returns to the point list.
9. If the driver leaves before finishing, the cover can save the point as editable (`100`), or finalize it.

### 3.3 Manual collection (`ColetarActivity`)

This is a single-screen collection form used for a client/MTR outside the point-cover flow.

Fields and behaviour:

- **Bombona** code: typed or scanned; if known, prefills client and volume.
- **Etiqueta** code: typed or scanned; looks up the manifest and client.
- **Cliente**: searchable list of MTR-emitting clients; selecting one loads its manifest(s); if multiple, a bottom sheet asks which manifest.
- **Número MTR/DC**: 10 characters; can be scanned.
- **Volume**: spinner of volume types.
- **Peso**: typed, or continuously read from Bluetooth scale.
- **QTD / Litro** switch: sets `tipo_coleta` to `QTD` or `LT`.
- **Cliente Ausente**, **Coleta sem Resíduo**, **Coleta Extra** checkboxes.
- **Observação**.
- **Manter etiqueta / MTR / bombona** switches control what is cleared after saving.
- **LIMPAR** clears fields.
- **LANÇAR** validates and inserts into `bf_coleta`.

Validation:

- maximum weight 100 kg (alert and reset to `0,00`);
- container must exist in the local container registry;
- normal collection requires a label, 10-character MTR/DC, weight, and container;
- label must belong to the selected manifest;
- absent/no-waste requires 10-character MTR/DC and weight exactly `0,00`;
- extra requires 10-character MTR/DC, weight, observation, and container.

### 3.4 Extra collection (`IniciarColetaExtraActivity`)

Used from the menu ("Coletar Manual" with no point) or from a point's **EXTRA** action.

- If opened from a point, client is fixed; otherwise the driver selects a client.
- Fields: MTR/DC, weight, QTD/LT, container, residue type, label, observation.
- Always saved with `coleta_extra='S'`.
- Requires MTR 10, weight, container; label is optional but if provided must match the manifest.
- Returns to the point list.

### 3.5 Container lifecycle

Container movements are recorded as rows in `BF_MOVIMENTO_BOMBONAS`. A single row accumulates timestamps for one container until it is uploaded; the presence of a timestamp determines the movement type.

| Type code | Action | Timestamp set | UI screen | Effect on container status |
|---|---|---|---|---|
| `A` | Alocar bombona ao cliente | `data_alocacao` | `LerBombonaActivity` | `EM CLIENTE` |
| `TR` | Carregar bombona no veículo | `data_transporte` | `CarregarBombonaActivity` | `CARREGADO` |
| `C` | Coletar bombona do cliente | `data_coleta` | (collection flow / scanner) | `COLETADO` |
| `TC` | Descarregar em terceiro | `data_terceiro`, `id_terceiro` | `TerceirosActivity` | `DESCARREGADO` |
| `B` | Baixar / liberar bombona | `data_baixa` | `BaixaBombonaActivity` | `DISPONIVEL` |

Rules:

- A container must exist in `BF_BOMBONAS_CADASTRADAS`.
- The current state is derived from the latest movement row; an invalid transition returns a Portuguese error such as "Bombona já Carregada!" or "Bombona não Alocada!".
- Container lists show aggregate counts by capacity, client, or third party, not individual rows (for the load/unload/allocate screens).
- The "Consultar Bombonas" screen lists individual containers with status/client/third-party details.

### 3.6 Consultations

- **Consultar Coletas** (`ListagemColetasActivity`):
  - two lists: MTR (numbers not starting with `DC`) and DC (numbers starting with `DC`);
  - only unsent rows (`enviado='N'`);
  - tapping a row shows total gross weight, total net weight (gross - volume tare), count of entries, and client/MTR;
  - context menu allows deleting a local collection.
- **Consultar Manifestos** (`ListagemManifestoActivity`):
  - searchable list of downloaded manifests.
- **QR lookup** on the main screen:
  - calls `consulta-etiqueta`;
  - shows a popup with client, collection date, quantity, net weight, manifest, labels.
- **CONSULTAR BOMBONAS**:
  - individual container list with status, client, third party; searchable.

### 3.7 Synchronisation and upload

**Full reference sync** (menu → Sincronizar, or "Atualizar Base" path):

1. If online, clear volume, route, driver, client, container, third-party, plate, label, residue-type tables.
2. Pull in this order:
   - volumes, third parties, routes, plates, containers, clients, residue types;
   - screen flags;
   - manifests and collection points for the selected route/date (separate background sync).
3. On failure, show "Erro na sincronização"; no partial-sync reporting.

**Upload** ("Atualizar Base"):

1. Read unsent collections (`enviado='N'`) and unsent movements.
2. POST `insericoletas` with `{"COLETAS":[...]}`.
3. POST `inseriMovimentoBombona` with `{"BOMBONAS":[...]}`.
4. For collections, the server returns rows with `id_app_coleta`; the app stores that in `id_coleta_servidor` and then marks all rows with a server id as `enviado='S'`.
5. Sets `data_envio`.
6. Deletes collections older than 30 days and sent movements older than 30 days.
7. Then attempts a Google Drive database backup.

There is no idempotency key, no per-row result, no retry queue, and no conflict handling. If the response is lost after the server commits, the next upload can duplicate records.

### 3.8 Admin screen

- Tapping **COLETAR** seven times while no route/driver is selected opens a password dialog.
- Password `@tenas66` (hardcoded) opens `TelaAdmActivity`.
- The screen lists all local collections with weight, MTR, date, route, volume, flags, sent status, and client.
- There is no server-side authorization, no audit, and no logout.

### 3.9 Google Drive backup

- On first launch, the app requests Google sign-in (Credential Manager).
- "Atualizar Base" backs up the entire SQLite file to the signed-in Google Drive root as `<device>_<dd_MM_yyyy_HH_mm_ss>.db`.
- It attempts to delete files older than 30 days.
- The implementation creates the file twice in some paths (observed bug).
- Backup is to a personal Google account, not a corporate Workspace.

---

## 4. Screen inventory

| Legacy activity | Purpose | Key actions / fields | Target surface |
|---|---|---|---|
| `MainActivity` | Shift setup and QR lookup | date, route, plate, COLETAR, QR scan, sync menu, hidden admin | Mobile **Today / Start shift**; web dispatcher can override |
| `SelecaoActivity` | Feature menu | 9 feature buttons, update base | Mobile **Home** (role/feature-flag driven) |
| `ColetarActivity` | Manual single collection | container, label, client, MTR, volume, weight, flags, notes | Mobile **Quick collect** |
| `IniciarColetaActivity` | Point collection with label range | MTR, weight, container, residue, notes, launch/finalize | Mobile **Stop collection** |
| `IniciarColetaExtraActivity` | Extra/manual collection | client, MTR, weight, container, residue, label | Mobile **Extra collection** |
| `ListagemPontoColetaActivity` | Point list | search, pending switch, collect/extra/edit/delete | Mobile **Route stops**; web **Route detail** |
| `CapaPontoColetaActivity` | Point cover/status | details, no-waste/absent, start/finalize | Mobile **Stop detail** |
| `PontoColetaEtiquetaActivity` | Label range | initial/final label, quantity, start weighing, save | Mobile **Label range** |
| `ListagemColetasActivity` | MTR/DC totals | gross/net totals, delete | Mobile **History**; web **Collections** |
| `ListagemManifestoActivity` | Manifest search | search | Mobile/web search |
| `LerBombonaActivity` | Allocate container | client, scan/type, list allocated | Mobile **Containers → Allocate** |
| `CarregarBombonaActivity` | Load vehicle | scan/type, list loaded | Mobile **Containers → Load** |
| `BaixaBombonaActivity` | Release container | scan/type, list released | Mobile **Containers → Release** |
| `TerceirosActivity` | Third-party unload | third party, scan/type, list unloaded | Mobile **Containers → Third party** |
| `TerceirosActivity.ListBombonaViewActivity` | Container inventory | list, search, details | Desktop/web **Container inventory** |
| `BuscaDispositivoActivity` | Bluetooth pairing/selection | paired devices, connect | Mobile **Settings → Scale** |
| `TelaAdmActivity` | Admin collection list | list all | Web **Admin/Audit** |
| `LeitorColetaActivity` / `LeitorEtiquetaActivity` / `LeitorBombonaActivity` / `ReaderLeitorActivity` / `LeitormtrActivity` | Camera scanners | return scanned code | Mobile **Scanner** component |
| `DatePickerFragment` | Date selection | date | Mobile date picker |
| `ManifestosClienteFragment`, `EtiquetasFragment`, `EtiquetasManifestoFragment` | Bottom-sheet pickers | select manifest/label | Mobile bottom sheets |

---

## 5. Local data model

**Database:** `bf_app_ambientus.db`, schema version 22. All tables are unencrypted.  
**Important:** columns are mostly `TEXT`, including numbers and booleans; the target model should use typed columns.

### 5.1 Tables

| Table | Purpose | Key columns / notes |
|---|---|---|
| `bf_coleta` | Collection/weighing events | `id_coleta` PK autoincrement; `peso`, `numero_mtr`, `data_coleta`, `id_rota`, `id_volume`, `cliente_ausente`, `coleta_sem_residuo`, `coleta_extra`, `observacao`, `enviado`, `id_cliente_emite_mtr`, `tipo_coleta` (QTD/LT), `cod_bombona`, `data_envio`, `id_coleta_controlado`, `id_coleta_servidor`, `cod_etiqueta`, `id_tipo_residuo`, `id_volume_extra`, `id_coleta_logradouro`, `id_dia_coleta` |
| `bf_volume` | Container/volume types | `id_volume`, `descricao`, `tara` (numeric as REAL) |
| `bf_rota` | Routes | `id_rota`, `descricao`, `id_motorista`, `id_frota_veiculo`, `ordem` |
| `bf_motorista` | Drivers | `id_motorista`, `nome` |
| `bf_cliente_emite_mtr` | Clients that issue MTR | `id_pessoa`, `cod_pessoa`, `razao_social` |
| `BF_MOVIMENTO_BOMBONAS` | Container movement log | `cod_barras`, `id_cliente`, `id_terceiro`, `data_alocacao`, `data_coleta`, `data_baixa`, `data_transporte`, `data_terceiro`, `enviado`, `data_movto`, `id_coleta_controlado`, `id_rota`, `id_frota_veiculo` |
| `BF_BOMBONAS_CADASTRADAS` | Container registry | `id_bombona`, `cod_barras`, `id_volume`, `status`, `id_cliente`, `capacidade`, `id_terceiro` |
| `BF_TERCEIROS` | Third-party destinations | `id_pessoa`, `cod_pessoa`, `razao_social` |
| `BF_PLACAS` | Vehicles | `id_frota_veiculo`, `placa_veiculo` |
| `bf_manifesto` | MTR/DC manifests | `id_manifesto`, `numero_manifesto`, `data_coleta`, `gerador`, `id_rota`, `id_pessoa` |
| `bf_etiqueta` | Label ranges/codes | `id_etiqueta`, `cod_etiqueta`, `id_manifesto`, `status` |
| `bf_telas` | Screen feature flags | `CARREGAR_VEICULO`, `ALOCAR_BOMBONA`, `COLETAR_BLUETOOTH`, `COLETAR_MANUAL`, `DESCARREGAR_VEICULO`, `LIBERAR_BOMBONA`, `CONSULTAR_BOMBONAS`, `CONSULTAR_COLETAS`, `CONSULTAR_MANIFESTOS` (values "S"/"N") |
| `bf_ponto_coleta` | Collection points for a route/day | `cod_cliente`, `razao_social`, `endereco`, `numero_manifesto`, `observacao_mtr`, `unidest_razao_social`, `coleta_extra`, `tipo_residuo`, `ordem`, `periodicidade`, `cliente_novo`, `id_manifesto`, `status`, `id_cliente`, `id_coleta_logradouro`, `cliente_emite_mtr`, `id_dia_coleta` |
| `bf_tipo_residuo` | Residue types | `id_tipo_residuo`, `codigo`, `descricao` |

### 5.2 Collection point status codes

| Code | Meaning | UI behaviour |
|---|---|---|
| `000` | Pending | Can start collection |
| `100` | Editable / partially collected | Can edit |
| `200` | Collected | Cannot collect again; can delete |
| `500` | No waste | Cannot collect; can delete |
| `600` | Client absent | Cannot collect; can delete |
| `900` | Collection completed | All actions disabled |

Status is recomputed on insert of a point using existing labels and collections for the manifest/day; it is not a general workflow engine.

### 5.3 Flags and formats

- Booleans in business columns are `"S"` / `"N"`.
- `enviado`: `"N"` unsent, `"S"` sent.
- `tipo_coleta`: `"QTD"` (quantity) or `"LT"` (litres).
- `data_coleta`: can be `dd/MM/yyyy` (query/date selection) or `dd/MM/yyyy HH:mm:ss` (stored collection timestamp). This inconsistency must be normalised in the new model.
- Weight is a string with comma decimal separator, e.g. `"12,34"`.
- `id_coleta_controlado` is generated as `yyyyMMddHHmmss` + (row count + 1); it is the closest thing to a client-generated id, but it is not collision-safe.

### 5.4 Preferences

| File | Key | Meaning |
|---|---|---|
| `ArquivoPreferencia` | `dataColeta` | Selected date |
| `ArquivoPreferencia` | `recebeIdRota`, `recebeIdMotorista`, `recebeIdFrotaVeiculo` | Selected ids |
| `ArquivoPreferencia` | `spinnerRotas`, `spinnerPlaca` | Display labels |
| `ArquivoPreferencia` | `id_rota`, `id_frota_veiculo` | Convenience copies used by collection screens |
| `TIPO_PESAGEM` | `TIPO_PESAGEM` | `MANUAL` or `BLUETOOTH` |
| `googleSign` | `isLoggedIn`, `name`, `e_mail`, `ID` | Google account/backup state |

---

## 6. HTTP API contract observed

**Base URL:** `http://ambientuus-tipartner.ddns.com.br:8085/ords/portalcliente/appcoleta/`  
**Client:** Retrofit 2 + Gson + OkHttp 3.14.9; timeouts 30 s connect / 90 s read / 60 s write.  
**Auth:** none. No interceptors, tokens, certificates, or headers.  
**Content type:** JSON; Gson field names are case-sensitive.

### 6.1 Endpoints

| Method | Path | Query / body | Response wrapper |
|---|---|---|---|
| GET | `listaBombonasLiberadas` | — | `{"BOMBONAS":[...]}` |
| GET | `listaclientemtr` | — | `{"CLIENTESMTR":[...]}` |
| GET | `consulta-etiqueta` | `etiqueta` | `{"coleta":[...]}` |
| GET | `listaManifesto` | `id_rota`, `data_coleta` | `{"manifestos":[...]}` |
| GET | `listamotoristas` | — | `{"MOTORISTAS":[...]}` |
| GET | `listaplaca` | — | `{"PLACAS":[...]}` |
| GET | `pontos-coleta` | `id_rota`, `data_coleta` | `{"pontos":[...]}` |
| GET | `listarotas` | — | `{"ROTAS":[...]}` |
| GET | `controleTelas` | — | `{"Telas":[...]}` |
| GET | `listaterceiros` | — | `{"TERCEIROS":[...]}` |
| GET | `tipos-residuos` | — | `{"tipos_residuos":[...]}` |
| GET | `listavolumes` | — | `{"VOLUMES":[...]}` |
| POST | `inseriMovimentoBombona` | `{"BOMBONAS":[...]}` | `{"BOMBONAS":[...]}` (observed type) |
| POST | `insericoletas` | `{"COLETAS":[...]}` | `{"COLETAS":[...]}` with `id_app_coleta` |

### 6.2 DTO field names

**Coleta / collection**

```text
peso, numero_mtr, data_coleta, id_rota, id_volume,
cliente_ausente, coleta_sem_residuo, coleta_extra, observacao,
enviado, id_cliente_emite_mtr, tipo_coleta, cod_bombona,
data_envio, id_coleta_controlado, id_coleta_servidor,
cod_etiqueta, id_tipo_residuo, id_volume_extra,
id_coleta_logradouro, id_dia_coleta
```

Serialized aliases: `id_coleta_logradouro`, `id_dia_coleta`, `id_tipo_residuo`, `id_volume_extra`.

**MovimentoBombona / container movement**

```text
cod_barras, id_cliente, id_terceiro, data_alocacao, data_coleta,
data_baixa, data_transporte, data_terceiro, id_coleta_controlado,
id_rota, id_frota_veiculo, tipo_movto
```

`tipo_movto` is used by the local app but is not persisted in `BF_MOVIMENTO_BOMBONAS`; the server infers movement type from which timestamps are present.

**Bombona / container registry**

```text
id_bombona, cod_barras, id_volume, status, id_cliente,
capacidade, id_terceiro
```

**ClienteMTR / client**

```text
id_pessoa, cod_pessoa, razao_social
```

**Manifesto / manifest**

```text
id_manifesto, numero_manifesto, data_coleta, gerador, id_rota, id_pessoa
```

**PontoColeta / collection point**

```text
id, id_cliente, cod_cliente, razao_social, endereco, numero_manifesto,
observacao_mtr, unidest_razao_social, coleta_extra, tipo_residuo,
ordem, periodicidade, cliente_novo, id_manifesto, status,
id_coleta_logradouro, cliente_emite_mtr, atualizado, id_dia_coleta
```

**BombonaCliente / QR lookup result**

```text
cod_cliente, nome_cliente, data_coleta, quantidade, peso_liquido,
numero_manifesto, etiquetas
```

**Volume / volume type**

```text
id_volume, descricao, tara
```

**Rota / route**

```text
id_rota, descricao, id_motorista, id_frota_veiculo, ordem
```

**Placas / vehicle**

```text
id_frota_veiculo, placa_veiculo
```

**Terceiro / third party**

```text
id_pessoa, cod_pessoa, razao_social
```

**TipoResiduo / residue type**

```text
id, id_tipo_residuo, codigo, descricao
```

**Telas / screen flags**

```text
CARREGAR_VEICULO, ALOCAR_BOMBONA, COLETAR_BLUETOOTH,
COLETAR_MANUAL, DESCARREGAR_VEICULO, LIBERAR_BOMBONA,
CONSULTAR_BOMBONAS, CONSULTAR_COLETAS, CONSULTAR_MANIFESTOS
```

### 6.3 Known API defects (relevant to the rewrite)

1. No authentication or authorisation; the APK is the credential.
2. Cleartext HTTP and a DDNS host.
3. No idempotency; retries can duplicate collections.
4. Full-table pulls; no incremental cursor.
5. No per-row validation results; partial failures are not handled.
6. Date formats depend on Oracle NLS/locale; the app sends `dd/MM/yyyy` and `dd/MM/yyyy HH:mm:ss` in different places.
7. Error bodies are logged; no stable error codes.
8. Reference sync deletes local tables before pulling, so a mid-sync failure can leave the device without data.

---

## 7. Business rules to preserve (unless changed by the client)

### 7.1 Route and vehicle

- A route belongs to a weekday; the driver selects a date and sees routes for that weekday.
- A route carries a driver and may carry a vehicle; the plate is selected separately.
- Only one route/vehicle is active per shift in the legacy app.

### 7.2 MTR / DC

- `numero_mtr` must be exactly 10 characters.
- Numbers starting with `DC` are "DC" documents; others are "MTR".
- If the client does not issue MTR (`cliente_emite_mtr='N'`), the app prefills the manifest number and can lock it.
- A label may only be used with the manifest it belongs to.

### 7.3 Weight

- Gross weight is recorded as text in kg, comma decimal separator.
- Tare comes from `bf_volume.tara`; net weight = gross - tare.
- Maximum accepted gross weight is 100.00 kg; above that the app warns and resets to `0,00`.
- Absent/no-waste records must have weight exactly `0,00`.
- The target model should store integer grams (or `numeric(12,3)` kg) and never use floating point for legal weights.

### 7.4 Labels

- Labels are numeric strings; range quantity is inclusive: `end - start + 1`.
- A label can belong to only one manifest.
- A label is created with status pending; a collection using it marks it used.
- The next label is the highest used label + 1, starting at the range start.
- If labels already exist for the manifest, the range is loaded and fields are locked.

### 7.5 Collection types

| Type | Flags | Required |
|---|---|---|
| Normal | `cliente_ausente=N`, `coleta_sem_residuo=N`, `coleta_extra=N` | 10-char MTR, weight > 0, container, valid label |
| No waste | `coleta_sem_residuo=S` | 10-char MTR, weight `0,00` |
| Client absent | `cliente_ausente=S` | 10-char MTR, weight `0,00` |
| Extra | `coleta_extra=S` | 10-char MTR, weight, observation, container; label optional but must match |

### 7.6 Container state machine

```text
DISPONIVEL --TR--> CARREGADO --A--> EM CLIENTE --C--> COLETADO --TC--> DESCARREGADO --B--> DISPONIVEL
```

- `A` (allocate) is only valid from `CARREGADO` (or no prior movement) and moves to `EM CLIENTE`.
- `TR` (load) is valid from `DISPONIVEL`/no prior movement.
- `C` (collect) requires `EM CLIENTE`.
- `TC` (third-party unload) requires `COLETADO`.
- `B` (release) is valid from any state and returns to `DISPONIVEL`.
- The legacy validation is string-based and has edge cases; the new implementation should encode a proper state machine with tests.

### 7.7 Collection point status

- The point status is derived from the manifest's labels and collections and the day's collection.
- A point with labels but missing collections is editable.
- A point with a collection for the day is collected.
- No-waste/absent are terminal for the day.
- Deleting a point's collections resets it to pending and deletes its labels.

### 7.8 Screen flags

- `bf_telas` controls whether each menu button is visible.
- The new platform should replace this with a feature-flag/entitlement model, but preserve the ability to hide features per tenant/route/driver.

### 7.9 Admin

- The legacy password gate is not a security control and must not be recreated.
- Admin/supervisor capabilities should be server-side roles with audit.

### 7.10 Implementation quirks observed

These are behaviours in the shipped code that the parity tests should confirm with the client before copying:

- `CapaPontoColetaActivity.finalizeColetaButtonAction()` sets status 500 (no waste) or 600 (absent), then can overwrite it with 200 (collected) when `finaliza=true`. The intended terminal status needs client confirmation.
- `ColetarActivity.validarCampos()` only rejects a label/manifest mismatch when the label is found in `bf_etiqueta`; unknown labels can pass that specific check.
- `BombonaTableManager.verificaStatusSincronizadoBombona()` is only partially recoverable from JADX (method dump skipped); the container status rules must be validated on a device rather than inferred from Java.
- `MovimentoBombonaTableManager.deleteMovtos7days()` is named "7 days" but deletes sent movements older than 30 days.
- `DriveServiceHelper.createFile()` creates the same backup file twice on one code path.
- `MainActivity` computes the route weekday as `Calendar.DAY_OF_WEEK - 1`, so Sunday is 0; confirm the server's weekday encoding before migrating routes.

---

## 8. Device integrations

### 8.1 Camera / barcode

- CameraX + ML Kit barcode scanning (bundled model).
- Custom overlay view.
- ZXing scanner view is also present for some screens.
- Reads 1D/2D codes, including QR codes on labels; no image leaves the device.

### 8.2 Bluetooth Classic scale

Observed implementation:

- SPP UUID: `00001101-0000-1000-8000-00805F9B34FB`.
- Connect with `createInsecureRfcommSocketToServiceRecord`.
- Read loop:
  - allocate a 150-byte buffer;
  - if `inputStream.available() > 0`, read up to 150 bytes;
  - convert to string, replace `.` with `,`, keep digits/commas;
  - take substring positions **33..37** as the weight;
  - write byte `0x04` every 1 second;
  - stop after the first frame in most screens.
- The hardcoded offsets are device/protocol-specific and must be validated with the actual scale model.
- Android 12+ requires `BLUETOOTH_CONNECT`/`BLUETOOTH_SCAN`; location permission is requested for discovery.
- The app stores no calibration or protocol settings per device.

### 8.3 Other device capabilities

- Audio beeps on success/error (`beep_ok.mp3`, `beep_erro.mp3`).
- Vibration/haptics not consistently used.
- GPS/location only for Bluetooth discovery permission; no location tracking observed in the app code.
- No NFC, no printer integration, no offline maps.

### 8.4 Google Drive

- OAuth via Credential Manager; scope `drive.file`.
- Full DB upload; 30-day cleanup.
- Personal account, not corporate; remove/replace in the new platform.

---

## 9. Non-functional observations

| Area | Legacy behaviour | Rewrite requirement |
|---|---|---|
| Offline | Full local SQLite; works without network | Offline-first, durable outbox, no data loss |
| Sync | Full delete/reload; no cursor | Delta sync, idempotency, per-item results |
| Auth | None | OIDC/PKCE, device binding, RBAC |
| Transport | HTTP | HTTPS/TLS only, certificate pinning |
| Local storage | Plain SQLite | SQLCipher + Keychain/Keystore/DPAPI |
| Admin | Hardcoded password | Server-side roles + audit |
| Backup | Personal Google Drive | Server-side encrypted backup; no personal Drive |
| Observability | Logcat only | Structured logs, metrics, crash reporting |
| Accessibility | Dense legacy layouts | WCAG 2.2 AA web; mobile screen-reader labels, large touch targets |
| Performance | Legacy views, full lists | Pagination, indexes, FlashList, cold start < 3 s on mid-range devices |

---

## 10. Parity checklist

Use this as the acceptance checklist for the rewrite. Each item must be covered by a test or a documented product decision.

### Shift / route
- [ ] Select date, route filtered by weekday, plate.
- [ ] Driver derived from route; route/vehicle stored for the shift.
- [ ] Screen/feature flags hide unavailable actions.
- [ ] Route/point/manifest data available offline after sync.

### Collection
- [ ] Scan/type container, label, MTR/DC.
- [ ] Label lookup resolves manifest/client.
- [ ] Normal, no-waste, absent, extra collection variants.
- [ ] Weight typed or read from scale; max 100 kg; 0,00 rule.
- [ ] Container/volume and tare; net weight.
- [ ] Residue type and notes.
- [ ] Duplicate label/collection prevention.
- [ ] Label range creation and next-label advancement.
- [ ] Point status transitions and finalize/partial behaviour.

### Containers
- [ ] Allocate, load, collect, third-party unload, release.
- [ ] State-machine validation and Portuguese error messages.
- [ ] Aggregate lists by capacity/client/third party.
- [ ] Individual container inventory and search.

### Queries / admin
- [ ] MTR/DC collection lists with gross/net totals.
- [ ] Manifest search.
- [ ] QR label lookup popup.
- [ ] Admin collection list replaced by server-side audit/permissions.

### Sync / migration
- [ ] Full bootstrap and delta sync.
- [ ] Upload collections and movements with idempotency.
- [ ] Retry/backoff and dead-letter handling.
- [ ] Legacy DB import and reconciliation.
- [ ] Old API adapter during transition.

### Platforms
- [ ] Android field app with camera + Classic SPP scale.
- [ ] iOS field app with camera + BLE scale (or documented MFi/hardware limitation).
- [ ] Windows app with camera/USB scanner + serial/BLE scale + printing.
- [ ] Web admin/dispatch with map, reports, audit.

---

## 11. Unknowns and information still needed

1. **ORDS**: schema/ERD, credentials, authentication, exact JSON samples, date/NLS behaviour, error shapes, rate limits, hosting topology, who operates it.
2. **Business rules**: MTR/DC issuance, residue types, weight rounding/tolerance, label printing, who may edit/delete, closing rules, retention.
3. **Hardware**: scale models and protocol documentation, iOS/MFi status, barcode symbology, printers, rugged devices, Android versions.
4. **Scale**: fleet size, routes/day, stops/day, weighings/day, peak concurrency, offline duration, DB size per device.
5. **Distribution**: Play Store, MDM, App Store, enterprise, sideload; signing keys; update policy.
6. **Legal**: LGPD basis, data residency, retention, DPIA, Google Drive backup requirement, MTR/SINIR obligations.
7. **Brand/design**: vector logo, colors, terminology, accessibility requirements.
8. **Integrations**: ERP, invoicing, SINIR, WhatsApp, customer portal.

---

## 12. References

- [Original source snapshot](../../original-source/README.md)
- [Architecture and reconstruction analysis](../analysis/APP-ARCHITECTURE-AND-RECONSTRUCTION.md)
- [Security assessment](../analysis/APK-SECURITY-ASSESSMENT.md)
- [Evidence index](../../artifacts/EVIDENCE-INDEX.md)
