package j$.time.chrono;

import j$.time.Clock$OffsetClock$$ExternalSyntheticBackport0;
import j$.time.Duration$$ExternalSyntheticBackport1;
import j$.time.LocalTime;
import j$.time.chrono.ChronoLocalDate;
import j$.time.format.DateTimeFormatter;
import j$.time.temporal.ChronoField;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAccessor;
import j$.time.temporal.TemporalAdjuster;
import j$.time.temporal.TemporalAmount;
import j$.time.temporal.TemporalField;
import j$.time.temporal.TemporalQuery;
import j$.time.temporal.TemporalUnit;
import j$.time.temporal.UnsupportedTemporalTypeException;
import j$.time.temporal.ValueRange;
import j$.util.Objects;
import java.io.Serializable;

/* loaded from: classes15.dex */
abstract class ChronoLocalDateImpl<D extends ChronoLocalDate> implements ChronoLocalDate, Temporal, TemporalAdjuster, Serializable {
    private static final long serialVersionUID = 6282433883239719096L;

    @Override // j$.time.chrono.ChronoLocalDate, j$.time.temporal.TemporalAdjuster
    public /* synthetic */ Temporal adjustInto(Temporal temporal) {
        Temporal with;
        with = temporal.with(ChronoField.EPOCH_DAY, toEpochDay());
        return with;
    }

