# Metadados do APK — versão em português

Este documento descreve, em português, o conteúdo de `APK-METADATA.json` (que permanece intacto,
com chaves em inglês, por ser um arquivo de dados consumido por ferramentas).

## Artefato original

| Campo | Valor |
|---|---|
| Arquivo | `APKFiles/OriginalApp/app_coleta_ambientuus_hom_1.59 2.apk` |
| Tamanho | 54.720.633 bytes |
| SHA-256 | `94e4d8a5ce2b9c79fb44846e6237b632eb6546734cca5c74314c6d44faf1c1f5` |
| Pacote | `com.coleta.ambientuus.debug` |
| Versão | `1.59-DEBUG` (versionCode 59) |
| minSdk / targetSdk / compileSdk | 23 / 35 / 35 |
| Rótulo | "Coletas Ambientuus - Homologação" |
| Arquivos DEX | 17 |
| Entradas no APK | 1.167 |

## Impressão digital da build original

Recuperada das strings de metadados D8/R8 presentes no DEX original e ausentes após a remontagem smali:

| Item | Valor |
|---|---|
| Versão do D8 | 8.9.35 |
| `min-api` | 23 |
| Modo de compilação | `debug` |
| `desugar_jdk_libs` | 2.1.5 |
| Evidência de R8 | classes lambda sintéticas (`$$ExternalSyntheticLambda`) e pontos de entrada renomeados |

## Extração

| Item | Valor |
|---|---|
| Data | 2026-11-17 |
| Ferramentas | apktool 2.11.1, JADX 1.5.1, Temurin 21.0.13+9, build-tools 35.0.0 |
| `apk/` | Árvore apktool sem perdas (smali, recursos, assets, bibliotecas nativas, manifesto) |
| `java/` | Descompilação JADX de todas as classes (referência legível) |
| `MANIFEST.sha256` | Hash SHA-256 de cada arquivo extraído |
| Contagens | 21.674 arquivos smali; 11.284 arquivos Java; 128 classes do aplicativo; 11.250 classes de nível superior |

## Recompilação

| Item | Valor |
|---|---|
| Script | `build/build-rebuilt.ps1` |
| Pipeline | `apktool b` → `zipalign -P 16` → `apksigner` (v1+v2+v3) |
| Saída | `build/dist/app_coleta_ambientuus_rebuilt.apk` |
| Tamanho | 53.596.989 bytes |
| SHA-256 | `5d780397067e762b218ab025658bb8c4484b1120283066d673a22d546c05cbe2` |
| Assinatura | Chave de referência `build/keys/reference-debug.jks` (**não é a chave do cliente**) |
| Certificado | SHA-256 `05d8a8b7bcd3bc9e10b602f55e70b918cd8faa77ee0d16d3c73556e61141b83d` |
| Esquemas | v1, v2 e v3 válidos; v3.1 e v4 ausentes |

## Verificação

| Verificação | Resultado |
|---|---|
| Badging | 130/130 linhas idênticas ao original |
| DEX | 17 arquivos; 21.674 classes; 171.219 métodos; 77.064 campos — idênticos |
| Entradas ZIP | 1.167 em ambos |
| Ida e volta smali | 21.661 de 21.674 arquivos byte a byte idênticos; 13 diferem apenas por `= false` explícito |
| Pool de strings DEX | 19 strings a menos, todas blobs de metadados D8/R8 |
| Recursos | 256 caminhos normalizados pelo colapso de qualificadores de versão |
| Execução | Android 15 (API 35), instalação e abertura com sucesso; 0 pixels diferentes do original abaixo da barra de status |

## Conclusão

Recompilação semanticamente completa: metadados de pacote idênticos, inventário de classes, métodos
e campos idêntico, interface idêntica em execução, assinada e instalável.
