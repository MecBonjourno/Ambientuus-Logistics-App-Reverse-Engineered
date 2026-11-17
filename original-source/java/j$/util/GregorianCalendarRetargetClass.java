package j$.util;

import j$.time.ZonedDateTime;
import java.util.GregorianCalendar;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes15.dex */
public final /* synthetic */ class GregorianCalendarRetargetClass {
    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ZonedDateTime toZonedDateTime(GregorianCalendar gregorianCalendar) {
        return gregorianCalendar instanceof GregorianCalendarRetargetInterface ? ((GregorianCalendarRetargetInterface) gregorianCalendar).toZonedDateTime() : DesugarGregorianCalendar.toZonedDateTime(gregorianCalendar);
    }
}
