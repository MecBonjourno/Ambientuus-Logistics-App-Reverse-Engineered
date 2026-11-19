package j$.util;

import j$.time.ZoneId;
import java.util.TimeZone;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes15.dex */
public final /* sintético */ class TimeZoneRetargetClass {
    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public static /* sintético */ ZoneId toZoneId(TimeZone timeZone) {
        return timeZone instanceof TimeZoneRetargetInterface ? ((TimeZoneRetargetInterface) timeZone).toZoneId() : DesugarTimeZone.toZoneId(timeZone);
    }
}
