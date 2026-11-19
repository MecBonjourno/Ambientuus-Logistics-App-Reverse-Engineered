# Mapa do código

Visão funcional do aplicativo reconstruído, em português. Caminhos citados referem-se à cópia
traduzida (`pt-BR/java/...`); os arquivos originais estão em `../java/...`.

## Visão geral

Aplicativo de apoio à **coleta de resíduos**: o motorista escolhe rota e placa, lê etiquetas
(código de barras/QR), registra pesagens e números de MTR, trabalha **offline** contra um banco
SQLite local e sincroniza com um back-end Oracle ORDS.

- 128 classes no pacote `com.coleta.ambientuus`
- 15 DTOs + 15 listas de transporte
- 14 tabelas SQLite
- 14 serviços de rede (12 GET + 2 POST)
- 22 telas (`activities`)

## Fluxo principal

```
SelecaoActivity  →  MainActivity (data, rota, placa)
                         │
      ┌──────────────────┼───────────────────┐
      ▼                  ▼                   ▼
 LeitorColeta      LeitorEtiqueta      LeitorBombona
 (QR/código)       (consulta etiqueta) (movimento de bombona)
      │                  │                   │
      └────────► ColetarActivity ◄───────────┘
                 (peso, MTR, resíduo, observação)
                         │
                         ▼
              SQLite local (bf_coleta)
                         │
                         ▼
        Repository → Services → API ORDS (sincronização)
```

## Pacotes

| Pacote | Papel | Destaques |
|---|---|---|
| `activities` | Telas e navegação | `main.MainActivity`, `SelecaoActivity`, `ColetarActivity`, `TelaAdmActivity` |
| `activities.bombona` | Operações com contêineres | ler, carregar, baixar, leitor |
| `activities.pontoColeta` | Pontos de coleta | listagem, capa, etiqueta, coleta extra |
| `adapters` | Listas e spinners | 13 adaptadores |
| `database` | Persistência local | `DatabaseHelper` + 14 gerentes de tabela |
| `domain.model` | Enumerações de domínio | `ModoSincronizacao`, `SyncState`, `TipoPesagem` |
| `dto` | Contratos JSON | `Coleta`, `Manifesto`, `Bombona`, `MovimentoBombona`… |
| `fragments` | Seleção de data e listas | `DatePickerFragment`, `EtiquetasFragment` |
| `googleDrive` | Backup do banco | `GoogleSignInHelper`, `DriveServiceHelper` |
| `ui` | Componentes visuais | alertas, progresso, spinner pesquisável |
| `utils` | Utilidades | `BluetoothConnector`, `BluetoothReader`, `PesagemPreferences`, `UtilWs` |
| `views` | Sobreposição da câmera | `OverlayView` |
| `ws` | Rede | `RetrofitClient`, `ApiService`, `Repository` + `Services/` |

## Camada de rede

Cliente Retrofit com Gson e OkHttp. A URL base é fixa em `RetrofitClient`, `UtilWs` e `BuildConfig`.

| Método | Chamada | Direção |
|---|---|---|
| GET | `getBombonas()` | baixar contêineres |
| GET | `getClientesMTR()` | baixar clientes de MTR |
| GET | `getConsultaEtiqueta(String)` | consultar etiqueta |
| GET | `getManifesto(int, String)` | baixar manifestos |
| GET | `getMotorista()` | baixar motoristas |
| GET | `getPlacas()` | baixar placas |
| GET | `getPontoColeta(int, String)` | baixar pontos de coleta |
| GET | `getRotas()` | baixar rotas |
| GET | `getTelas()` | baixar configuração de telas |
| GET | `getTerceiros()` | baixar terceiros |
| GET | `getTipoResiduo()` | baixar tipos de resíduo |
| GET | `getVolumes()` | baixar volumes |
| POST | `postBombona(MovimentoBombonaList)` | enviar movimentos de contêiner |
| POST | `postColeta(ColetaList)` | enviar coletas |

## Banco local

Arquivo `bf_app_ambientus.db` (SQLite, sem criptografia). Tabelas: `bf_coleta`, `bombona`,
`cliente_mtr`, `etiqueta`, `manifesto`, `motorista`, `movimento_bombona`, `placas`,
`ponto_coleta`, `rota`, `telas`, `terceiro`, `tipo_residuo`, `volume`.

`bf_coleta` guarda peso, `numero_mtr`, data, rota, volume, observação, código da etiqueta, tipo de
resíduo e os controles de sincronização (`enviado`, `id_coleta_servidor`, `data_envio`).

## Integrações com o aparelho

| Integração | Classes | Observação |
|---|---|---|
| Câmera + código de barras | `OverlayView`, `Leitor*Activity` | ML Kit no aparelho, modelos embarcados |
| Bluetooth (balança/leitor) | `BluetoothConnector`, `BluetoothReader`, `BuscaDispositivoActivity` | SPP clássico |
| Login Google + backup | `GoogleSignInHelper`, `DriveServiceHelper` | Credential Manager; escopo `drive.file` |
| Preferências | `PesagemPreferences` | modo de pesagem |

## Sincronização

`MainActivity.sincronizarApp()` instancia o `Repository`, que baixa cada cadastro por um serviço
(`sincronizarMotoristas()`, `sincronizarRotas()`, …), grava nas tabelas locais e envia coletas e
movimentos pendentes por `postColeta` / `postBombona`, marcando `enviado`.

## Observações de segurança

O código evidencia os pontos críticos do laudo: HTTP sem TLS, ausência de autenticação no cliente,
build `debuggable`, senha de administrador fixa no código e banco local sem criptografia. O laudo
completo está em [../../docs/analysis/APK-SECURITY-ASSESSMENT.md](../../docs/analysis/APK-SECURITY-ASSESSMENT.md).

## Onde ler

- Telas: `pt-BR/java/com/coleta/ambientuus/activities/`
- Rede: `pt-BR/java/com/coleta/ambientuus/ws/`
- Banco: `pt-BR/java/com/coleta/ambientuus/database/`
- Modelos: `pt-BR/java/com/coleta/ambientuus/dto/`
