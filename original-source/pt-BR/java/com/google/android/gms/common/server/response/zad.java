package com.google.android.gms.common.server.response;

import com.google.android.gms.common.server.response.FastParser;
import java.io.BufferedReader;
import java.io.IOException;

/* compiled from: com.google.android.gms:play-services-base@@18.4.0 */
/* carregado de: classes16.dex */
final class zad implements zai {
    zad() {
    }

    @Override // com.google.android.gms.common.server.response.zai
    public final /* sintético */ Object zaa(FastParser fastParser, BufferedReader bufferedReader) throws FastParser.ParseException, IOException {
        double zaj;
        zaj = fastParser.zaj(bufferedReader);
        return Double.valueOf(zaj);
    }
}
