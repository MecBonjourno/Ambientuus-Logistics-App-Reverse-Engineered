package com.google.zxing.client.result;

/* carregado de: classes16.dex */
public final class ExpandedProductResultParser extends ResultParser {
    /* JADX WARN: não é possível corrigir a ordem dos casos do switch; parte do código será duplicada */
    /* JADX WARN: Code restructure failed: missing block: B:139:0x01e8, code lost:
    
        if (r3.equals("10") != false) goto L120;
     */
    @Override // com.google.zxing.client.result.ResultParser
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.google.zxing.client.result.ExpandedProductParsedResult parse(com.google.zxing.Result r24) {
        /*
            Method dump skipped, instructions count: 888
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.zxing.client.result.ExpandedProductResultParser.parse(com.google.zxing.Result):com.google.zxing.client.result.ExpandedProductParsedResult");
    }

    private static String findAIvalue(int i, String rawText) {
        char c = rawText.charAt(i);
        if (c != '(') {
            return null;
        }
        CharSequence rawTextAux = rawText.substring(i + 1);
        StringBuilder buf = new StringBuilder();
        for (int index = 0; index < rawTextAux.length(); index++) {
            char currentChar = rawTextAux.charAt(index);
            if (currentChar == ')') {
                return buf.toString();
            }
            if (currentChar < '0' || currentChar > '9') {
                return null;
            }
            buf.append(currentChar);
        }
        return buf.toString();
    }

    private static String findValue(int i, String rawText) {
        StringBuilder buf = new StringBuilder();
        String rawTextAux = rawText.substring(i);
        for (int index = 0; index < rawTextAux.length(); index++) {
            char c = rawTextAux.charAt(index);
            if (c == '(') {
                if (findAIvalue(index, rawTextAux) != null) {
                    break;
                }
                buf.append('(');
            } else {
                buf.append(c);
            }
        }
        return buf.toString();
    }
}
