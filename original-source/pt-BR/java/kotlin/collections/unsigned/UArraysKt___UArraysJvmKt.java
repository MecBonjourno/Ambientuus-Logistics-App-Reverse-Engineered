package kotlin.collections.unsigned;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Comparator;
import java.util.List;
import kotlin.Deprecated;
import kotlin.DeprecatedSinceKotlin;
import kotlin.Metadata;
import kotlin.ReplaceWith;
import kotlin.UByte;
import kotlin.UByteArray;
import kotlin.UInt;
import kotlin.UIntArray;
import kotlin.ULong;
import kotlin.ULongArray;
import kotlin.UShort;
import kotlin.UShortArray;
import kotlin.UnsignedKt;
import kotlin.collections.AbstractList;
import kotlin.collections.ArraysKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: _UArraysJvm.kt */
@Metadata(d1 = {"\u0000h\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b \n\u0002\u0010\u000f\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0018\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\u001a\u0019\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\u0007¢\u0006\u0004\b\u0004\u0010\u0005\u001a\u0019\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00060\u0001*\u00020\u0007H\u0007¢\u0006\u0004\b\b\u0010\t\u001a\u0019\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\n0\u0001*\u00020\u000bH\u0007¢\u0006\u0004\b\f\u0010\r\u001a\u0019\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0001*\u00020\u000fH\u0007¢\u0006\u0004\b\u0010\u0010\u0011\u001a/\u0010\u0012\u001a\u00020\u0013*\u00020\u00032\u0006\u0010\u0014\u001a\u00020\u00022\b\b\u0002\u0010\u0015\u001a\u00020\u00132\b\b\u0002\u0010\u0016\u001a\u00020\u0013H\u0007¢\u0006\u0004\b\u0017\u0010\u0018\u001a/\u0010\u0012\u001a\u00020\u0013*\u00020\u00072\u0006\u0010\u0014\u001a\u00020\u00062\b\b\u0002\u0010\u0015\u001a\u00020\u00132\b\b\u0002\u0010\u0016\u001a\u00020\u0013H\u0007¢\u0006\u0004\b\u0019\u0010\u001a\u001a/\u0010\u0012\u001a\u00020\u0013*\u00020\u000b2\u0006\u0010\u0014\u001a\u00020\n2\b\b\u0002\u0010\u0015\u001a\u00020\u00132\b\b\u0002\u0010\u0016\u001a\u00020\u0013H\u0007¢\u0006\u0004\b\u001b\u0010\u001c\u001a/\u0010\u0012\u001a\u00020\u0013*\u00020\u000f2\u0006\u0010\u0014\u001a\u00020\u000e2\b\b\u0002\u0010\u0015\u001a\u00020\u00132\b\b\u0002\u0010\u0016\u001a\u00020\u0013H\u0007¢\u0006\u0004\b\u001d\u0010\u001e\u001a\u001c\u0010\u001f\u001a\u00020\u0002*\u00020\u00032\u0006\u0010 \u001a\u00020\u0013H\u0087\b¢\u0006\u0004\b!\u0010\"\u001a\u001c\u0010\u001f\u001a\u00020\u0006*\u00020\u00072\u0006\u0010 \u001a\u00020\u0013H\u0087\b¢\u0006\u0004\b#\u0010$\u001a\u001c\u0010\u001f\u001a\u00020\n*\u00020\u000b2\u0006\u0010 \u001a\u00020\u0013H\u0087\b¢\u0006\u0004\b%\u0010&\u001a\u001c\u0010\u001f\u001a\u00020\u000e*\u00020\u000f2\u0006\u0010 \u001a\u00020\u0013H\u0087\b¢\u0006\u0004\b'\u0010(\u001a\u0015\u0010)\u001a\u0004\u0018\u00010\u0002*\u00020\u0003H\u0007¢\u0006\u0004\b*\u0010+\u001a\u0015\u0010)\u001a\u0004\u0018\u00010\u0006*\u00020\u0007H\u0007¢\u0006\u0004\b,\u0010-\u001a\u0015\u0010)\u001a\u0004\u0018\u00010\n*\u00020\u000bH\u0007¢\u0006\u0004\b.\u0010/\u001a\u0015\u0010)\u001a\u0004\u0018\u00010\u000e*\u00020\u000fH\u0007¢\u0006\u0004\b0\u00101\u001a=\u00102\u001a\u0004\u0018\u00010\u0002\"\u000e\b\u0000\u00103*\b\u0012\u0004\u0012\u0002H304*\u00020\u00032\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u0002H306H\u0087\bø\u0001\u0000¢\u0006\u0004\b7\u00108\u001a=\u00102\u001a\u0004\u0018\u00010\u0006\"\u000e\b\u0000\u00103*\b\u0012\u0004\u0012\u0002H304*\u00020\u00072\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u0002H306H\u0087\bø\u0001\u0000¢\u0006\u0004\b9\u0010:\u001a=\u00102\u001a\u0004\u0018\u00010\n\"\u000e\b\u0000\u00103*\b\u0012\u0004\u0012\u0002H304*\u00020\u000b2\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u0002H306H\u0087\bø\u0001\u0000¢\u0006\u0004\b;\u0010<\u001a=\u00102\u001a\u0004\u0018\u00010\u000e\"\u000e\b\u0000\u00103*\b\u0012\u0004\u0012\u0002H304*\u00020\u000f2\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u0002H306H\u0087\bø\u0001\u0000¢\u0006\u0004\b=\u0010>\u001a1\u0010?\u001a\u0004\u0018\u00010\u0002*\u00020\u00032\u001a\u0010@\u001a\u0016\u0012\u0006\b\u0000\u0012\u00020\u00020Aj\n\u0012\u0006\b\u0000\u0012\u00020\u0002`BH\u0007¢\u0006\u0004\bC\u0010D\u001a1\u0010?\u001a\u0004\u0018\u00010\u0006*\u00020\u00072\u001a\u0010@\u001a\u0016\u0012\u0006\b\u0000\u0012\u00020\u00060Aj\n\u0012\u0006\b\u0000\u0012\u00020\u0006`BH\u0007¢\u0006\u0004\bE\u0010F\u001a1\u0010?\u001a\u0004\u0018\u00010\n*\u00020\u000b2\u001a\u0010@\u001a\u0016\u0012\u0006\b\u0000\u0012\u00020\n0Aj\n\u0012\u0006\b\u0000\u0012\u00020\n`BH\u0007¢\u0006\u0004\bG\u0010H\u001a1\u0010?\u001a\u0004\u0018\u00010\u000e*\u00020\u000f2\u001a\u0010@\u001a\u0016\u0012\u0006\b\u0000\u0012\u00020\u000e0Aj\n\u0012\u0006\b\u0000\u0012\u00020\u000e`BH\u0007¢\u0006\u0004\bI\u0010J\u001a\u0015\u0010K\u001a\u0004\u0018\u00010\u0002*\u00020\u0003H\u0007¢\u0006\u0004\bL\u0010+\u001a\u0015\u0010K\u001a\u0004\u0018\u00010\u0006*\u00020\u0007H\u0007¢\u0006\u0004\bM\u0010-\u001a\u0015\u0010K\u001a\u0004\u0018\u00010\n*\u00020\u000bH\u0007¢\u0006\u0004\bN\u0010/\u001a\u0015\u0010K\u001a\u0004\u0018\u00010\u000e*\u00020\u000fH\u0007¢\u0006\u0004\bO\u00101\u001a=\u0010P\u001a\u0004\u0018\u00010\u0002\"\u000e\b\u0000\u00103*\b\u0012\u0004\u0012\u0002H304*\u00020\u00032\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u0002H306H\u0087\bø\u0001\u0000¢\u0006\u0004\bQ\u00108\u001a=\u0010P\u001a\u0004\u0018\u00010\u0006\"\u000e\b\u0000\u00103*\b\u0012\u0004\u0012\u0002H304*\u00020\u00072\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u0002H306H\u0087\bø\u0001\u0000¢\u0006\u0004\bR\u0010:\u001a=\u0010P\u001a\u0004\u0018\u00010\n\"\u000e\b\u0000\u00103*\b\u0012\u0004\u0012\u0002H304*\u00020\u000b2\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u0002H306H\u0087\bø\u0001\u0000¢\u0006\u0004\bS\u0010<\u001a=\u0010P\u001a\u0004\u0018\u00010\u000e\"\u000e\b\u0000\u00103*\b\u0012\u0004\u0012\u0002H304*\u00020\u000f2\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u0002H306H\u0087\bø\u0001\u0000¢\u0006\u0004\bT\u0010>\u001a1\u0010U\u001a\u0004\u0018\u00010\u0002*\u00020\u00032\u001a\u0010@\u001a\u0016\u0012\u0006\b\u0000\u0012\u00020\u00020Aj\n\u0012\u0006\b\u0000\u0012\u00020\u0002`BH\u0007¢\u0006\u0004\bV\u0010D\u001a1\u0010U\u001a\u0004\u0018\u00010\u0006*\u00020\u00072\u001a\u0010@\u001a\u0016\u0012\u0006\b\u0000\u0012\u00020\u00060Aj\n\u0012\u0006\b\u0000\u0012\u00020\u0006`BH\u0007¢\u0006\u0004\bW\u0010F\u001a1\u0010U\u001a\u0004\u0018\u00010\n*\u00020\u000b2\u001a\u0010@\u001a\u0016\u0012\u0006\b\u0000\u0012\u00020\n0Aj\n\u0012\u0006\b\u0000\u0012\u00020\n`BH\u0007¢\u0006\u0004\bX\u0010H\u001a1\u0010U\u001a\u0004\u0018\u00010\u000e*\u00020\u000f2\u001a\u0010@\u001a\u0016\u0012\u0006\b\u0000\u0012\u00020\u000e0Aj\n\u0012\u0006\b\u0000\u0012\u00020\u000e`BH\u0007¢\u0006\u0004\bY\u0010J\u001a+\u0010Z\u001a\u00020[*\u00020\u00032\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020[06H\u0087\bø\u0001\u0000¢\u0006\u0004\b\\\u0010]\u001a+\u0010Z\u001a\u00020^*\u00020\u00032\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020^06H\u0087\bø\u0001\u0000¢\u0006\u0004\b_\u0010`\u001a+\u0010Z\u001a\u00020[*\u00020\u00072\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020[06H\u0087\bø\u0001\u0000¢\u0006\u0004\b\\\u0010a\u001a+\u0010Z\u001a\u00020^*\u00020\u00072\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020^06H\u0087\bø\u0001\u0000¢\u0006\u0004\b_\u0010b\u001a+\u0010Z\u001a\u00020[*\u00020\u000b2\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020[06H\u0087\bø\u0001\u0000¢\u0006\u0004\b\\\u0010c\u001a+\u0010Z\u001a\u00020^*\u00020\u000b2\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020^06H\u0087\bø\u0001\u0000¢\u0006\u0004\b_\u0010d\u001a+\u0010Z\u001a\u00020[*\u00020\u000f2\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020[06H\u0087\bø\u0001\u0000¢\u0006\u0004\b\\\u0010e\u001a+\u0010Z\u001a\u00020^*\u00020\u000f2\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020^06H\u0087\bø\u0001\u0000¢\u0006\u0004\b_\u0010f\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006g"}, d2 = {"asList", "", "Lkotlin/UByte;", "Lkotlin/UByteArray;", "asList-GBYM_sE", "([B)Ljava/util/List;", "Lkotlin/UInt;", "Lkotlin/UIntArray;", "asList--ajY-9A", "([I)Ljava/util/List;", "Lkotlin/ULong;", "Lkotlin/ULongArray;", "asList-QwZRm1k", "([J)Ljava/util/List;", "Lkotlin/UShort;", "Lkotlin/UShortArray;", "asList-rL5Bavg", "([S)Ljava/util/List;", "binarySearch", "", "element", "fromIndex", "toIndex", "binarySearch-WpHrYlw", "([BBII)I", "binarySearch-2fe2U9s", "([IIII)I", "binarySearch-K6DWlUc", "([JJII)I", "binarySearch-EtDCXyQ", "([SSII)I", "elementAt", "index", "elementAt-PpDY95g", "([BI)B", "elementAt-qFRl0hI", "([II)I", "elementAt-r7IrZao", "([JI)J", "elementAt-nggk6HY", "([SI)S", "max", "max-GBYM_sE", "([B)Lkotlin/UByte;", "max--ajY-9A", "([I)Lkotlin/UInt;", "max-QwZRm1k", "([J)Lkotlin/ULong;", "max-rL5Bavg", "([S)Lkotlin/UShort;", "maxBy", "R", "", "selector", "Lkotlin/Function1;", "maxBy-JOV_ifY", "([BLkotlin/jvm/functions/Function1;)Lkotlin/UByte;", "maxBy-jgv0xPQ", "([ILkotlin/jvm/functions/Function1;)Lkotlin/UInt;", "maxBy-MShoTSo", "([JLkotlin/jvm/functions/Function1;)Lkotlin/ULong;", "maxBy-xTcfx_M", "([SLkotlin/jvm/functions/Function1;)Lkotlin/UShort;", "maxWith", "comparator", "Ljava/util/Comparator;", "Lkotlin/Comparator;", "maxWith-XMRcp5o", "([BLjava/util/Comparator;)Lkotlin/UByte;", "maxWith-YmdZ_VM", "([ILjava/util/Comparator;)Lkotlin/UInt;", "maxWith-zrEWJaI", "([JLjava/util/Comparator;)Lkotlin/ULong;", "maxWith-eOHTfZs", "([SLjava/util/Comparator;)Lkotlin/UShort;", "min", "min-GBYM_sE", "min--ajY-9A", "min-QwZRm1k", "min-rL5Bavg", "minBy", "minBy-JOV_ifY", "minBy-jgv0xPQ", "minBy-MShoTSo", "minBy-xTcfx_M", "minWith", "minWith-XMRcp5o", "minWith-YmdZ_VM", "minWith-zrEWJaI", "minWith-eOHTfZs", "sumOf", "Ljava/math/BigDecimal;", "sumOfBigDecimal", "([BLkotlin/jvm/functions/Function1;)Ljava/math/BigDecimal;", "Ljava/math/BigInteger;", "sumOfBigInteger", "([BLkotlin/jvm/functions/Function1;)Ljava/math/BigInteger;", "([ILkotlin/jvm/functions/Function1;)Ljava/math/BigDecimal;", "([ILkotlin/jvm/functions/Function1;)Ljava/math/BigInteger;", "([JLkotlin/jvm/functions/Function1;)Ljava/math/BigDecimal;", "([JLkotlin/jvm/functions/Function1;)Ljava/math/BigInteger;", "([SLkotlin/jvm/functions/Function1;)Ljava/math/BigDecimal;", "([SLkotlin/jvm/functions/Function1;)Ljava/math/BigInteger;", "kotlin-stdlib"}, k = 5, mv = {1, 9, 0}, pn = "kotlin.collections", xi = 49, xs = "kotlin/collections/unsigned/UArraysKt")
/* carregado de: classes17.dex */
class UArraysKt___UArraysJvmKt {
    /* renomeado de: elementAt-qFRl0hI, motivo: nome Java inválido */
    private static final int m1362elementAtqFRl0hI(int[] elementAt, int index) {
        Intrinsics.checkNotNullParameter(elementAt, "$this$elementAt");
        return UIntArray.m1035getpVg5ArA(elementAt, index);
    }

