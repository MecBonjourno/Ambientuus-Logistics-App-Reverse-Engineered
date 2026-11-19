# Código-fonte original — SNAPSHOT CONGELADO

> **NÃO EDITE ESTE DIRETÓRIO.**
> Ele é a extração preservada e compilável do APK distribuído
> `APKFiles/OriginalApp/app_coleta_ambientuus_hom_1.59 2.apk`
> (SHA-256 `94e4d8a5ce2b9c79fb44846e6237b632eb6546734cca5c74314c6d44faf1c1f5`).
> Qualquer mudança no aplicativo distribuído deve gerar um **novo diretório de snapshot**,
> nunca uma alteração neste.

> **Nota desta versão:** este arquivo é a tradução para português do Brasil do
> `../README.md` original, que permanece intacto. A camada `pt-BR/` é derivada e não faz
> parte do snapshot congelado; veja [SOBRE-ESTA-TRADUCAO.md](SOBRE-ESTA-TRADUCAO.md).

## O que é isto

O código-fonte Android original do cliente não existe mais em forma de projeto. Este diretório
reconstrói o aplicativo a partir do binário distribuído, sem acesso ao projeto original, e prova
que a reconstrução ainda gera um APK instalável.

| Caminho | Conteúdo | Fidelidade |
|---|---|---|
| `apk/` | Árvore apktool sem perdas: `AndroidManifest.xml`, `apktool.yml`, `smali/` + `smali_classes2..17/`, `res/`, `assets/`, `lib/`, `original/`, `unknown/` | **Bytecode exato** (desmontagem smali dos 17 arquivos DEX) |
| `java/` | Descompilação JADX 1.5.1 de todas as classes (11.284 arquivos `.java`) | **Aproximada**: Java legível, não garantidamente compilável; 15 arquivos contêm marcadores `JADX ERROR` |
| `APK-METADATA.json` | Identidade do pacote, versões de ferramentas, impressão digital da build, resultados de verificação | — |
| `MANIFEST.sha256` | SHA-256 de cada arquivo extraído (mais de 34.000) | — |
| `verify-original-source.ps1` | Verificador de integridade (`-Full` calcula o hash de todos os arquivos) | — |

A **árvore smali é a fonte autoritativa**: é o que a recompilação monta. A árvore Java serve para leitura humana.

## Procedência

| Item | Valor |
|---|---|
| Extraído em | 2026-11-17 |
| apktool | 2.11.1 (desmontagem + recompilação) |
| JADX | 1.5.1 |
| JDK | Temurin 21.0.13+9 |
| Android build-tools | 35.0.0 (aapt2, zipalign, apksigner) |
| Arquivos DEX | 17; 21.674 classes smali |
| Impressão digital da build original | D8 **8.9.35**, `min-api 23`, `compilation-mode debug`, `desugar_jdk_libs 2.1.5` (recuperada de strings de metadados D8 no DEX original) |

## Fidelidade — medida, não presumida

O snapshot foi recompilado e comparado com o original:

| Verificação | Resultado |
|---|---|
| Badging (pacote, versão, SDK, permissões, rótulo, launcher) | 130/130 linhas idênticas |
| Contagem de classes / métodos / campos no DEX | 21.674 / 171.219 / 77.064 — idênticas |
| Ida e volta smali (desmontar → compilar → desmontar) | 21.661 de 21.674 arquivos **byte a byte idênticos**; as 13 diferenças são apenas inicializadores explícitos `= false` em campos estáticos (semanticamente idênticos) |
| Pool de strings do DEX | 19 strings perdidas — todas **blobs de metadados D8/R8** (`~~D8{…}`, `~~L8{…}`, `~~~{…}`); nenhum código ou literal perdido |
| Caminhos de recursos | 256 caminhos diferem porque o aapt2 colapsa qualificadores de versão redundantes no minSdk 23 (ex.: `res/color-v23` → `res/color`); IDs e valores de recursos inalterados |
| Execução | Instalado em emulador Android 15 (API 35), iniciado, **0 pixels diferentes** em relação à captura do APK original abaixo da barra de status |

## O que *não* é reproduzido

1. **A assinatura.** A chave original pertencia a terceiros e não está disponível; a recompilação é assinada com `build/keys/reference-debug.jks` — uma chave de referência, **não destinada à distribuição**. O APK recompilado não atualiza um original instalado; ele é instalado do zero.
2. **DEX byte a byte idêntico.** A remontagem a partir do smali preserva classes, métodos, campos e instruções, mas recodifica o contêiner DEX e descarta os blobs de metadados D8 citados acima.
3. **O projeto Java original.** Não havia projeto Gradle, pipeline de recursos ou declaração de dependências a recuperar; a recompilação é uma montagem com apktool, não uma compilação de `java/`.

## Recompilar

```powershell
# a partir da raiz do repositório
powershell -ExecutionPolicy Bypass -File build\build-rebuilt.ps1
powershell -ExecutionPolicy Bypass -File build\verify-rebuilt.ps1 -Deep
```

Saída: `build/dist/app_coleta_ambientuus_rebuilt.apk` (assinado, alinhado para páginas de 16 KB).
A build prepara uma cópia em `build/work/apk`, portanto este diretório nunca é escrito.

## Verificar que nada foi alterado

```powershell
powershell -ExecutionPolicy Bypass -File original-source\verify-original-source.ps1 -Full
```

## Nota jurídica

As árvores `java/` e `smali/` incluem bibliotecas de terceiros (AndroidX, Google Play Services,
ML Kit, OkHttp, Gson, Retrofit, Kotlin) que permanecem sob suas próprias licenças. Use este snapshot
para análise de segurança, manutenção e reconstrução do aplicativo do cliente; não redistribua código
de terceiros descompilado.
