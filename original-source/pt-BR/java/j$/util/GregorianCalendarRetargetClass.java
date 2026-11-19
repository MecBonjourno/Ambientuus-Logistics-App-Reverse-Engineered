package j$.util;

import j$.time.ZonedDateTime;
import java.util.GregorianCalendar;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class GregorianCalendarRetargetClass {
    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public static /* sintético */ ZonedDateTime toZonedDateTime(GregorianCalendar gregorianCalendar) {
        return gregorianCalendar instanceof GregorianCalendarRetargetInterface ? ((GregorianCalendarRetargetInterface) gregorianCalendar).toZonedDateTime() : DesugarGregorianCalendar.toZonedDateTime(gregorianCalendar);
    }
}
