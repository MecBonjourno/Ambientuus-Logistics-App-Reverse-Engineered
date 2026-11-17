package j$.util;

import j$.time.ZoneId;
import java.util.TimeZone;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes15.dex */
public final /* synthetic */ class TimeZoneRetargetClass {
    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ZoneId toZoneId(TimeZone timeZone) {
        return timeZone instanceof TimeZoneRetargetInterface ? ((TimeZoneRetargetInterface) timeZone).toZoneId() : DesugarTimeZone.toZoneId(timeZone);
    }
}
