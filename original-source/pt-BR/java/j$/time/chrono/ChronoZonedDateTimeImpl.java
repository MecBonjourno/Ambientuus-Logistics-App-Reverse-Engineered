package j$.time.chrono;

import androidx.constraintlayout.core.motion.utils.TypedValues;
import j$.time.Instant;
import j$.time.LocalDateTime;
import j$.time.LocalTime;
import j$.time.ZoneId;
import j$.time.ZoneOffset;
import j$.time.chrono.ChronoLocalDate;
import j$.time.chrono.ChronoZonedDateTime;
import j$.time.format.DateTimeFormatter;
import j$.time.temporal.ChronoField;
import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAdjuster;
import j$.time.temporal.TemporalAmount;
import j$.time.temporal.TemporalField;
import j$.time.temporal.TemporalQuery;
import j$.time.temporal.TemporalUnit;
import j$.time.temporal.ValueRange;
import j$.time.zone.ZoneOffsetTransition;
import j$.time.zone.ZoneRules;
import j$.util.Objects;
import java.io.InvalidObjectException;
import java.io.ObjectInput;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.Serializable;
import java.util.List;

/* carregado de: classes15.dex */
final class ChronoZonedDateTimeImpl<D extends ChronoLocalDate> implements ChronoZonedDateTime<D>, Serializable {
    private static final long serialVersionUID = -5261813987200935591L;
    private final transient ChronoLocalDateTimeImpl<D> dateTime;
    private final transient ZoneOffset offset;
    private final transient ZoneId zone;

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // j$.time.chrono.ChronoZonedDateTime
    public /* sintético */ int compareTo(ChronoZonedDateTime chronoZonedDateTime) {
        return ChronoZonedDateTime.CC.$default$compareTo((ChronoZonedDateTime) this, chronoZonedDateTime);
    }

    @Override // java.lang.Comparable
    public /* bridge */ /* sintético */ int compareTo(ChronoZonedDateTime<?> chronoZonedDateTime) {
        int compareTo;
        compareTo = compareTo((ChronoZonedDateTime<?>) chronoZonedDateTime);
        return compareTo;
    }

    @Override // j$.time.chrono.ChronoZonedDateTime
    public /* sintético */ String format(DateTimeFormatter dateTimeFormatter) {
        return ChronoZonedDateTime.CC.$default$format(this, dateTimeFormatter);
    }

    @Override // j$.time.chrono.ChronoZonedDateTime, j$.time.temporal.TemporalAccessor
    public /* sintético */ int get(TemporalField temporalField) {
        return ChronoZonedDateTime.CC.$default$get(this, temporalField);
    }

    @Override // j$.time.chrono.ChronoZonedDateTime
    public /* sintético */ Chronology getChronology() {
        Chronology chronology;
        chronology = toLocalDate().getChronology();
        return chronology;
    }

    @Override // j$.time.chrono.ChronoZonedDateTime, j$.time.temporal.TemporalAccessor
    public /* sintético */ long getLong(TemporalField temporalField) {
        return ChronoZonedDateTime.CC.$default$getLong(this, temporalField);
    }

    @Override // j$.time.chrono.ChronoZonedDateTime
    public /* sintético */ boolean isAfter(ChronoZonedDateTime chronoZonedDateTime) {
        return ChronoZonedDateTime.CC.$default$isAfter(this, chronoZonedDateTime);
    }

    @Override // j$.time.chrono.ChronoZonedDateTime
    public /* sintético */ boolean isBefore(ChronoZonedDateTime chronoZonedDateTime) {
        return ChronoZonedDateTime.CC.$default$isBefore(this, chronoZonedDateTime);
    }

    @Override // j$.time.chrono.ChronoZonedDateTime
    public /* sintético */ boolean isEqual(ChronoZonedDateTime chronoZonedDateTime) {
        return ChronoZonedDateTime.CC.$default$isEqual(this, chronoZonedDateTime);
    }

    @Override // j$.time.chrono.ChronoZonedDateTime, j$.time.temporal.Temporal
    public /* sintético */ boolean isSupported(TemporalUnit temporalUnit) {
        return ChronoZonedDateTime.CC.$default$isSupported(this, temporalUnit);
    }

    @Override // j$.time.chrono.ChronoZonedDateTime, j$.time.temporal.Temporal
    public /* sintético */ ChronoZonedDateTime minus(long j, TemporalUnit temporalUnit) {
        ChronoZonedDateTime ensureValid;
        ensureValid = ensureValid(getChronology(), Temporal.CC.$default$minus(this, j, temporalUnit));
        return ensureValid;
    }