    @Override // j$.time.chrono.ChronoLocalDate
    public /* synthetic */ ChronoLocalDateTime atTime(LocalTime localTime) {
        ChronoLocalDateTime of;
        of = ChronoLocalDateTimeImpl.of(this, localTime);
        return of;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // j$.time.chrono.ChronoLocalDate
    public /* synthetic */ int compareTo(ChronoLocalDate chronoLocalDate) {
        return ChronoLocalDate.CC.$default$compareTo((ChronoLocalDate) this, chronoLocalDate);
    }

    @Override // java.lang.Comparable
    public /* bridge */ /* synthetic */ int compareTo(ChronoLocalDate chronoLocalDate) {
        int compareTo;
        compareTo = compareTo((ChronoLocalDate) chronoLocalDate);
        return compareTo;
    }

    @Override // j$.time.chrono.ChronoLocalDate
    public /* synthetic */ String format(DateTimeFormatter dateTimeFormatter) {
        return ChronoLocalDate.CC.$default$format(this, dateTimeFormatter);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public /* synthetic */ int get(TemporalField temporalField) {
        return TemporalAccessor.CC.$default$get(this, temporalField);
    }

    @Override // j$.time.chrono.ChronoLocalDate
    public /* synthetic */ Era getEra() {
        Era eraOf;
        eraOf = getChronology().eraOf(get(ChronoField.ERA));
        return eraOf;
    }

    @Override // j$.time.chrono.ChronoLocalDate
    public /* synthetic */ boolean isAfter(ChronoLocalDate chronoLocalDate) {
        return ChronoLocalDate.CC.$default$isAfter(this, chronoLocalDate);
    }

    @Override // j$.time.chrono.ChronoLocalDate
    public /* synthetic */ boolean isBefore(ChronoLocalDate chronoLocalDate) {
        return ChronoLocalDate.CC.$default$isBefore(this, chronoLocalDate);
    }

    @Override // j$.time.chrono.ChronoLocalDate
    public /* synthetic */ boolean isEqual(ChronoLocalDate chronoLocalDate) {
        return ChronoLocalDate.CC.$default$isEqual(this, chronoLocalDate);
    }

    @Override // j$.time.chrono.ChronoLocalDate
    public /* synthetic */ boolean isLeapYear() {
        boolean isLeapYear;
        isLeapYear = getChronology().isLeapYear(getLong(ChronoField.YEAR));
        return isLeapYear;
    }

    @Override // j$.time.chrono.ChronoLocalDate, j$.time.temporal.TemporalAccessor
    public /* synthetic */ boolean isSupported(TemporalField temporalField) {
        return ChronoLocalDate.CC.$default$isSupported(this, temporalField);
    }

    @Override // j$.time.chrono.ChronoLocalDate, j$.time.temporal.Temporal
    public /* synthetic */ boolean isSupported(TemporalUnit temporalUnit) {
        return ChronoLocalDate.CC.$default$isSupported(this, temporalUnit);
    }

    @Override // j$.time.chrono.ChronoLocalDate
    public /* synthetic */ int lengthOfYear() {
        return ChronoLocalDate.CC.$default$lengthOfYear(this);
    }

    abstract D plusDays(long j);

    abstract D plusMonths(long j);

    abstract D plusYears(long j);

    @Override // j$.time.chrono.ChronoLocalDate, j$.time.temporal.TemporalAccessor
    public /* synthetic */ Object query(TemporalQuery temporalQuery) {
        return ChronoLocalDate.CC.$default$query(this, temporalQuery);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public /* synthetic */ ValueRange range(TemporalField temporalField) {
        return TemporalAccessor.CC.$default$range(this, temporalField);
    }

    @Override // j$.time.chrono.ChronoLocalDate
    public /* synthetic */ long toEpochDay() {
        long j;
        j = getLong(ChronoField.EPOCH_DAY);
        return j;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static <D extends ChronoLocalDate> D ensureValid(Chronology chrono, Temporal temporal) {
        D d = (D) temporal;
        if (!chrono.equals(d.getChronology())) {
            throw new ClassCastException("Chronology mismatch, expected: " + chrono.getId() + ", actual: " + d.getChronology().getId());
        }
        return d;
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    ChronoLocalDateImpl() {
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.temporal.Temporal
    public D with(TemporalAdjuster temporalAdjuster) {
        return (D) ChronoLocalDate.CC.$default$with((ChronoLocalDate) this, temporalAdjuster);
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.temporal.Temporal
    public D with(TemporalField temporalField, long j) {
        return (D) ChronoLocalDate.CC.$default$with((ChronoLocalDate) this, temporalField, j);
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.temporal.Temporal
    public D plus(TemporalAmount temporalAmount) {
        return (D) ChronoLocalDate.CC.$default$plus((ChronoLocalDate) this, temporalAmount);
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.temporal.Temporal
    public D plus(long j, TemporalUnit temporalUnit) {
        long m;
        long m2;
        long m3;
        long m4;
        if (temporalUnit instanceof ChronoUnit) {
            switch ((ChronoUnit) temporalUnit) {
                case DAYS:
                    return plusDays(j);
                case WEEKS:
                    m = Duration$$ExternalSyntheticBackport1.m(j, 7);
                    return plusDays(m);
                case MONTHS:
                    return plusMonths(j);
                case YEARS:
                    return plusYears(j);
                case DECADES:
                    m2 = Duration$$ExternalSyntheticBackport1.m(j, 10);
                    return plusYears(m2);
                case CENTURIES:
                    m3 = Duration$$ExternalSyntheticBackport1.m(j, 100);
                    return plusYears(m3);
                case MILLENNIA:
                    m4 = Duration$$ExternalSyntheticBackport1.m(j, 1000);
                    return plusYears(m4);
                case ERAS:
                    return with((TemporalField) ChronoField.ERA, Clock$OffsetClock$$ExternalSyntheticBackport0.m(getLong(ChronoField.ERA), j));
                default:
                    throw new UnsupportedTemporalTypeException("Unsupported unit: " + temporalUnit);
            }
        }
        return (D) ChronoLocalDate.CC.$default$plus((ChronoLocalDate) this, j, temporalUnit);
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.temporal.Temporal
    public D minus(TemporalAmount temporalAmount) {
        return (D) ChronoLocalDate.CC.$default$minus((ChronoLocalDate) this, temporalAmount);
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.temporal.Temporal
    public D minus(long j, TemporalUnit temporalUnit) {
        ChronoLocalDate ensureValid;
        ensureValid = ensureValid(getChronology(), Temporal.CC.$default$minus(this, j, temporalUnit));
        return (D) ensureValid;
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    D plusWeeks(long weeksToAdd) {
        long m;
        m = Duration$$ExternalSyntheticBackport1.m(weeksToAdd, 7);
        return plusDays(m);
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    D minusYears(long j) {
        return j == Long.MIN_VALUE ? (D) ((ChronoLocalDateImpl) plusYears(Long.MAX_VALUE)).plusYears(1L) : plusYears(-j);
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    D minusMonths(long j) {
        return j == Long.MIN_VALUE ? (D) ((ChronoLocalDateImpl) plusMonths(Long.MAX_VALUE)).plusMonths(1L) : plusMonths(-j);
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    D minusWeeks(long j) {
        return j == Long.MIN_VALUE ? (D) ((ChronoLocalDateImpl) plusWeeks(Long.MAX_VALUE)).plusWeeks(1L) : plusWeeks(-j);
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    D minusDays(long j) {
        return j == Long.MIN_VALUE ? (D) ((ChronoLocalDateImpl) plusDays(Long.MAX_VALUE)).plusDays(1L) : plusDays(-j);
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.chrono.ChronoLocalDate, j$.time.temporal.Temporal
    public long until(Temporal endExclusive, TemporalUnit unit) {
        Objects.requireNonNull(endExclusive, "endExclusive");
        ChronoLocalDate end = getChronology().date(endExclusive);
        if (unit instanceof ChronoUnit) {
            switch ((ChronoUnit) unit) {
                case DAYS:
                    return daysUntil(end);
                case WEEKS:
                    return daysUntil(end) / 7;
                case MONTHS:
                    return monthsUntil(end);
                case YEARS:
                    return monthsUntil(end) / 12;
                case DECADES:
                    return monthsUntil(end) / 120;
                case CENTURIES:
                    return monthsUntil(end) / 1200;
                case MILLENNIA:
                    return monthsUntil(end) / 12000;
                case ERAS:
                    return end.getLong(ChronoField.ERA) - getLong(ChronoField.ERA);
                default:
                    throw new UnsupportedTemporalTypeException("Unsupported unit: " + unit);
            }
        }
        Objects.requireNonNull(unit, "unit");
        return unit.between(this, end);
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    private long daysUntil(ChronoLocalDate end) {
        return end.toEpochDay() - toEpochDay();
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    private long monthsUntil(ChronoLocalDate end) {
        ValueRange range = getChronology().range(ChronoField.MONTH_OF_YEAR);
        if (range.getMaximum() != 12) {
            throw new IllegalStateException("ChronoLocalDateImpl only supports Chronologies with 12 months per year");
        }
        long packed1 = (getLong(ChronoField.PROLEPTIC_MONTH) * 32) + get(ChronoField.DAY_OF_MONTH);
        long packed2 = (end.getLong(ChronoField.PROLEPTIC_MONTH) * 32) + end.get(ChronoField.DAY_OF_MONTH);
        return (packed2 - packed1) / 32;
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.chrono.ChronoLocalDate
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ChronoLocalDate) && compareTo((ChronoLocalDate) obj) == 0;
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.chrono.ChronoLocalDate
    public int hashCode() {
        long epDay = toEpochDay();
        return getChronology().hashCode() ^ ((int) ((epDay >>> 32) ^ epDay));
    }

    /* JADX WARN: Generic types in debug info not equals: j$.time.chrono.ChronoLocalDateImpl != java.time.chrono.ChronoLocalDateImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.chrono.ChronoLocalDate
    public String toString() {
        long yoe = getLong(ChronoField.YEAR_OF_ERA);
        long moy = getLong(ChronoField.MONTH_OF_YEAR);
        long dom = getLong(ChronoField.DAY_OF_MONTH);
        StringBuilder buf = new StringBuilder(30);
        buf.append(getChronology().toString()).append(" ").append(getEra()).append(" ").append(yoe).append(moy < 10 ? "-0" : "-").append(moy).append(dom >= 10 ? "-" : "-0").append(dom);
        return buf.toString();
    }
}
