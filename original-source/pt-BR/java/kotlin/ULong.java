package kotlin;

import androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatApi24Impl$OutputConfigurationParamsApi24$$ExternalSyntheticBackport0;
import androidx.constraintlayout.widget.ConstraintLayout;
import kotlin.jvm.JvmInline;
import kotlin.ranges.ULongRange;
import kotlin.ranges.URangesKt;

/* compiled from: ULong.kt */
@Metadata(d1 = {"\u0000j\n\u0002\u0018\u0002\n\u0002\u0010\u000f\n\u0000\n\u0002\u0010\t\n\u0002\b\t\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\u0010\u0000\n\u0002\b\"\n\u0002\u0018\u0002\n\u0002\b\u0014\n\u0002\u0010\u0005\n\u0002\b\u0003\n\u0002\u0010\u0006\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0002\b\u0007\n\u0002\u0010\n\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u000e\b\u0087@\u0018\u0000 ~2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001~B\u0011\b\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0018\u0010\b\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0000H\u0087\f¢\u0006\u0004\b\n\u0010\u000bJ\u0018\u0010\f\u001a\u00020\r2\u0006\u0010\t\u001a\u00020\u000eH\u0087\n¢\u0006\u0004\b\u000f\u0010\u0010J\u0018\u0010\f\u001a\u00020\r2\u0006\u0010\t\u001a\u00020\u0011H\u0087\n¢\u0006\u0004\b\u0012\u0010\u0013J\u0018\u0010\f\u001a\u00020\r2\u0006\u0010\t\u001a\u00020\u0000H\u0097\n¢\u0006\u0004\b\u0014\u0010\u0015J\u0018\u0010\f\u001a\u00020\r2\u0006\u0010\t\u001a\u00020\u0016H\u0087\n¢\u0006\u0004\b\u0017\u0010\u0018J\u0013\u0010\u0019\u001a\u00020\u0000H\u0087\nø\u0001\u0000¢\u0006\u0004\b\u001a\u0010\u0005J\u0018\u0010\u001b\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u000eH\u0087\n¢\u0006\u0004\b\u001c\u0010\u001dJ\u0018\u0010\u001b\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0011H\u0087\n¢\u0006\u0004\b\u001e\u0010\u001fJ\u0018\u0010\u001b\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0000H\u0087\n¢\u0006\u0004\b \u0010\u000bJ\u0018\u0010\u001b\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0016H\u0087\n¢\u0006\u0004\b!\u0010\"J\u001a\u0010#\u001a\u00020$2\b\u0010\t\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b&\u0010'J\u0018\u0010(\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u000eH\u0087\b¢\u0006\u0004\b)\u0010\u001dJ\u0018\u0010(\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0011H\u0087\b¢\u0006\u0004\b*\u0010\u001fJ\u0018\u0010(\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0000H\u0087\b¢\u0006\u0004\b+\u0010\u000bJ\u0018\u0010(\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0016H\u0087\b¢\u0006\u0004\b,\u0010\"J\u0010\u0010-\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b.\u0010/J\u0013\u00100\u001a\u00020\u0000H\u0087\nø\u0001\u0000¢\u0006\u0004\b1\u0010\u0005J\u0013\u00102\u001a\u00020\u0000H\u0087\bø\u0001\u0000¢\u0006\u0004\b3\u0010\u0005J\u0018\u00104\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u000eH\u0087\n¢\u0006\u0004\b5\u0010\u001dJ\u0018\u00104\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0011H\u0087\n¢\u0006\u0004\b6\u0010\u001fJ\u0018\u00104\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0000H\u0087\n¢\u0006\u0004\b7\u0010\u000bJ\u0018\u00104\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0016H\u0087\n¢\u0006\u0004\b8\u0010\"J\u0018\u00109\u001a\u00020\u000e2\u0006\u0010\t\u001a\u00020\u000eH\u0087\b¢\u0006\u0004\b:\u0010;J\u0018\u00109\u001a\u00020\u00112\u0006\u0010\t\u001a\u00020\u0011H\u0087\b¢\u0006\u0004\b<\u0010\u0013J\u0018\u00109\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0000H\u0087\b¢\u0006\u0004\b=\u0010\u000bJ\u0018\u00109\u001a\u00020\u00162\u0006\u0010\t\u001a\u00020\u0016H\u0087\b¢\u0006\u0004\b>\u0010?J\u0018\u0010@\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0000H\u0087\f¢\u0006\u0004\bA\u0010\u000bJ\u0018\u0010B\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u000eH\u0087\n¢\u0006\u0004\bC\u0010\u001dJ\u0018\u0010B\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0011H\u0087\n¢\u0006\u0004\bD\u0010\u001fJ\u0018\u0010B\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0000H\u0087\n¢\u0006\u0004\bE\u0010\u000bJ\u0018\u0010B\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0016H\u0087\n¢\u0006\u0004\bF\u0010\"J\u0018\u0010G\u001a\u00020H2\u0006\u0010\t\u001a\u00020\u0000H\u0087\n¢\u0006\u0004\bI\u0010JJ\u0018\u0010K\u001a\u00020H2\u0006\u0010\t\u001a\u00020\u0000H\u0087\n¢\u0006\u0004\bL\u0010JJ\u0018\u0010M\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u000eH\u0087\n¢\u0006\u0004\bN\u0010\u001dJ\u0018\u0010M\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0011H\u0087\n¢\u0006\u0004\bO\u0010\u001fJ\u0018\u0010M\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0000H\u0087\n¢\u0006\u0004\bP\u0010\u000bJ\u0018\u0010M\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0016H\u0087\n¢\u0006\u0004\bQ\u0010\"J\u001b\u0010R\u001a\u00020\u00002\u0006\u0010S\u001a\u00020\rH\u0087\fø\u0001\u0000¢\u0006\u0004\bT\u0010\u001fJ\u001b\u0010U\u001a\u00020\u00002\u0006\u0010S\u001a\u00020\rH\u0087\fø\u0001\u0000¢\u0006\u0004\bV\u0010\u001fJ\u0018\u0010W\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u000eH\u0087\n¢\u0006\u0004\bX\u0010\u001dJ\u0018\u0010W\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0011H\u0087\n¢\u0006\u0004\bY\u0010\u001fJ\u0018\u0010W\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0000H\u0087\n¢\u0006\u0004\bZ\u0010\u000bJ\u0018\u0010W\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0016H\u0087\n¢\u0006\u0004\b[\u0010\"J\u0010\u0010\\\u001a\u00020]H\u0087\b¢\u0006\u0004\b^\u0010_J\u0010\u0010`\u001a\u00020aH\u0087\b¢\u0006\u0004\bb\u0010cJ\u0010\u0010d\u001a\u00020eH\u0087\b¢\u0006\u0004\bf\u0010gJ\u0010\u0010h\u001a\u00020\rH\u0087\b¢\u0006\u0004\bi\u0010/J\u0010\u0010j\u001a\u00020\u0003H\u0087\b¢\u0006\u0004\bk\u0010\u0005J\u0010\u0010l\u001a\u00020mH\u0087\b¢\u0006\u0004\bn\u0010oJ\u000f\u0010p\u001a\u00020qH\u0016¢\u0006\u0004\br\u0010sJ\u0013\u0010t\u001a\u00020\u000eH\u0087\bø\u0001\u0000¢\u0006\u0004\bu\u0010_J\u0013\u0010v\u001a\u00020\u0011H\u0087\bø\u0001\u0000¢\u0006\u0004\bw\u0010/J\u0013\u0010x\u001a\u00020\u0000H\u0087\bø\u0001\u0000¢\u0006\u0004\by\u0010\u0005J\u0013\u0010z\u001a\u00020\u0016H\u0087\bø\u0001\u0000¢\u0006\u0004\b{\u0010oJ\u0018\u0010|\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0000H\u0087\f¢\u0006\u0004\b}\u0010\u000bR\u0016\u0010\u0002\u001a\u00020\u00038\u0000X\u0081\u0004¢\u0006\b\n\u0000\u0012\u0004\b\u0006\u0010\u0007\u0088\u0001\u0002\u0092\u0001\u00020\u0003\u0082\u0002\u0004\n\u0002\b!¨\u0006\u007f"}, d2 = {"Lkotlin/ULong;", "", "data", "", "constructor-impl", "(J)J", "getData$annotations", "()V", "and", "other", "and-VKZWuLQ", "(JJ)J", "compareTo", "", "Lkotlin/UByte;", "compareTo-7apg3OU", "(JB)I", "Lkotlin/UInt;", "compareTo-WZ4Q5Ns", "(JI)I", "compareTo-VKZWuLQ", "(JJ)I", "Lkotlin/UShort;", "compareTo-xj2QHRw", "(JS)I", "dec", "dec-s-VKNKU", "div", "div-7apg3OU", "(JB)J", "div-WZ4Q5Ns", "(JI)J", "div-VKZWuLQ", "div-xj2QHRw", "(JS)J", "equals", "", "", "equals-impl", "(JLjava/lang/Object;)Z", "floorDiv", "floorDiv-7apg3OU", "floorDiv-WZ4Q5Ns", "floorDiv-VKZWuLQ", "floorDiv-xj2QHRw", "hashCode", "hashCode-impl", "(J)I", "inc", "inc-s-VKNKU", "inv", "inv-s-VKNKU", "minus", "minus-7apg3OU", "minus-WZ4Q5Ns", "minus-VKZWuLQ", "minus-xj2QHRw", "mod", "mod-7apg3OU", "(JB)B", "mod-WZ4Q5Ns", "mod-VKZWuLQ", "mod-xj2QHRw", "(JS)S", "or", "or-VKZWuLQ", "plus", "plus-7apg3OU", "plus-WZ4Q5Ns", "plus-VKZWuLQ", "plus-xj2QHRw", "rangeTo", "Lkotlin/ranges/ULongRange;", "rangeTo-VKZWuLQ", "(JJ)Lkotlin/ranges/ULongRange;", "rangeUntil", "rangeUntil-VKZWuLQ", "rem", "rem-7apg3OU", "rem-WZ4Q5Ns", "rem-VKZWuLQ", "rem-xj2QHRw", "shl", "bitCount", "shl-s-VKNKU", "shr", "shr-s-VKNKU", "times", "times-7apg3OU", "times-WZ4Q5Ns", "times-VKZWuLQ", "times-xj2QHRw", "toByte", "", "toByte-impl", "(J)B", "toDouble", "", "toDouble-impl", "(J)D", "toFloat", "", "toFloat-impl", "(J)F", "toInt", "toInt-impl", "toLong", "toLong-impl", "toShort", "", "toShort-impl", "(J)S", "toString", "", "toString-impl", "(J)Ljava/lang/String;", "toUByte", "toUByte-w2LRezQ", "toUInt", "toUInt-pVg5ArA", "toULong", "toULong-s-VKNKU", "toUShort", "toUShort-Mh2AYeg", "xor", "xor-VKZWuLQ", "Companion", "kotlin-stdlib"}, k = 1, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
@JvmInline
/* carregado de: classes.dex */
public final class ULong implements Comparable<ULong> {
    public static final long MAX_VALUE = -1;
    public static final long MIN_VALUE = 0;
    public static final int SIZE_BITS = 64;
    public static final int SIZE_BYTES = 8;
    private final long data;

    /* renomeado de: box-impl, motivo: nome Java inválido */
    public static final /* sintético */ ULong m1048boximpl(long j) {
        return new ULong(j);
    }

    /* renomeado de: constructor-impl, motivo: nome Java inválido */
    public static long m1054constructorimpl(long j) {
        return j;
    }

    /* renomeado de: equals-impl, motivo: nome Java inválido */
    public static boolean m1060equalsimpl(long j, Object obj) {
        return (obj instanceof ULong) && j == ((ULong) obj).getData();
    }

    /* renomeado de: equals-impl0, motivo: nome Java inválido */
    public static final boolean m1061equalsimpl0(long j, long j2) {
        return j == j2;
    }

    public static /* sintético */ void getData$annotations() {
    }

    /* renomeado de: hashCode-impl, motivo: nome Java inválido */
    public static int m1066hashCodeimpl(long j) {
        return OutputConfigurationCompatApi24Impl$OutputConfigurationParamsApi24$$ExternalSyntheticBackport0.m(j);
    }

    public boolean equals(Object obj) {
        return m1060equalsimpl(this.data, obj);
    }

    public int hashCode() {
        return m1066hashCodeimpl(this.data);
    }

    /* renomeado de: unbox-impl, motivo: nome Java inválido e de getter */
    public final /* sintético */ long getData() {
        return this.data;
    }

    @Override // java.lang.Comparable
    public /* bridge */ /* sintético */ int compareTo(ULong uLong) {
        return UnsignedKt.ulongCompare(getData(), uLong.getData());
    }

    private /* sintético */ ULong(long data) {
        this.data = data;
    }

    /* renomeado de: compareTo-7apg3OU, motivo: nome Java inválido */
    private static final int m1049compareTo7apg3OU(long arg0, byte other) {
        int compare;
        compare = Long.compare(arg0 ^ Long.MIN_VALUE, m1054constructorimpl(other & 255) ^ Long.MIN_VALUE);
        return compare;
    }

    /* renomeado de: compareTo-xj2QHRw, motivo: nome Java inválido */
    private static final int m1053compareToxj2QHRw(long arg0, short other) {
        int compare;
        compare = Long.compare(arg0 ^ Long.MIN_VALUE, m1054constructorimpl(other & 65535) ^ Long.MIN_VALUE);
        return compare;
    }

    /* renomeado de: compareTo-WZ4Q5Ns, motivo: nome Java inválido */
    private static final int m1052compareToWZ4Q5Ns(long arg0, int other) {
        int compare;
        compare = Long.compare(arg0 ^ Long.MIN_VALUE, m1054constructorimpl(other & 4294967295L) ^ Long.MIN_VALUE);
        return compare;
    }

    /* renomeado de: compareTo-VKZWuLQ, motivo: nome Java inválido */
    private int m1050compareToVKZWuLQ(long other) {
        return UnsignedKt.ulongCompare(getData(), other);
    }

    /* renomeado de: compareTo-VKZWuLQ, motivo: nome Java inválido */
    private static int m1051compareToVKZWuLQ(long arg0, long other) {
        return UnsignedKt.ulongCompare(arg0, other);
    }

    /* renomeado de: plus-7apg3OU, motivo: nome Java inválido */
    private static final long m1078plus7apg3OU(long arg0, byte other) {
        return m1054constructorimpl(m1054constructorimpl(other & 255) + arg0);
    }

    /* renomeado de: plus-xj2QHRw, motivo: nome Java inválido */
    private static final long m1081plusxj2QHRw(long arg0, short other) {
        return m1054constructorimpl(m1054constructorimpl(other & 65535) + arg0);
    }

    /* renomeado de: plus-WZ4Q5Ns, motivo: nome Java inválido */
    private static final long m1080plusWZ4Q5Ns(long arg0, int other) {
        return m1054constructorimpl(m1054constructorimpl(other & 4294967295L) + arg0);
    }

    /* renomeado de: plus-VKZWuLQ, motivo: nome Java inválido */
    private static final long m1079plusVKZWuLQ(long arg0, long other) {
        return m1054constructorimpl(arg0 + other);
    }

    /* renomeado de: minus-7apg3OU, motivo: nome Java inválido */
    private static final long m1069minus7apg3OU(long arg0, byte other) {
        return m1054constructorimpl(arg0 - m1054constructorimpl(other & 255));
    }

    /* renomeado de: minus-xj2QHRw, motivo: nome Java inválido */
    private static final long m1072minusxj2QHRw(long arg0, short other) {
        return m1054constructorimpl(arg0 - m1054constructorimpl(other & 65535));
    }

    /* renomeado de: minus-WZ4Q5Ns, motivo: nome Java inválido */
    private static final long m1071minusWZ4Q5Ns(long arg0, int other) {
        return m1054constructorimpl(arg0 - m1054constructorimpl(other & 4294967295L));
    }

    /* renomeado de: minus-VKZWuLQ, motivo: nome Java inválido */
    private static final long m1070minusVKZWuLQ(long arg0, long other) {
        return m1054constructorimpl(arg0 - other);
    }

    /* renomeado de: times-7apg3OU, motivo: nome Java inválido */
    private static final long m1090times7apg3OU(long arg0, byte other) {
        return m1054constructorimpl(m1054constructorimpl(other & 255) * arg0);
    }

    /* renomeado de: times-xj2QHRw, motivo: nome Java inválido */
    private static final long m1093timesxj2QHRw(long arg0, short other) {
        return m1054constructorimpl(m1054constructorimpl(other & 65535) * arg0);
    }

    /* renomeado de: times-WZ4Q5Ns, motivo: nome Java inválido */
    private static final long m1092timesWZ4Q5Ns(long arg0, int other) {
        return m1054constructorimpl(m1054constructorimpl(other & 4294967295L) * arg0);
    }

    /* renomeado de: times-VKZWuLQ, motivo: nome Java inválido */
    private static final long m1091timesVKZWuLQ(long arg0, long other) {
        return m1054constructorimpl(arg0 * other);
    }

    /* renomeado de: div-7apg3OU, motivo: nome Java inválido */
    private static final long m1056div7apg3OU(long arg0, byte other) {
        return UByte$$ExternalSyntheticBackport3.m(arg0, m1054constructorimpl(other & 255));
    }

    /* renomeado de: div-xj2QHRw, motivo: nome Java inválido */
    private static final long m1059divxj2QHRw(long arg0, short other) {
        return UByte$$ExternalSyntheticBackport3.m(arg0, m1054constructorimpl(other & 65535));
    }

    /* renomeado de: div-WZ4Q5Ns, motivo: nome Java inválido */
    private static final long m1058divWZ4Q5Ns(long arg0, int other) {
        return UByte$$ExternalSyntheticBackport3.m(arg0, m1054constructorimpl(other & 4294967295L));
    }

    /* renomeado de: div-VKZWuLQ, motivo: nome Java inválido */
    private static final long m1057divVKZWuLQ(long arg0, long other) {
        return UnsignedKt.m1233ulongDivideeb3DHEI(arg0, other);
    }

    /* renomeado de: rem-7apg3OU, motivo: nome Java inválido */
    private static final long m1084rem7apg3OU(long arg0, byte other) {
        return UByte$$ExternalSyntheticBackport2.m(arg0, m1054constructorimpl(other & 255));
    }

    /* renomeado de: rem-xj2QHRw, motivo: nome Java inválido */
    private static final long m1087remxj2QHRw(long arg0, short other) {
        return UByte$$ExternalSyntheticBackport2.m(arg0, m1054constructorimpl(other & 65535));
    }

    /* renomeado de: rem-WZ4Q5Ns, motivo: nome Java inválido */
    private static final long m1086remWZ4Q5Ns(long arg0, int other) {
        return UByte$$ExternalSyntheticBackport2.m(arg0, m1054constructorimpl(other & 4294967295L));
    }

    /* renomeado de: rem-VKZWuLQ, motivo: nome Java inválido */
    private static final long m1085remVKZWuLQ(long arg0, long other) {
        return UnsignedKt.m1234ulongRemaindereb3DHEI(arg0, other);
    }

    /* renomeado de: floorDiv-7apg3OU, motivo: nome Java inválido */
    private static final long m1062floorDiv7apg3OU(long arg0, byte other) {
        return UByte$$ExternalSyntheticBackport3.m(arg0, m1054constructorimpl(other & 255));
    }

    /* renomeado de: floorDiv-xj2QHRw, motivo: nome Java inválido */
    private static final long m1065floorDivxj2QHRw(long arg0, short other) {
        return UByte$$ExternalSyntheticBackport3.m(arg0, m1054constructorimpl(other & 65535));
    }

    /* renomeado de: floorDiv-WZ4Q5Ns, motivo: nome Java inválido */
    private static final long m1064floorDivWZ4Q5Ns(long arg0, int other) {
        return UByte$$ExternalSyntheticBackport3.m(arg0, m1054constructorimpl(other & 4294967295L));
    }

    /* renomeado de: floorDiv-VKZWuLQ, motivo: nome Java inválido */
    private static final long m1063floorDivVKZWuLQ(long arg0, long other) {
        return UByte$$ExternalSyntheticBackport3.m(arg0, other);
    }

    /* renomeado de: mod-7apg3OU, motivo: nome Java inválido */
    private static final byte m1073mod7apg3OU(long arg0, byte other) {
        return UByte.m898constructorimpl((byte) UByte$$ExternalSyntheticBackport2.m(arg0, m1054constructorimpl(other & 255)));
    }

    /* renomeado de: mod-xj2QHRw, motivo: nome Java inválido */
    private static final short m1076modxj2QHRw(long arg0, short other) {
        return UShort.m1161constructorimpl((short) UByte$$ExternalSyntheticBackport2.m(arg0, m1054constructorimpl(other & 65535)));
    }

    /* renomeado de: mod-WZ4Q5Ns, motivo: nome Java inválido */
    private static final int m1075modWZ4Q5Ns(long arg0, int other) {
        return UInt.m975constructorimpl((int) UByte$$ExternalSyntheticBackport2.m(arg0, m1054constructorimpl(other & 4294967295L)));
    }

    /* renomeado de: mod-VKZWuLQ, motivo: nome Java inválido */
    private static final long m1074modVKZWuLQ(long arg0, long other) {
        return UByte$$ExternalSyntheticBackport2.m(arg0, other);
    }

    /* renomeado de: inc-s-VKNKU, motivo: nome Java inválido */
    private static final long m1067incsVKNKU(long arg0) {
        return m1054constructorimpl(1 + arg0);
    }

    /* renomeado de: dec-s-VKNKU, motivo: nome Java inválido */
    private static final long m1055decsVKNKU(long arg0) {
        return m1054constructorimpl((-1) + arg0);
    }

    /* renomeado de: rangeTo-VKZWuLQ, motivo: nome Java inválido */
    private static final ULongRange m1082rangeToVKZWuLQ(long arg0, long other) {
        return new ULongRange(arg0, other, null);
    }

    /* renomeado de: rangeUntil-VKZWuLQ, motivo: nome Java inválido */
    private static final ULongRange m1083rangeUntilVKZWuLQ(long arg0, long other) {
        return URangesKt.m2150untileb3DHEI(arg0, other);
    }

    /* renomeado de: shl-s-VKNKU, motivo: nome Java inválido */
    private static final long m1088shlsVKNKU(long arg0, int bitCount) {
        return m1054constructorimpl(arg0 << bitCount);
    }

    /* renomeado de: shr-s-VKNKU, motivo: nome Java inválido */
    private static final long m1089shrsVKNKU(long arg0, int bitCount) {
        return m1054constructorimpl(arg0 >>> bitCount);
    }

    /* renomeado de: and-VKZWuLQ, motivo: nome Java inválido */
    private static final long m1047andVKZWuLQ(long arg0, long other) {
        return m1054constructorimpl(arg0 & other);
    }

    /* renomeado de: or-VKZWuLQ, motivo: nome Java inválido */
    private static final long m1077orVKZWuLQ(long arg0, long other) {
        return m1054constructorimpl(arg0 | other);
    }

    /* renomeado de: xor-VKZWuLQ, motivo: nome Java inválido */
    private static final long m1105xorVKZWuLQ(long arg0, long other) {
        return m1054constructorimpl(arg0 ^ other);
    }

    /* renomeado de: inv-s-VKNKU, motivo: nome Java inválido */
    private static final long m1068invsVKNKU(long arg0) {
        return m1054constructorimpl(~arg0);
    }

    /* renomeado de: toByte-impl, motivo: nome Java inválido */
    private static final byte m1094toByteimpl(long arg0) {
        return (byte) arg0;
    }

    /* renomeado de: toShort-impl, motivo: nome Java inválido */
    private static final short m1099toShortimpl(long arg0) {
        return (short) arg0;
    }

    /* renomeado de: toInt-impl, motivo: nome Java inválido */
    private static final int m1097toIntimpl(long arg0) {
        return (int) arg0;
    }

    /* renomeado de: toLong-impl, motivo: nome Java inválido */
    private static final long m1098toLongimpl(long arg0) {
        return arg0;
    }

    /* renomeado de: toUByte-w2LRezQ, motivo: nome Java inválido */
    private static final byte m1101toUBytew2LRezQ(long arg0) {
        return UByte.m898constructorimpl((byte) arg0);
    }

    /* renomeado de: toUShort-Mh2AYeg, motivo: nome Java inválido */
    private static final short m1104toUShortMh2AYeg(long arg0) {
        return UShort.m1161constructorimpl((short) arg0);
    }

    /* renomeado de: toUInt-pVg5ArA, motivo: nome Java inválido */
    private static final int m1102toUIntpVg5ArA(long arg0) {
        return UInt.m975constructorimpl((int) arg0);
    }

    /* renomeado de: toULong-s-VKNKU, motivo: nome Java inválido */
    private static final long m1103toULongsVKNKU(long arg0) {
        return arg0;
    }

    /* renomeado de: toFloat-impl, motivo: nome Java inválido */
    private static final float m1096toFloatimpl(long arg0) {
        return (float) UnsignedKt.ulongToDouble(arg0);
    }

    /* renomeado de: toDouble-impl, motivo: nome Java inválido */
    private static final double m1095toDoubleimpl(long arg0) {
        return UnsignedKt.ulongToDouble(arg0);
    }

    /* renomeado de: toString-impl, motivo: nome Java inválido */
    public static String m1100toStringimpl(long arg0) {
        return UnsignedKt.ulongToString(arg0, 10);
    }

    public String toString() {
        return m1100toStringimpl(this.data);
    }
}