    @Override // j$.time.chrono.ChronoZonedDateTime, j$.time.temporal.Temporal
    public /* sintético */ ChronoZonedDateTime minus(TemporalAmount temporalAmount) {
        return ChronoZonedDateTime.CC.$default$minus((ChronoZonedDateTime) this, temporalAmount);
    }

    @Override // j$.time.temporal.Temporal
    public /* bridge */ /* sintético */ Temporal minus(long j, TemporalUnit temporalUnit) {
        Temporal minus;
        minus = minus(j, temporalUnit);
        return minus;
    }

    @Override // j$.time.temporal.Temporal
    public /* bridge */ /* sintético */ Temporal minus(TemporalAmount temporalAmount) {
        Temporal minus;
        minus = minus(temporalAmount);
        return minus;
    }

    @Override // j$.time.chrono.ChronoZonedDateTime, j$.time.temporal.Temporal
    public /* sintético */ ChronoZonedDateTime plus(TemporalAmount temporalAmount) {
        return ChronoZonedDateTime.CC.$default$plus((ChronoZonedDateTime) this, temporalAmount);
    }

    @Override // j$.time.temporal.Temporal
    public /* bridge */ /* sintético */ Temporal plus(TemporalAmount temporalAmount) {
        Temporal plus;
        plus = plus(temporalAmount);
        return plus;
    }

    @Override // j$.time.chrono.ChronoZonedDateTime, j$.time.temporal.TemporalAccessor
    public /* sintético */ Object query(TemporalQuery temporalQuery) {
        return ChronoZonedDateTime.CC.$default$query(this, temporalQuery);
    }

    @Override // j$.time.chrono.ChronoZonedDateTime, j$.time.temporal.TemporalAccessor
    public /* sintético */ ValueRange range(TemporalField temporalField) {
        return ChronoZonedDateTime.CC.$default$range(this, temporalField);
    }

    @Override // j$.time.chrono.ChronoZonedDateTime
    public /* sintético */ long toEpochSecond() {
        return ChronoZonedDateTime.CC.$default$toEpochSecond(this);
    }

    @Override // j$.time.chrono.ChronoZonedDateTime
    public /* sintético */ Instant toInstant() {
        Instant ofEpochSecond;
        ofEpochSecond = Instant.ofEpochSecond(toEpochSecond(), toLocalTime().getNano());
        return ofEpochSecond;
    }

    @Override // j$.time.chrono.ChronoZonedDateTime
    public /* sintético */ ChronoLocalDate toLocalDate() {
        ChronoLocalDate localDate;
        localDate = toLocalDateTime2().toLocalDate();
        return localDate;
    }

    @Override // j$.time.chrono.ChronoZonedDateTime
    public /* sintético */ LocalTime toLocalTime() {
        LocalTime localTime;
        localTime = toLocalDateTime2().toLocalTime();
        return localTime;
    }

    @Override // j$.time.chrono.ChronoZonedDateTime, j$.time.temporal.Temporal
    public /* sintético */ ChronoZonedDateTime with(TemporalAdjuster temporalAdjuster) {
        return ChronoZonedDateTime.CC.$default$with((ChronoZonedDateTime) this, temporalAdjuster);
    }

