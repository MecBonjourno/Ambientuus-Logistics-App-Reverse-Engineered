package j$.util;

import j$.time.Instant;
import java.util.Date;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class DateRetargetClass {
    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public static /* sintético */ Instant toInstant(Date date) {
        return date instanceof DateRetargetInterface ? ((DateRetargetInterface) date).toInstant() : DesugarDate.toInstant(date);
    }
}
