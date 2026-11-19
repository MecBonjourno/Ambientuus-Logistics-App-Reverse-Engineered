# Sobre esta tradução

**Objetivo:** permitir que a equipe brasileira leia a documentação e os comentários do código
extraído em português, **sem alterar uma única linha da cópia original**.

## O que foi traduzido

| Original (congelado) | Tradução | Natureza |
|---|---|---|
| `../README.md` | [README.md](README.md) | Tradução integral |
| `../APK-METADATA.json` | [APK-METADATA.md](APK-METADATA.md) | Narrativa em português (o JSON original permanece intacto, com chaves em inglês) |
| `../java/**/*.java` (11.284 arquivos) | `java/**/*.java` | Cópia-espelho com **apenas os comentários** traduzidos |
| — | [GLOSSARIO.md](GLOSSARIO.md) | Glossário técnico e dos marcadores do JADX |
| — | [MAPA-DO-CODIGO.md](MAPA-DO-CODIGO.md) | Mapa funcional do aplicativo em português |

## O que **não** foi traduzido (e por quê)

| Conteúdo | Motivo |
|---|---|
| `../apk/smali/**` (21.674 arquivos) | Os `#` do smali são diretivas estruturais do baksmali (`# direct methods`, `# annotations`), não documentação humana, e a árvore smali é a **entrada de compilação** do APK. Traduzi-las não agrega informação e criaria uma segunda árvore de 185 MB que não deve ser usada para compilar. |
| `../apk/res/values/strings.xml` | São textos de interface do aplicativo, majoritariamente já em português; os demais pertencem a bibliotecas. Não é documentação. |
| Chaves de JSON, nomes de classes, métodos, campos e strings de código | Alterá-los mudaria o significado do código. A tradução toca **somente comentários**. |
| `apktool.yml`, `AndroidManifest.xml` | Arquivos de configuração consumidos por ferramentas; não contêm comentários. |

## Como a tradução foi feita

1. `tools/jadx-comment-map.json` define 45 pares texto original → português, cobrindo **todos** os
   marcadores que o JADX gera nesta base: `from class`, `loaded from`, `renamed from`, os 15
   motivos de renomeação, as 14 mensagens `JADX INFO` e os 23 prefixos `JADX WARN`.
2. `tools/translate-jadx-comments.ps1` percorre a árvore, aplica o mapa, grava a cópia em UTF-8 sem
   BOM e **verifica** o resultado revertendo a tradução e comparando com o original: se o código
   voltar idêntico, apenas comentários mudaram.
3. A verificação roda com `-Verify` e falha se qualquer arquivo divergir.

### Regerar a camada traduzida

```powershell
# a partir da raiz do repositório
powershell -ExecutionPolicy Bypass -File tools\translate-jadx-comments.ps1 `
  -Source original-source\java `
  -Destination original-source\pt-BR\java `
  -Verify
```

Para traduzir apenas o código do aplicativo (125 classes, ~1,3 MB):

```powershell
powershell -ExecutionPolicy Bypass -File tools\translate-jadx-comments.ps1 `
  -Source original-source\java\com\coleta `
  -Destination original-source\pt-BR\java\com\coleta `
  -Verify
```

## Integridade

A camada `pt-BR/` é **derivada**: não entra em `../MANIFEST.sha256` e é explicitamente ignorada
pelo verificador do snapshot congelado. O comando abaixo continua provando que a extração original
está intacta:

```powershell
powershell -ExecutionPolicy Bypass -File original-source\verify-original-source.ps1 -Full
```

## Limitações

- A tradução é textual: não altera nomes, assinaturas, literais nem a ordem das instruções.
- Comentários originais do desenvolvedor **não existem** no APK (comentários não são compilados);
  o que existe são anotações geradas pelo descompilador, agora em português.
- Nomes de tipos e palavras-chave Java (por exemplo `private`, `switch`, `string`) permanecem em
  inglês dentro dos comentários, porque são referências de código.