    @Override // j$.time.temporal.Temporal
    public /* bridge */ /* sintético */ Temporal with(TemporalAdjuster temporalAdjuster) {
        Temporal with;
        with = with(temporalAdjuster);
        return with;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoLocalDateTimeImpl != java.time.chrono.ChronoLocalDateTimeImpl<R extends j$.time.chrono.ChronoLocalDate> */
    static <R extends ChronoLocalDate> ChronoZonedDateTime<R> ofBest(ChronoLocalDateTimeImpl<R> chronoLocalDateTimeImpl, ZoneId zone, ZoneOffset preferredOffset) {
        ZoneOffset offset;
        Objects.requireNonNull(chronoLocalDateTimeImpl, "localDateTime");
        Objects.requireNonNull(zone, "zone");
        if (zone instanceof ZoneOffset) {
            return new ChronoZonedDateTimeImpl(chronoLocalDateTimeImpl, (ZoneOffset) zone, zone);
        }
        ZoneRules rules = zone.getRules();
        LocalDateTime isoLDT = LocalDateTime.from(chronoLocalDateTimeImpl);
        List<ZoneOffset> validOffsets = rules.getValidOffsets(isoLDT);
        if (validOffsets.size() == 1) {
            offset = validOffsets.get(0);
        } else if (validOffsets.size() == 0) {
            ZoneOffsetTransition trans = rules.getTransition(isoLDT);
            chronoLocalDateTimeImpl = chronoLocalDateTimeImpl.plusSeconds(trans.getDuration().getSeconds());
            offset = trans.getOffsetAfter();
        } else if (preferredOffset != null && validOffsets.contains(preferredOffset)) {
            offset = preferredOffset;
        } else {
            ZoneOffset offset2 = validOffsets.get(0);
            offset = offset2;
        }
        Objects.requireNonNull(offset, TypedValues.CycleType.S_WAVE_OFFSET);
        return new ChronoZonedDateTimeImpl(chronoLocalDateTimeImpl, offset, zone);
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoLocalDateTimeImpl != java.time.chrono.ChronoLocalDateTimeImpl<?> */
    public static ChronoZonedDateTimeImpl<?> ofInstant(Chronology chrono, Instant instant, ZoneId zone) {
        ZoneRules rules = zone.getRules();
        ZoneOffset offset = rules.getOffset(instant);
        Objects.requireNonNull(offset, TypedValues.CycleType.S_WAVE_OFFSET);
        LocalDateTime ldt = LocalDateTime.ofEpochSecond(instant.getEpochSecond(), instant.getNano(), offset);
        return new ChronoZonedDateTimeImpl<>((ChronoLocalDateTimeImpl) chrono.localDateTime(ldt), offset, zone);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    private ChronoZonedDateTimeImpl<D> create(Instant instant, ZoneId zoneId) {
        return (ChronoZonedDateTimeImpl<D>) ofInstant(getChronology(), instant, zoneId);
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<R extends j$.time.chrono.ChronoLocalDate> */
    public static <R extends ChronoLocalDate> ChronoZonedDateTimeImpl<R> ensureValid(Chronology chrono, Temporal temporal) {
        ChronoZonedDateTimeImpl<R> chronoZonedDateTimeImpl = (ChronoZonedDateTimeImpl) temporal;
        if (!chrono.equals(chronoZonedDateTimeImpl.getChronology())) {
            throw new ClassCastException("Chronology mismatch, required: " + chrono.getId() + ", actual: " + chronoZonedDateTimeImpl.getChronology().getId());
        }
        return chronoZonedDateTimeImpl;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoLocalDateTimeImpl != java.time.chrono.ChronoLocalDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    private ChronoZonedDateTimeImpl(ChronoLocalDateTimeImpl<D> chronoLocalDateTimeImpl, ZoneOffset offset, ZoneId zone) {
        this.dateTime = (ChronoLocalDateTimeImpl) Objects.requireNonNull(chronoLocalDateTimeImpl, "dateTime");
        this.offset = (ZoneOffset) Objects.requireNonNull(offset, TypedValues.CycleType.S_WAVE_OFFSET);
        this.zone = (ZoneId) Objects.requireNonNull(zone, "zone");
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.chrono.ChronoZonedDateTime
    public ZoneOffset getOffset() {
        return this.offset;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.chrono.ChronoZonedDateTime
    /* renomeado de: withEarlierOffsetAtOverlap */
    public ChronoZonedDateTime<D> withEarlierOffsetAtOverlap2() {
        ZoneOffsetTransition trans = getZone().getRules().getTransition(LocalDateTime.from(this));
        if (trans != null && trans.isOverlap()) {
            ZoneOffset earlierOffset = trans.getOffsetBefore();
            if (!earlierOffset.equals(this.offset)) {
                return new ChronoZonedDateTimeImpl(this.dateTime, earlierOffset, this.zone);
            }
        }
        return this;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.chrono.ChronoZonedDateTime
    /* renomeado de: withLaterOffsetAtOverlap */
    public ChronoZonedDateTime<D> withLaterOffsetAtOverlap2() {
        ZoneOffsetTransition trans = getZone().getRules().getTransition(LocalDateTime.from(this));
        if (trans != null) {
            ZoneOffset offset = trans.getOffsetAfter();
            if (!offset.equals(getOffset())) {
                return new ChronoZonedDateTimeImpl(this.dateTime, offset, this.zone);
            }
        }
        return this;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.chrono.ChronoZonedDateTime
    /* renomeado de: toLocalDateTime */
    public ChronoLocalDateTime<D> toLocalDateTime2() {
        return this.dateTime;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.chrono.ChronoZonedDateTime
    public ZoneId getZone() {
        return this.zone;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.chrono.ChronoZonedDateTime
    /* renomeado de: withZoneSameLocal */
    public ChronoZonedDateTime<D> withZoneSameLocal2(ZoneId zone) {
        return ofBest(this.dateTime, zone, this.offset);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.chrono.ChronoZonedDateTime
    /* renomeado de: withZoneSameInstant */
    public ChronoZonedDateTime<D> withZoneSameInstant2(ZoneId zone) {
        Objects.requireNonNull(zone, "zone");
        return this.zone.equals(zone) ? this : create(this.dateTime.toInstant(this.offset), zone);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.chrono.ChronoZonedDateTime, j$.time.temporal.TemporalAccessor
    public boolean isSupported(TemporalField field) {
        return (field instanceof ChronoField) || (field != null && field.isSupportedBy(this));
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.temporal.Temporal
    public ChronoZonedDateTime<D> with(TemporalField field, long newValue) {
        if (field instanceof ChronoField) {
            ChronoField f = (ChronoField) field;
            switch (f) {
                case INSTANT_SECONDS:
                    return plus(newValue - toEpochSecond(), (TemporalUnit) ChronoUnit.SECONDS);
                case OFFSET_SECONDS:
                    ZoneOffset offset = ZoneOffset.ofTotalSeconds(f.checkValidIntValue(newValue));
                    return create(this.dateTime.toInstant(offset), this.zone);
                default:
                    return ofBest(this.dateTime.with(field, newValue), this.zone, this.offset);
            }
        }
        return ensureValid(getChronology(), field.adjustInto(this, newValue));
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.temporal.Temporal
    public ChronoZonedDateTime<D> plus(long amountToAdd, TemporalUnit unit) {
        if (unit instanceof ChronoUnit) {
            return with((TemporalAdjuster) this.dateTime.plus(amountToAdd, unit));
        }
        return ensureValid(getChronology(), unit.addTo(this, amountToAdd));
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTime != java.time.chrono.ChronoZonedDateTime<D extends j$.time.chrono.ChronoLocalDate> */
    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.temporal.Temporal
    public long until(Temporal endExclusive, TemporalUnit unit) {
        Objects.requireNonNull(endExclusive, "endExclusive");
        ChronoZonedDateTime<? extends ChronoLocalDate> zonedDateTime = getChronology().zonedDateTime(endExclusive);
        if (unit instanceof ChronoUnit) {
            return this.dateTime.until(zonedDateTime.withZoneSameInstant2(this.offset).toLocalDateTime2(), unit);
        }
        Objects.requireNonNull(unit, "unit");
        return unit.between(this, zonedDateTime);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    private Object writeReplace() {
        return new Ser((byte) 3, this);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    private void readObject(ObjectInputStream s) {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    void writeExternal(ObjectOutput out) {
        out.writeObject(this.dateTime);
        out.writeObject(this.offset);
        out.writeObject(this.zone);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoLocalDateTime != java.time.chrono.ChronoLocalDateTime<?> */
    static ChronoZonedDateTime<?> readExternal(ObjectInput objectInput) {
        ChronoLocalDateTime chronoLocalDateTime = (ChronoLocalDateTime) objectInput.readObject();
        ZoneOffset zoneOffset = (ZoneOffset) objectInput.readObject();
        return chronoLocalDateTime.atZone2(zoneOffset).withZoneSameLocal2((ZoneId) objectInput.readObject());
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.chrono.ChronoZonedDateTime
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ChronoZonedDateTime) && compareTo((ChronoZonedDateTime) obj) == 0;
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.chrono.ChronoZonedDateTime
    public int hashCode() {
        return (toLocalDateTime2().hashCode() ^ getOffset().hashCode()) ^ Integer.rotateLeft(getZone().hashCode(), 3);
    }

    /* JADX WARN: tipos genéricos nas informações de depuração não são iguais: j$.time.chrono.ChronoZonedDateTimeImpl != java.time.chrono.ChronoZonedDateTimeImpl<D extends j$.time.chrono.ChronoLocalDate> */
    @Override // j$.time.chrono.ChronoZonedDateTime
    public String toString() {
        String str = toLocalDateTime2().toString() + getOffset().toString();
        if (getOffset() != getZone()) {
            return str + "[" + getZone().toString() + "]";
        }
        return str;
    }
}
