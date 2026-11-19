package androidx.collection;

import androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatApi24Impl$OutputConfigurationParamsApi24$$ExternalSyntheticBackport0;
import androidx.constraintlayout.widget.ConstraintLayout;
import kotlin.Metadata;
import kotlin.jvm.JvmInline;

/* compiled from: IntIntPair.kt */
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\t\n\u0002\b\u000b\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0087@\u0018\u00002\u00020\u0001B\u0019\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006B\u0011\b\u0000\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\u0005\u0010\tJ\u0010\u0010\u000f\u001a\u00020\u0003H\u0086\n¢\u0006\u0004\b\u0010\u0010\u000bJ\u0010\u0010\u0011\u001a\u00020\u0003H\u0086\n¢\u0006\u0004\b\u0012\u0010\u000bJ\u001a\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0016\u0010\u0017J\u0010\u0010\u0018\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u0019\u0010\u000bJ\u000f\u0010\u001a\u001a\u00020\u001bH\u0016¢\u0006\u0004\b\u001c\u0010\u001dR\u0011\u0010\u0002\u001a\u00020\u00038F¢\u0006\u0006\u001a\u0004\b\n\u0010\u000bR\u0016\u0010\u0007\u001a\u00020\b8\u0000X\u0081\u0004¢\u0006\b\n\u0000\u0012\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u00038F¢\u0006\u0006\u001a\u0004\b\u000e\u0010\u000b\u0088\u0001\u0007\u0092\u0001\u00020\b¨\u0006\u001e"}, d2 = {"Landroidx/collection/IntIntPair;", "", "first", "", "second", "constructor-impl", "(II)J", "packedValue", "", "(J)J", "getFirst-impl", "(J)I", "getPackedValue$annotations", "()V", "getSecond-impl", "component1", "component1-impl", "component2", "component2-impl", "equals", "", "other", "equals-impl", "(JLjava/lang/Object;)Z", "hashCode", "hashCode-impl", "toString", "", "toString-impl", "(J)Ljava/lang/String;", "collection"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
@JvmInline
/* carregado de: classes.dex */
public final class IntIntPair {
    public final long packedValue;

    /* renomeado de: box-impl, motivo: nome Java inválido */
    public static final /* sintético */ IntIntPair m340boximpl(long j) {
        return new IntIntPair(j);
    }

    /* renomeado de: constructor-impl, motivo: nome Java inválido */
    public static long m344constructorimpl(long j) {
        return j;
    }

    /* renomeado de: equals-impl, motivo: nome Java inválido */
    public static boolean m345equalsimpl(long j, Object obj) {
        return (obj instanceof IntIntPair) && j == ((IntIntPair) obj).getPackedValue();
    }

    /* renomeado de: equals-impl0, motivo: nome Java inválido */
    public static final boolean m346equalsimpl0(long j, long j2) {
        return j == j2;
    }

    public static /* sintético */ void getPackedValue$annotations() {
    }

    /* renomeado de: hashCode-impl, motivo: nome Java inválido */
    public static int m349hashCodeimpl(long j) {
        return OutputConfigurationCompatApi24Impl$OutputConfigurationParamsApi24$$ExternalSyntheticBackport0.m(j);
    }

    public boolean equals(Object obj) {
        return m345equalsimpl(this.packedValue, obj);
    }

    public int hashCode() {
        return m349hashCodeimpl(this.packedValue);
    }

    /* renomeado de: unbox-impl, motivo: nome Java inválido e de getter */
    public final /* sintético */ long getPackedValue() {
        return this.packedValue;
    }

    private /* sintético */ IntIntPair(long packedValue) {
        this.packedValue = packedValue;
    }

    /* renomeado de: constructor-impl, motivo: nome Java inválido */
    public static long m343constructorimpl(int first, int second) {
        return m344constructorimpl((first << 32) | (second & 4294967295L));
    }

    /* renomeado de: getFirst-impl, motivo: nome Java inválido */
    public static final int m347getFirstimpl(long arg0) {
        return (int) (arg0 >> 32);
    }

    /* renomeado de: getSecond-impl, motivo: nome Java inválido */
    public static final int m348getSecondimpl(long arg0) {
        return (int) (4294967295L & arg0);
    }

    /* renomeado de: component1-impl, motivo: nome Java inválido */
    public static final int m341component1impl(long arg0) {
        return (int) (arg0 >> 32);
    }

    /* renomeado de: component2-impl, motivo: nome Java inválido */
    public static final int m342component2impl(long arg0) {
        return (int) (4294967295L & arg0);
    }

    /* renomeado de: toString-impl, motivo: nome Java inválido */
    public static String m350toStringimpl(long arg0) {
        return '(' + m347getFirstimpl(arg0) + ", " + m348getSecondimpl(arg0) + ')';
    }

    public String toString() {
        return m350toStringimpl(this.packedValue);
    }
}