    /* renomeado de: elementAt-r7IrZao, motivo: nome Java inválido */
    private static final long m1363elementAtr7IrZao(long[] elementAt, int index) {
        Intrinsics.checkNotNullParameter(elementAt, "$this$elementAt");
        return ULongArray.m1114getsVKNKU(elementAt, index);
    }

    /* renomeado de: elementAt-PpDY95g, motivo: nome Java inválido */
    private static final byte m1360elementAtPpDY95g(byte[] elementAt, int index) {
        Intrinsics.checkNotNullParameter(elementAt, "$this$elementAt");
        return UByteArray.m956getw2LRezQ(elementAt, index);
    }

    /* renomeado de: elementAt-nggk6HY, motivo: nome Java inválido */
    private static final short m1361elementAtnggk6HY(short[] elementAt, int index) {
        Intrinsics.checkNotNullParameter(elementAt, "$this$elementAt");
        return UShortArray.m1219getMh2AYeg(elementAt, index);
    }

    /* renomeado de: asList--ajY-9A, motivo: nome Java inválido */
    public static final List<UInt> m1348asListajY9A(int[] asList) {
        Intrinsics.checkNotNullParameter(asList, "$this$asList");
        return new UArraysKt___UArraysJvmKt$asList$1(asList);
    }

    /* renomeado de: asList-QwZRm1k, motivo: nome Java inválido */
    public static final List<ULong> m1350asListQwZRm1k(long[] asList) {
        Intrinsics.checkNotNullParameter(asList, "$this$asList");
        return new UArraysKt___UArraysJvmKt$asList$2(asList);
    }

