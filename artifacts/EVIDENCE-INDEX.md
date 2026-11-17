# Evidence Index

All REA evidence IDs below are bound to the target digest
`94e4d8a5ce2b9c79fb44846e6237b632eb6546734cca5c74314c6d44faf1c1f5`
(`app_coleta_ambientuus_hom_1.59 2.apk`). References are retrievable from this
session and from `rea-evidence-bundle.json`.

## Signature and package

| Evidence ID | Operation | Establishes |
|---|---|---|
| `ev_7b6b117fa29582ef76ca4313e06e6c959b843090f3d37c68de2298e356320223` | `inspect_apk_signature` (summary view) | v1+v2, one signer, no v3/v3.1, no rotation, no source stamp |
| `ev_13085ede351182421d4e633079dd75eacbb23c48ed8da440f259364b3aff180f` | complete signature evidence | per-scheme signers, certificate digest, limitations |
| `ev_2147031df3793cd83ac7147c811a3b0cfdcbb16d61053afc4833d587af2d6511` | `inspect_android_package` (summary) | package, version, SDKs, permissions, components |
| `ev_01e9625292feb93150b838718b89ef48195876dc860948ea12374a3de5aceb77` | complete package evidence | decoded manifest text, full component inventory |

## Application inventory

| Evidence ID | Operation | Establishes |
|---|---|---|
| `ev_620315e1f80ed8f68dcb5f9437157b207715d2ab76bb4fa3f866883e4eced383` | `search_android_classes("ambientuus")` | 128 application classes |
| `ev_ce7e9727dd6650963d2cd385764f814b483facba1fe8bfa2134391f8fddffc88` | complete class inventory | all 11,250 top-level classes |
| `ev_ad28953542488b4a7a964c6e2a1c3e8a3a3747b3a2041895b3254645f863c03e` | `inspect_android_class(MainActivity)` | screen methods, hardcoded state fields |
| `ev_5eec50d7a210f0590c428ce7562535fe1fc951b72ff4c88a4e36a74f71660e5e` | `inspect_android_class(TelaAdmActivity)` | admin screen surface |

## Network and authentication

| Evidence ID | Operation | Establishes |
|---|---|---|
| `ev_bf1c89bcdf964ce705d54435ffa71a6386d39eed902a5eac4bccc770fa235c6b` | `inspect_android_class(RetrofitClient)` | `BASE_URL` = cleartext DDNS URL |
| `ev_ec1166df19acc1775c6590e8bcdbc007c3fc976f9baa6427c9c8e96465850a87` | `inspect_android_method(RetrofitClient.getClient)` | client with timeouts only — no interceptors, no auth |
| `ev_cb9dbe2601f00ff4caa13187e18534f3aa9289ab5ee7ea27ba6188e33a6d3698` | `inspect_android_class(ApiService)` | 14 endpoints, business parameters only |
| `ev_3cc039cda106deead1dc8a6fc44c10723ed4a52b1d77c6422219bfa7e0ef554f` | `inspect_android_class(UtilWs)` | second copy of the cleartext base URL |
| `ev_3932c67485422461515e36e7bd314bcbe2567f73d4ef3612aa0b619584ae136b` | `inspect_android_class(BuildConfig)` | `BUILD_TYPE=debug`, `URL_BASE`, version |
| `ev_8676080578a710903642f7b1732adffd0bdd11aa3991840b0f41447f0d51f5a8` | `inspect_android_method(MotoristasService.sincronizar)` | unauthenticated GET consumed synchronously |
| `ev_8f8d032cb3b56cf278a1205d20e65c64a6a64577fe6ea2d7741ef92add9a4389` | `inspect_android_method(MovimentoBombonaService.enviarMovimentos)` | unauthenticated POST; error body logged |

## Access control and storage

| Evidence ID | Operation | Establishes |
|---|---|---|
| `ev_9a007974491706a99408f151e9024e06b4b0971ffb7e00be211bbd2296f6766f` | `inspect_android_method(MainActivity.createDialogSenha)` | hardcoded admin password `@tenas66` |
| `ev_7dcc80648b977e701d9987b7d452152dd0acf0d90a1cc1940e24a0b5ba1d57be` | `inspect_android_method(MainActivity.loadPreferences)` | plaintext SharedPreferences keys |
| `ev_f41ce3f8fc5bcdfb874b282d8e600a40fa0a17e4730e17bbcb3126880c686aec` | `inspect_android_method(TelaAdmActivity.onCreate)` | admin list over all collections |
| `ev_4d2565e5afe412e5751fc78c3893ff8551ff28a795e11d35ba96ca6f8a8a5a42` | `inspect_android_class(DatabaseHelper)` | `bf_app_ambientus.db`, 14 tables |
| `ev_cebe60b8c2ed3e644e1a37f6bc99cc059f01527cf2b62e3890c57a0daf75ff78` | `inspect_android_method(DatabaseHelper.onCreate)` | table creation order |
| `ev_481c29f1146a706b9ece4af8964f919bf134f53f68090bfbbe2101800f7c3212` | `inspect_android_method(ColetaTableManager.createTable)` | `bf_coleta` schema, MTR/observation fields |
| `ev_b6d8b7bd6ad2364fb8a2c8cf39d01f4ee93ae5cbb2cd70ff5b4b0a7875fab003` | `inspect_android_class(PesagemPreferences)` | weighing-mode preference storage |

## Data egress

| Evidence ID | Operation | Establishes |
|---|---|---|
| `ev_b2f8d6c6d87c34faf54a32f4a9bd54ae35989bf303f8ff38f6f1efdcba146eec` | `inspect_android_class(GoogleSignInHelper)` | Google credential flow |
| `ev_b8f85c2028761f0b5765347112b2709c85891c901cf849fe81ab5db12f959474` | `inspect_android_method(GoogleSignInHelper.signIn)` | Credential Manager + server client id |
| `ev_0a9464898a28b24227574283360f135f27ec0b9cb904ca48f3136ec38b5c6784` | `inspect_android_method(handleSignInResult)` | ID-token credential handling |
| `ev_c7e3eebf42b067efff95bf1efa24cd9c1cdb8d00b1b125c0c086120cc2fd3585` | `inspect_android_class(DriveServiceHelper)` | backup/upload/delete surface |
| `ev_80be555b78e879bcf74cf7390ce69613b9e2cba0130e7d90b6c31cbd2e6c1bc8` | `inspect_android_method(backupDatabase)` | `drive.file` OAuth scope, DB upload |

## Independent (non-REA) artifacts

| Artifact | Establishes |
|---|---|
| `keytool -printcert -jarfile` output (in assessment §4 SEC-06) | certificate subject/validity/fingerprint |
| `artifacts/apktool/AndroidManifest.xml` | decoded manifest corroborating debuggable/backup/cleartext flags |
| `artifacts/strings/dex-strings.txt` and derived lists | 210,470 DEX strings; 8 hosts; endpoint literals; `@tenas66`; `okhttp/3.14.9` |
| `artifacts/apktool/unknown/*.properties` | bundled SDK versions |
| `artifacts/rea-evidence-bundle.json` | exportable REA evidence bundle for this session |
