package j$.time;

import j$.util.Objects;
import org.chromium.base.TimeUtils;

/* loaded from: classes15.dex */
public final class DesugarOffsetTime {
    private DesugarOffsetTime() {
    }

    public static long toEpochSecond(OffsetTime receiver, LocalDate date) {
        Objects.requireNonNull(date, "date");
        long epochDay = date.toEpochDay();
        LocalTime time = receiver.toLocalTime();
        long secs = (TimeUtils.SECONDS_PER_DAY * epochDay) + time.toSecondOfDay();
        ZoneOffset offset = receiver.getOffset();
        return secs - offset.getTotalSeconds();
    }
}