    /* renomeado de: asList-GBYM_sE, motivo: nome Java inválido */
    public static final List<UByte> m1349asListGBYM_sE(byte[] asList) {
        Intrinsics.checkNotNullParameter(asList, "$this$asList");
        return new UArraysKt___UArraysJvmKt$asList$3(asList);
    }

    /* renomeado de: asList-rL5Bavg, motivo: nome Java inválido */
    public static final List<UShort> m1351asListrL5Bavg(short[] asList) {
        Intrinsics.checkNotNullParameter(asList, "$this$asList");
        return new UArraysKt___UArraysJvmKt$asList$4(asList);
    }

    /* renomeado de: binarySearch-2fe2U9s$default, motivo: nome Java inválido */
    public static /* sintético */ int m1353binarySearch2fe2U9s$default(int[] iArr, int i, int i2, int i3, int i4, Object obj) {
        if ((i4 & 2) != 0) {
            i2 = 0;
        }
        if ((i4 & 4) != 0) {
            i3 = UIntArray.m1036getSizeimpl(iArr);
        }
        return UArraysKt.m1352binarySearch2fe2U9s(iArr, i, i2, i3);
    }

    /* renomeado de: binarySearch-2fe2U9s, motivo: nome Java inválido */
    public static final int m1352binarySearch2fe2U9s(int[] binarySearch, int element, int fromIndex, int toIndex) {
        Intrinsics.checkNotNullParameter(binarySearch, "$this$binarySearch");
        AbstractList.INSTANCE.checkRangeIndexes$kotlin_stdlib(fromIndex, toIndex, UIntArray.m1036getSizeimpl(binarySearch));
        int low = fromIndex;
        int high = toIndex - 1;
        while (low <= high) {
            int mid = (low + high) >>> 1;
            int midVal = binarySearch[mid];
            int cmp = UnsignedKt.uintCompare(midVal, element);
            if (cmp < 0) {
                low = mid + 1;
            } else if (cmp > 0) {
                high = mid - 1;
            } else {
                return mid;
            }
        }
        return -(low + 1);
    }

