package j$.time;

import androidx.constraintlayout.core.motion.utils.TypedValues;
import j$.util.Objects;
import org.chromium.base.TimeUtils;

/* carregado de: classes15.dex */
public final class DesugarLocalTime {
    static final long NANOS_PER_SECOND = 1000000000;
    static final int SECONDS_PER_DAY = 86400;

    private DesugarLocalTime() {
    }

    public static long toEpochSecond(LocalTime receiver, LocalDate date, ZoneOffset offset) {
        Objects.requireNonNull(date, "date");
        Objects.requireNonNull(offset, TypedValues.CycleType.S_WAVE_OFFSET);
        long epochDay = date.toEpochDay();
        long secs = (TimeUtils.SECONDS_PER_DAY * epochDay) + receiver.toSecondOfDay();
        return secs - offset.getTotalSeconds();
    }

    public static LocalTime ofInstant(Instant instant, ZoneId zone) {
        Objects.requireNonNull(instant, "instant");
        Objects.requireNonNull(zone, "zone");
        ZoneOffset offset = zone.getRules().getOffset(instant);
        long localSecond = instant.getEpochSecond() + offset.getTotalSeconds();
        int secsOfDay = DesugarLocalTime$$ExternalSyntheticBackport0.m(localSecond, SECONDS_PER_DAY);
        return LocalTime.ofNanoOfDay((secsOfDay * NANOS_PER_SECOND) + instant.getNano());
    }
}
