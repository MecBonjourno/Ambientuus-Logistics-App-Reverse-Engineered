package j$.time;

import androidx.constraintlayout.core.motion.utils.TypedValues;
import j$.time.zone.ZoneRules;
import j$.util.Objects;
import j$.util.stream.LongStream;
import j$.util.stream.Stream;
import org.chromium.base.TimeUtils;

/* loaded from: classes15.dex */
public final class DesugarLocalDate {
    public static final LocalDate EPOCH = LocalDate.of(1970, 1, 1);
    private static final int SECONDS_PER_DAY = 86400;

    private DesugarLocalDate() {
    }

    public static Stream<LocalDate> datesUntil(LocalDate receiver, LocalDate endExclusive) {
        long end = endExclusive.toEpochDay();
        long start = receiver.toEpochDay();
        if (end < start) {
            throw new IllegalArgumentException(endExclusive + " < " + receiver);
        }
        return LongStream.CC.range(start, end).mapToObj(new DesugarLocalDate$$ExternalSyntheticLambda2());
    }

    /* JADX WARN: Code restructure failed: missing block: B:47:0x00f2, code lost:
    
        if (((r30.plusMonths(r2).toEpochDay() + r22) * r15) >= (r15 * r6)) goto L56;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static j$.util.stream.Stream<j$.time.LocalDate> datesUntil(final j$.time.LocalDate r30, j$.time.LocalDate r31, j$.time.Period r32) {
        /*
            Method dump skipped, instructions count: 321
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.time.DesugarLocalDate.datesUntil(j$.time.LocalDate, j$.time.LocalDate, j$.time.Period):j$.util.stream.Stream");
    }

    public static long toEpochSecond(LocalDate receiver, LocalTime time, ZoneOffset offset) {
        Objects.requireNonNull(time, "time");
        Objects.requireNonNull(offset, TypedValues.CycleType.S_WAVE_OFFSET);
        long secs = (receiver.toEpochDay() * TimeUtils.SECONDS_PER_DAY) + time.toSecondOfDay();
        return secs - offset.getTotalSeconds();
    }

    public static LocalDate ofInstant(Instant instant, ZoneId zone) {
        long localEpochDay;
        Objects.requireNonNull(instant, "instant");
        Objects.requireNonNull(zone, "zone");
        ZoneRules rules = zone.getRules();
        ZoneOffset offset = rules.getOffset(instant);
        long localSecond = instant.getEpochSecond() + offset.getTotalSeconds();
        localEpochDay = DesugarLocalDate$$ExternalSyntheticBackport0.m(localSecond, SECONDS_PER_DAY);
        return LocalDate.ofEpochDay(localEpochDay);
    }

    private static long getProlepticMonth(LocalDate receiver) {
        int year = receiver.getYear();
        int month = receiver.getMonthValue();
        return ((year * 12) + month) - 1;
    }
}