    /* renomeado de: binarySearch-K6DWlUc$default, motivo: nome Java inválido */
    public static /* sintético */ int m1357binarySearchK6DWlUc$default(long[] jArr, long j, int i, int i2, int i3, Object obj) {
        if ((i3 & 2) != 0) {
            i = 0;
        }
        if ((i3 & 4) != 0) {
            i2 = ULongArray.m1115getSizeimpl(jArr);
        }
        return UArraysKt.m1356binarySearchK6DWlUc(jArr, j, i, i2);
    }

    /* renomeado de: binarySearch-K6DWlUc, motivo: nome Java inválido */
    public static final int m1356binarySearchK6DWlUc(long[] binarySearch, long element, int fromIndex, int toIndex) {
        Intrinsics.checkNotNullParameter(binarySearch, "$this$binarySearch");
        AbstractList.INSTANCE.checkRangeIndexes$kotlin_stdlib(fromIndex, toIndex, ULongArray.m1115getSizeimpl(binarySearch));
        int low = fromIndex;
        int high = toIndex - 1;
        while (low <= high) {
            int mid = (low + high) >>> 1;
            long midVal = binarySearch[mid];
            int cmp = UnsignedKt.ulongCompare(midVal, element);
            if (cmp < 0) {
                low = mid + 1;
            } else if (cmp > 0) {
                high = mid - 1;
            } else {
                return mid;
            }
        }
        return -(low + 1);
    }

    /* renomeado de: binarySearch-WpHrYlw$default, motivo: nome Java inválido */
    public static /* sintético */ int m1359binarySearchWpHrYlw$default(byte[] bArr, byte b, int i, int i2, int i3, Object obj) {
        if ((i3 & 2) != 0) {
            i = 0;
        }
        if ((i3 & 4) != 0) {
            i2 = UByteArray.m957getSizeimpl(bArr);
        }
        return UArraysKt.m1358binarySearchWpHrYlw(bArr, b, i, i2);
    }

    /* renomeado de: binarySearch-WpHrYlw, motivo: nome Java inválido */
    public static final int m1358binarySearchWpHrYlw(byte[] binarySearch, byte element, int fromIndex, int toIndex) {
        Intrinsics.checkNotNullParameter(binarySearch, "$this$binarySearch");
        AbstractList.INSTANCE.checkRangeIndexes$kotlin_stdlib(fromIndex, toIndex, UByteArray.m957getSizeimpl(binarySearch));
        int signedElement = element & 255;
        int low = fromIndex;
        int high = toIndex - 1;
        while (low <= high) {
            int mid = (low + high) >>> 1;
            byte midVal = binarySearch[mid];
            int cmp = UnsignedKt.uintCompare(midVal, signedElement);
            if (cmp < 0) {
                low = mid + 1;
            } else if (cmp > 0) {
                high = mid - 1;
            } else {
                return mid;
            }
        }
        return -(low + 1);
    }

    /* renomeado de: binarySearch-EtDCXyQ$default, motivo: nome Java inválido */
    public static /* sintético */ int m1355binarySearchEtDCXyQ$default(short[] sArr, short s, int i, int i2, int i3, Object obj) {
        if ((i3 & 2) != 0) {
            i = 0;
        }
        if ((i3 & 4) != 0) {
            i2 = UShortArray.m1220getSizeimpl(sArr);
        }
        return UArraysKt.m1354binarySearchEtDCXyQ(sArr, s, i, i2);
    }

    /* renomeado de: binarySearch-EtDCXyQ, motivo: nome Java inválido */
    public static final int m1354binarySearchEtDCXyQ(short[] binarySearch, short element, int fromIndex, int toIndex) {
        Intrinsics.checkNotNullParameter(binarySearch, "$this$binarySearch");
        AbstractList.INSTANCE.checkRangeIndexes$kotlin_stdlib(fromIndex, toIndex, UShortArray.m1220getSizeimpl(binarySearch));
        int signedElement = 65535 & element;
        int low = fromIndex;
        int high = toIndex - 1;
        while (low <= high) {
            int mid = (low + high) >>> 1;
            short midVal = binarySearch[mid];
            int cmp = UnsignedKt.uintCompare(midVal, signedElement);
            if (cmp < 0) {
                low = mid + 1;
            } else if (cmp > 0) {
                high = mid - 1;
            } else {
                return mid;
            }
        }
        return -(low + 1);
    }

    @Deprecated(message = "Use maxOrNull instead.", replaceWith = @ReplaceWith(expression = "this.maxOrNull()", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: max--ajY-9A, motivo: nome Java inválido */
    public static final /* sintético */ UInt m1364maxajY9A(int[] max) {
        Intrinsics.checkNotNullParameter(max, "$this$max");
        return UArraysKt.m1732maxOrNullajY9A(max);
    }

    @Deprecated(message = "Use maxOrNull instead.", replaceWith = @ReplaceWith(expression = "this.maxOrNull()", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: max-QwZRm1k, motivo: nome Java inválido */
    public static final /* sintético */ ULong m1366maxQwZRm1k(long[] max) {
        Intrinsics.checkNotNullParameter(max, "$this$max");
        return UArraysKt.m1734maxOrNullQwZRm1k(max);
    }

    @Deprecated(message = "Use maxOrNull instead.", replaceWith = @ReplaceWith(expression = "this.maxOrNull()", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: max-GBYM_sE, motivo: nome Java inválido */
    public static final /* sintético */ UByte m1365maxGBYM_sE(byte[] max) {
        Intrinsics.checkNotNullParameter(max, "$this$max");
        return UArraysKt.m1733maxOrNullGBYM_sE(max);
    }

    @Deprecated(message = "Use maxOrNull instead.", replaceWith = @ReplaceWith(expression = "this.maxOrNull()", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: max-rL5Bavg, motivo: nome Java inválido */
    public static final /* sintético */ UShort m1367maxrL5Bavg(short[] max) {
        Intrinsics.checkNotNullParameter(max, "$this$max");
        return UArraysKt.m1735maxOrNullrL5Bavg(max);
    }

    @Deprecated(message = "Use maxByOrNull instead.", replaceWith = @ReplaceWith(expression = "this.maxByOrNull(selector)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: maxBy-jgv0xPQ, motivo: nome Java inválido */
    private static final /* sintético */ <R extends Comparable<? super R>> UInt m1370maxByjgv0xPQ(int[] maxBy, Function1<? super UInt, ? extends R> selector) {
        Intrinsics.checkNotNullParameter(maxBy, "$this$maxBy");
        Intrinsics.checkNotNullParameter(selector, "selector");
        if (UIntArray.m1038isEmptyimpl(maxBy)) {
            return null;
        }
        int m1035getpVg5ArA = UIntArray.m1035getpVg5ArA(maxBy, 0);
        int lastIndex = ArraysKt.getLastIndex(maxBy);
        if (lastIndex != 0) {
            R invoke = selector.invoke(UInt.m969boximpl(m1035getpVg5ArA));
            int i = 1;
            if (1 <= lastIndex) {
                while (true) {
                    int m1035getpVg5ArA2 = UIntArray.m1035getpVg5ArA(maxBy, i);
                    R invoke2 = selector.invoke(UInt.m969boximpl(m1035getpVg5ArA2));
                    if (invoke.compareTo(invoke2) < 0) {
                        m1035getpVg5ArA = m1035getpVg5ArA2;
                        invoke = invoke2;
                    }
                    if (i == lastIndex) {
                        break;
                    }
                    i++;
                }
            }
        }
        return UInt.m969boximpl(m1035getpVg5ArA);
    }

    @Deprecated(message = "Use maxByOrNull instead.", replaceWith = @ReplaceWith(expression = "this.maxByOrNull(selector)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: maxBy-MShoTSo, motivo: nome Java inválido */
    private static final /* sintético */ <R extends Comparable<? super R>> ULong m1369maxByMShoTSo(long[] maxBy, Function1<? super ULong, ? extends R> selector) {
        Intrinsics.checkNotNullParameter(maxBy, "$this$maxBy");
        Intrinsics.checkNotNullParameter(selector, "selector");
        if (ULongArray.m1117isEmptyimpl(maxBy)) {
            return null;
        }
        long m1114getsVKNKU = ULongArray.m1114getsVKNKU(maxBy, 0);
        int lastIndex = ArraysKt.getLastIndex(maxBy);
        if (lastIndex != 0) {
            R invoke = selector.invoke(ULong.m1048boximpl(m1114getsVKNKU));
            int i = 1;
            if (1 <= lastIndex) {
                while (true) {
                    long m1114getsVKNKU2 = ULongArray.m1114getsVKNKU(maxBy, i);
                    R invoke2 = selector.invoke(ULong.m1048boximpl(m1114getsVKNKU2));
                    if (invoke.compareTo(invoke2) < 0) {
                        m1114getsVKNKU = m1114getsVKNKU2;
                        invoke = invoke2;
                    }
                    if (i == lastIndex) {
                        break;
                    }
                    i++;
                }
            }
        }
        return ULong.m1048boximpl(m1114getsVKNKU);
    }

    @Deprecated(message = "Use maxByOrNull instead.", replaceWith = @ReplaceWith(expression = "this.maxByOrNull(selector)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: maxBy-JOV_ifY, motivo: nome Java inválido */
    private static final /* sintético */ <R extends Comparable<? super R>> UByte m1368maxByJOV_ifY(byte[] maxBy, Function1<? super UByte, ? extends R> selector) {
        Intrinsics.checkNotNullParameter(maxBy, "$this$maxBy");
        Intrinsics.checkNotNullParameter(selector, "selector");
        if (UByteArray.m959isEmptyimpl(maxBy)) {
            return null;
        }
        byte m956getw2LRezQ = UByteArray.m956getw2LRezQ(maxBy, 0);
        int lastIndex = ArraysKt.getLastIndex(maxBy);
        if (lastIndex != 0) {
            R invoke = selector.invoke(UByte.m892boximpl(m956getw2LRezQ));
            int i = 1;
            if (1 <= lastIndex) {
                while (true) {
                    byte m956getw2LRezQ2 = UByteArray.m956getw2LRezQ(maxBy, i);
                    R invoke2 = selector.invoke(UByte.m892boximpl(m956getw2LRezQ2));
                    if (invoke.compareTo(invoke2) < 0) {
                        m956getw2LRezQ = m956getw2LRezQ2;
                        invoke = invoke2;
                    }
                    if (i == lastIndex) {
                        break;
                    }
                    i++;
                }
            }
        }
        return UByte.m892boximpl(m956getw2LRezQ);
    }

    @Deprecated(message = "Use maxByOrNull instead.", replaceWith = @ReplaceWith(expression = "this.maxByOrNull(selector)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: maxBy-xTcfx_M, motivo: nome Java inválido */
    private static final /* sintético */ <R extends Comparable<? super R>> UShort m1371maxByxTcfx_M(short[] maxBy, Function1<? super UShort, ? extends R> selector) {
        Intrinsics.checkNotNullParameter(maxBy, "$this$maxBy");
        Intrinsics.checkNotNullParameter(selector, "selector");
        if (UShortArray.m1222isEmptyimpl(maxBy)) {
            return null;
        }
        short m1219getMh2AYeg = UShortArray.m1219getMh2AYeg(maxBy, 0);
        int lastIndex = ArraysKt.getLastIndex(maxBy);
        if (lastIndex != 0) {
            R invoke = selector.invoke(UShort.m1155boximpl(m1219getMh2AYeg));
            int i = 1;
            if (1 <= lastIndex) {
                while (true) {
                    short m1219getMh2AYeg2 = UShortArray.m1219getMh2AYeg(maxBy, i);
                    R invoke2 = selector.invoke(UShort.m1155boximpl(m1219getMh2AYeg2));
                    if (invoke.compareTo(invoke2) < 0) {
                        m1219getMh2AYeg = m1219getMh2AYeg2;
                        invoke = invoke2;
                    }
                    if (i == lastIndex) {
                        break;
                    }
                    i++;
                }
            }
        }
        return UShort.m1155boximpl(m1219getMh2AYeg);
    }

    @Deprecated(message = "Use maxWithOrNull instead.", replaceWith = @ReplaceWith(expression = "this.maxWithOrNull(comparator)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: maxWith-YmdZ_VM, motivo: nome Java inválido */
    public static final /* sintético */ UInt m1373maxWithYmdZ_VM(int[] maxWith, Comparator comparator) {
        Intrinsics.checkNotNullParameter(maxWith, "$this$maxWith");
        Intrinsics.checkNotNullParameter(comparator, "comparator");
        return UArraysKt.m1741maxWithOrNullYmdZ_VM(maxWith, comparator);
    }

    @Deprecated(message = "Use maxWithOrNull instead.", replaceWith = @ReplaceWith(expression = "this.maxWithOrNull(comparator)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: maxWith-zrEWJaI, motivo: nome Java inválido */
    public static final /* sintético */ ULong m1375maxWithzrEWJaI(long[] maxWith, Comparator comparator) {
        Intrinsics.checkNotNullParameter(maxWith, "$this$maxWith");
        Intrinsics.checkNotNullParameter(comparator, "comparator");
        return UArraysKt.m1743maxWithOrNullzrEWJaI(maxWith, comparator);
    }

    @Deprecated(message = "Use maxWithOrNull instead.", replaceWith = @ReplaceWith(expression = "this.maxWithOrNull(comparator)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: maxWith-XMRcp5o, motivo: nome Java inválido */
    public static final /* sintético */ UByte m1372maxWithXMRcp5o(byte[] maxWith, Comparator comparator) {
        Intrinsics.checkNotNullParameter(maxWith, "$this$maxWith");
        Intrinsics.checkNotNullParameter(comparator, "comparator");
        return UArraysKt.m1740maxWithOrNullXMRcp5o(maxWith, comparator);
    }

    @Deprecated(message = "Use maxWithOrNull instead.", replaceWith = @ReplaceWith(expression = "this.maxWithOrNull(comparator)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: maxWith-eOHTfZs, motivo: nome Java inválido */
    public static final /* sintético */ UShort m1374maxWitheOHTfZs(short[] maxWith, Comparator comparator) {
        Intrinsics.checkNotNullParameter(maxWith, "$this$maxWith");
        Intrinsics.checkNotNullParameter(comparator, "comparator");
        return UArraysKt.m1742maxWithOrNulleOHTfZs(maxWith, comparator);
    }

    @Deprecated(message = "Use minOrNull instead.", replaceWith = @ReplaceWith(expression = "this.minOrNull()", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: min--ajY-9A, motivo: nome Java inválido */
    public static final /* sintético */ UInt m1376minajY9A(int[] min) {
        Intrinsics.checkNotNullParameter(min, "$this$min");
        return UArraysKt.m1788minOrNullajY9A(min);
    }

    @Deprecated(message = "Use minOrNull instead.", replaceWith = @ReplaceWith(expression = "this.minOrNull()", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: min-QwZRm1k, motivo: nome Java inválido */
    public static final /* sintético */ ULong m1378minQwZRm1k(long[] min) {
        Intrinsics.checkNotNullParameter(min, "$this$min");
        return UArraysKt.m1790minOrNullQwZRm1k(min);
    }

    @Deprecated(message = "Use minOrNull instead.", replaceWith = @ReplaceWith(expression = "this.minOrNull()", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: min-GBYM_sE, motivo: nome Java inválido */
    public static final /* sintético */ UByte m1377minGBYM_sE(byte[] min) {
        Intrinsics.checkNotNullParameter(min, "$this$min");
        return UArraysKt.m1789minOrNullGBYM_sE(min);
    }

    @Deprecated(message = "Use minOrNull instead.", replaceWith = @ReplaceWith(expression = "this.minOrNull()", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: min-rL5Bavg, motivo: nome Java inválido */
    public static final /* sintético */ UShort m1379minrL5Bavg(short[] min) {
        Intrinsics.checkNotNullParameter(min, "$this$min");
        return UArraysKt.m1791minOrNullrL5Bavg(min);
    }

    @Deprecated(message = "Use minByOrNull instead.", replaceWith = @ReplaceWith(expression = "this.minByOrNull(selector)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: minBy-jgv0xPQ, motivo: nome Java inválido */
    private static final /* sintético */ <R extends Comparable<? super R>> UInt m1382minByjgv0xPQ(int[] minBy, Function1<? super UInt, ? extends R> selector) {
        Intrinsics.checkNotNullParameter(minBy, "$this$minBy");
        Intrinsics.checkNotNullParameter(selector, "selector");
        if (UIntArray.m1038isEmptyimpl(minBy)) {
            return null;
        }
        int m1035getpVg5ArA = UIntArray.m1035getpVg5ArA(minBy, 0);
        int lastIndex = ArraysKt.getLastIndex(minBy);
        if (lastIndex != 0) {
            R invoke = selector.invoke(UInt.m969boximpl(m1035getpVg5ArA));
            int i = 1;
            if (1 <= lastIndex) {
                while (true) {
                    int m1035getpVg5ArA2 = UIntArray.m1035getpVg5ArA(minBy, i);
                    R invoke2 = selector.invoke(UInt.m969boximpl(m1035getpVg5ArA2));
                    if (invoke.compareTo(invoke2) > 0) {
                        m1035getpVg5ArA = m1035getpVg5ArA2;
                        invoke = invoke2;
                    }
                    if (i == lastIndex) {
                        break;
                    }
                    i++;
                }
            }
        }
        return UInt.m969boximpl(m1035getpVg5ArA);
    }

    @Deprecated(message = "Use minByOrNull instead.", replaceWith = @ReplaceWith(expression = "this.minByOrNull(selector)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: minBy-MShoTSo, motivo: nome Java inválido */
    private static final /* sintético */ <R extends Comparable<? super R>> ULong m1381minByMShoTSo(long[] minBy, Function1<? super ULong, ? extends R> selector) {
        Intrinsics.checkNotNullParameter(minBy, "$this$minBy");
        Intrinsics.checkNotNullParameter(selector, "selector");
        if (ULongArray.m1117isEmptyimpl(minBy)) {
            return null;
        }
        long m1114getsVKNKU = ULongArray.m1114getsVKNKU(minBy, 0);
        int lastIndex = ArraysKt.getLastIndex(minBy);
        if (lastIndex != 0) {
            R invoke = selector.invoke(ULong.m1048boximpl(m1114getsVKNKU));
            int i = 1;
            if (1 <= lastIndex) {
                while (true) {
                    long m1114getsVKNKU2 = ULongArray.m1114getsVKNKU(minBy, i);
                    R invoke2 = selector.invoke(ULong.m1048boximpl(m1114getsVKNKU2));
                    if (invoke.compareTo(invoke2) > 0) {
                        m1114getsVKNKU = m1114getsVKNKU2;
                        invoke = invoke2;
                    }
                    if (i == lastIndex) {
                        break;
                    }
                    i++;
                }
            }
        }
        return ULong.m1048boximpl(m1114getsVKNKU);
    }

    @Deprecated(message = "Use minByOrNull instead.", replaceWith = @ReplaceWith(expression = "this.minByOrNull(selector)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: minBy-JOV_ifY, motivo: nome Java inválido */
    private static final /* sintético */ <R extends Comparable<? super R>> UByte m1380minByJOV_ifY(byte[] minBy, Function1<? super UByte, ? extends R> selector) {
        Intrinsics.checkNotNullParameter(minBy, "$this$minBy");
        Intrinsics.checkNotNullParameter(selector, "selector");
        if (UByteArray.m959isEmptyimpl(minBy)) {
            return null;
        }
        byte m956getw2LRezQ = UByteArray.m956getw2LRezQ(minBy, 0);
        int lastIndex = ArraysKt.getLastIndex(minBy);
        if (lastIndex != 0) {
            R invoke = selector.invoke(UByte.m892boximpl(m956getw2LRezQ));
            int i = 1;
            if (1 <= lastIndex) {
                while (true) {
                    byte m956getw2LRezQ2 = UByteArray.m956getw2LRezQ(minBy, i);
                    R invoke2 = selector.invoke(UByte.m892boximpl(m956getw2LRezQ2));
                    if (invoke.compareTo(invoke2) > 0) {
                        m956getw2LRezQ = m956getw2LRezQ2;
                        invoke = invoke2;
                    }
                    if (i == lastIndex) {
                        break;
                    }
                    i++;
                }
            }
        }
        return UByte.m892boximpl(m956getw2LRezQ);
    }

    @Deprecated(message = "Use minByOrNull instead.", replaceWith = @ReplaceWith(expression = "this.minByOrNull(selector)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: minBy-xTcfx_M, motivo: nome Java inválido */
    private static final /* sintético */ <R extends Comparable<? super R>> UShort m1383minByxTcfx_M(short[] minBy, Function1<? super UShort, ? extends R> selector) {
        Intrinsics.checkNotNullParameter(minBy, "$this$minBy");
        Intrinsics.checkNotNullParameter(selector, "selector");
        if (UShortArray.m1222isEmptyimpl(minBy)) {
            return null;
        }
        short m1219getMh2AYeg = UShortArray.m1219getMh2AYeg(minBy, 0);
        int lastIndex = ArraysKt.getLastIndex(minBy);
        if (lastIndex != 0) {
            R invoke = selector.invoke(UShort.m1155boximpl(m1219getMh2AYeg));
            int i = 1;
            if (1 <= lastIndex) {
                while (true) {
                    short m1219getMh2AYeg2 = UShortArray.m1219getMh2AYeg(minBy, i);
                    R invoke2 = selector.invoke(UShort.m1155boximpl(m1219getMh2AYeg2));
                    if (invoke.compareTo(invoke2) > 0) {
                        m1219getMh2AYeg = m1219getMh2AYeg2;
                        invoke = invoke2;
                    }
                    if (i == lastIndex) {
                        break;
                    }
                    i++;
                }
            }
        }
        return UShort.m1155boximpl(m1219getMh2AYeg);
    }

    @Deprecated(message = "Use minWithOrNull instead.", replaceWith = @ReplaceWith(expression = "this.minWithOrNull(comparator)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: minWith-YmdZ_VM, motivo: nome Java inválido */
    public static final /* sintético */ UInt m1385minWithYmdZ_VM(int[] minWith, Comparator comparator) {
        Intrinsics.checkNotNullParameter(minWith, "$this$minWith");
        Intrinsics.checkNotNullParameter(comparator, "comparator");
        return UArraysKt.m1797minWithOrNullYmdZ_VM(minWith, comparator);
    }

    @Deprecated(message = "Use minWithOrNull instead.", replaceWith = @ReplaceWith(expression = "this.minWithOrNull(comparator)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: minWith-zrEWJaI, motivo: nome Java inválido */
    public static final /* sintético */ ULong m1387minWithzrEWJaI(long[] minWith, Comparator comparator) {
        Intrinsics.checkNotNullParameter(minWith, "$this$minWith");
        Intrinsics.checkNotNullParameter(comparator, "comparator");
        return UArraysKt.m1799minWithOrNullzrEWJaI(minWith, comparator);
    }

    @Deprecated(message = "Use minWithOrNull instead.", replaceWith = @ReplaceWith(expression = "this.minWithOrNull(comparator)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: minWith-XMRcp5o, motivo: nome Java inválido */
    public static final /* sintético */ UByte m1384minWithXMRcp5o(byte[] minWith, Comparator comparator) {
        Intrinsics.checkNotNullParameter(minWith, "$this$minWith");
        Intrinsics.checkNotNullParameter(comparator, "comparator");
        return UArraysKt.m1796minWithOrNullXMRcp5o(minWith, comparator);
    }

    @Deprecated(message = "Use minWithOrNull instead.", replaceWith = @ReplaceWith(expression = "this.minWithOrNull(comparator)", imports = {}))
    @DeprecatedSinceKotlin(errorSince = "1.5", hiddenSince = "1.6", warningSince = "1.4")
    /* renomeado de: minWith-eOHTfZs, motivo: nome Java inválido */
    public static final /* sintético */ UShort m1386minWitheOHTfZs(short[] minWith, Comparator comparator) {
        Intrinsics.checkNotNullParameter(minWith, "$this$minWith");
        Intrinsics.checkNotNullParameter(comparator, "comparator");
        return UArraysKt.m1798minWithOrNulleOHTfZs(minWith, comparator);
    }

    private static final BigDecimal sumOfBigDecimal(int[] sumOf, Function1<? super UInt, ? extends BigDecimal> selector) {
        Intrinsics.checkNotNullParameter(sumOf, "$this$sumOf");
        Intrinsics.checkNotNullParameter(selector, "selector");
        BigDecimal sum = BigDecimal.valueOf(0L);
        Intrinsics.checkNotNullExpressionValue(sum, "valueOf(...)");
        int m1036getSizeimpl = UIntArray.m1036getSizeimpl(sumOf);
        for (int i = 0; i < m1036getSizeimpl; i++) {
            int element = UIntArray.m1035getpVg5ArA(sumOf, i);
            BigDecimal add = sum.add(selector.invoke(UInt.m969boximpl(element)));
            Intrinsics.checkNotNullExpressionValue(add, "add(...)");
            sum = add;
        }
        return sum;
    }

    private static final BigDecimal sumOfBigDecimal(long[] sumOf, Function1<? super ULong, ? extends BigDecimal> selector) {
        Intrinsics.checkNotNullParameter(sumOf, "$this$sumOf");
        Intrinsics.checkNotNullParameter(selector, "selector");
        BigDecimal sum = BigDecimal.valueOf(0L);
        Intrinsics.checkNotNullExpressionValue(sum, "valueOf(...)");
        int m1115getSizeimpl = ULongArray.m1115getSizeimpl(sumOf);
        for (int i = 0; i < m1115getSizeimpl; i++) {
            long element = ULongArray.m1114getsVKNKU(sumOf, i);
            BigDecimal add = sum.add(selector.invoke(ULong.m1048boximpl(element)));
            Intrinsics.checkNotNullExpressionValue(add, "add(...)");
            sum = add;
        }
        return sum;
    }

    private static final BigDecimal sumOfBigDecimal(byte[] sumOf, Function1<? super UByte, ? extends BigDecimal> selector) {
        Intrinsics.checkNotNullParameter(sumOf, "$this$sumOf");
        Intrinsics.checkNotNullParameter(selector, "selector");
        BigDecimal sum = BigDecimal.valueOf(0L);
        Intrinsics.checkNotNullExpressionValue(sum, "valueOf(...)");
        int m957getSizeimpl = UByteArray.m957getSizeimpl(sumOf);
        for (int i = 0; i < m957getSizeimpl; i++) {
            byte element = UByteArray.m956getw2LRezQ(sumOf, i);
            BigDecimal add = sum.add(selector.invoke(UByte.m892boximpl(element)));
            Intrinsics.checkNotNullExpressionValue(add, "add(...)");
            sum = add;
        }
        return sum;
    }

    private static final BigDecimal sumOfBigDecimal(short[] sumOf, Function1<? super UShort, ? extends BigDecimal> selector) {
        Intrinsics.checkNotNullParameter(sumOf, "$this$sumOf");
        Intrinsics.checkNotNullParameter(selector, "selector");
        BigDecimal sum = BigDecimal.valueOf(0L);
        Intrinsics.checkNotNullExpressionValue(sum, "valueOf(...)");
        int m1220getSizeimpl = UShortArray.m1220getSizeimpl(sumOf);
        for (int i = 0; i < m1220getSizeimpl; i++) {
            short element = UShortArray.m1219getMh2AYeg(sumOf, i);
            BigDecimal add = sum.add(selector.invoke(UShort.m1155boximpl(element)));
            Intrinsics.checkNotNullExpressionValue(add, "add(...)");
            sum = add;
        }
        return sum;
    }

    private static final BigInteger sumOfBigInteger(int[] sumOf, Function1<? super UInt, ? extends BigInteger> selector) {
        Intrinsics.checkNotNullParameter(sumOf, "$this$sumOf");
        Intrinsics.checkNotNullParameter(selector, "selector");
        BigInteger sum = BigInteger.valueOf(0L);
        Intrinsics.checkNotNullExpressionValue(sum, "valueOf(...)");
        int m1036getSizeimpl = UIntArray.m1036getSizeimpl(sumOf);
        for (int i = 0; i < m1036getSizeimpl; i++) {
            int element = UIntArray.m1035getpVg5ArA(sumOf, i);
            BigInteger add = sum.add(selector.invoke(UInt.m969boximpl(element)));
            Intrinsics.checkNotNullExpressionValue(add, "add(...)");
            sum = add;
        }
        return sum;
    }

    private static final BigInteger sumOfBigInteger(long[] sumOf, Function1<? super ULong, ? extends BigInteger> selector) {
        Intrinsics.checkNotNullParameter(sumOf, "$this$sumOf");
        Intrinsics.checkNotNullParameter(selector, "selector");
        BigInteger sum = BigInteger.valueOf(0L);
        Intrinsics.checkNotNullExpressionValue(sum, "valueOf(...)");
        int m1115getSizeimpl = ULongArray.m1115getSizeimpl(sumOf);
        for (int i = 0; i < m1115getSizeimpl; i++) {
            long element = ULongArray.m1114getsVKNKU(sumOf, i);
            BigInteger add = sum.add(selector.invoke(ULong.m1048boximpl(element)));
            Intrinsics.checkNotNullExpressionValue(add, "add(...)");
            sum = add;
        }
        return sum;
    }

    private static final BigInteger sumOfBigInteger(byte[] sumOf, Function1<? super UByte, ? extends BigInteger> selector) {
        Intrinsics.checkNotNullParameter(sumOf, "$this$sumOf");
        Intrinsics.checkNotNullParameter(selector, "selector");
        BigInteger sum = BigInteger.valueOf(0L);
        Intrinsics.checkNotNullExpressionValue(sum, "valueOf(...)");
        int m957getSizeimpl = UByteArray.m957getSizeimpl(sumOf);
        for (int i = 0; i < m957getSizeimpl; i++) {
            byte element = UByteArray.m956getw2LRezQ(sumOf, i);
            BigInteger add = sum.add(selector.invoke(UByte.m892boximpl(element)));
            Intrinsics.checkNotNullExpressionValue(add, "add(...)");
            sum = add;
        }
        return sum;
    }

    private static final BigInteger sumOfBigInteger(short[] sumOf, Function1<? super UShort, ? extends BigInteger> selector) {
        Intrinsics.checkNotNullParameter(sumOf, "$this$sumOf");
        Intrinsics.checkNotNullParameter(selector, "selector");
        BigInteger sum = BigInteger.valueOf(0L);
        Intrinsics.checkNotNullExpressionValue(sum, "valueOf(...)");
        int m1220getSizeimpl = UShortArray.m1220getSizeimpl(sumOf);
        for (int i = 0; i < m1220getSizeimpl; i++) {
            short element = UShortArray.m1219getMh2AYeg(sumOf, i);
            BigInteger add = sum.add(selector.invoke(UShort.m1155boximpl(element)));
            Intrinsics.checkNotNullExpressionValue(add, "add(...)");
            sum = add;
        }
        return sum;
    }
}
