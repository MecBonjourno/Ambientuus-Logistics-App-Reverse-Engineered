package kotlin;

import androidx.constraintlayout.widget.ConstraintLayout;

/* compiled from: UNumbers.kt */
@Metadata(d1 = {"\u0000&\n\u0000\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b)\u001a\u0014\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0087\b¢\u0006\u0004\b\u0003\u0010\u0004\u001a\u0014\u0010\u0000\u001a\u00020\u0001*\u00020\u0005H\u0087\b¢\u0006\u0004\b\u0006\u0010\u0007\u001a\u0014\u0010\u0000\u001a\u00020\u0001*\u00020\bH\u0087\b¢\u0006\u0004\b\t\u0010\n\u001a\u0014\u0010\u0000\u001a\u00020\u0001*\u00020\u000bH\u0087\b¢\u0006\u0004\b\f\u0010\r\u001a\u0014\u0010\u000e\u001a\u00020\u0001*\u00020\u0002H\u0087\b¢\u0006\u0004\b\u000f\u0010\u0004\u001a\u0014\u0010\u000e\u001a\u00020\u0001*\u00020\u0005H\u0087\b¢\u0006\u0004\b\u0010\u0010\u0007\u001a\u0014\u0010\u000e\u001a\u00020\u0001*\u00020\bH\u0087\b¢\u0006\u0004\b\u0011\u0010\n\u001a\u0014\u0010\u000e\u001a\u00020\u0001*\u00020\u000bH\u0087\b¢\u0006\u0004\b\u0012\u0010\r\u001a\u0014\u0010\u0013\u001a\u00020\u0001*\u00020\u0002H\u0087\b¢\u0006\u0004\b\u0014\u0010\u0004\u001a\u0014\u0010\u0013\u001a\u00020\u0001*\u00020\u0005H\u0087\b¢\u0006\u0004\b\u0015\u0010\u0007\u001a\u0014\u0010\u0013\u001a\u00020\u0001*\u00020\bH\u0087\b¢\u0006\u0004\b\u0016\u0010\n\u001a\u0014\u0010\u0013\u001a\u00020\u0001*\u00020\u000bH\u0087\b¢\u0006\u0004\b\u0017\u0010\r\u001a\u001c\u0010\u0018\u001a\u00020\u0002*\u00020\u00022\u0006\u0010\u0019\u001a\u00020\u0001H\u0087\b¢\u0006\u0004\b\u001a\u0010\u001b\u001a\u001c\u0010\u0018\u001a\u00020\u0005*\u00020\u00052\u0006\u0010\u0019\u001a\u00020\u0001H\u0087\b¢\u0006\u0004\b\u001c\u0010\u001d\u001a\u001c\u0010\u0018\u001a\u00020\b*\u00020\b2\u0006\u0010\u0019\u001a\u00020\u0001H\u0087\b¢\u0006\u0004\b\u001e\u0010\u001f\u001a\u001c\u0010\u0018\u001a\u00020\u000b*\u00020\u000b2\u0006\u0010\u0019\u001a\u00020\u0001H\u0087\b¢\u0006\u0004\b \u0010!\u001a\u001c\u0010\"\u001a\u00020\u0002*\u00020\u00022\u0006\u0010\u0019\u001a\u00020\u0001H\u0087\b¢\u0006\u0004\b#\u0010\u001b\u001a\u001c\u0010\"\u001a\u00020\u0005*\u00020\u00052\u0006\u0010\u0019\u001a\u00020\u0001H\u0087\b¢\u0006\u0004\b$\u0010\u001d\u001a\u001c\u0010\"\u001a\u00020\b*\u00020\b2\u0006\u0010\u0019\u001a\u00020\u0001H\u0087\b¢\u0006\u0004\b%\u0010\u001f\u001a\u001c\u0010\"\u001a\u00020\u000b*\u00020\u000b2\u0006\u0010\u0019\u001a\u00020\u0001H\u0087\b¢\u0006\u0004\b&\u0010!\u001a\u0014\u0010'\u001a\u00020\u0002*\u00020\u0002H\u0087\b¢\u0006\u0004\b(\u0010)\u001a\u0014\u0010'\u001a\u00020\u0005*\u00020\u0005H\u0087\b¢\u0006\u0004\b*\u0010\u0007\u001a\u0014\u0010'\u001a\u00020\b*\u00020\bH\u0087\b¢\u0006\u0004\b+\u0010,\u001a\u0014\u0010'\u001a\u00020\u000b*\u00020\u000bH\u0087\b¢\u0006\u0004\b-\u0010.\u001a\u0014\u0010/\u001a\u00020\u0002*\u00020\u0002H\u0087\b¢\u0006\u0004\b0\u0010)\u001a\u0014\u0010/\u001a\u00020\u0005*\u00020\u0005H\u0087\b¢\u0006\u0004\b1\u0010\u0007\u001a\u0014\u0010/\u001a\u00020\b*\u00020\bH\u0087\b¢\u0006\u0004\b2\u0010,\u001a\u0014\u0010/\u001a\u00020\u000b*\u00020\u000bH\u0087\b¢\u0006\u0004\b3\u0010.¨\u00064"}, d2 = {"countLeadingZeroBits", "", "Lkotlin/UByte;", "countLeadingZeroBits-7apg3OU", "(B)I", "Lkotlin/UInt;", "countLeadingZeroBits-WZ4Q5Ns", "(I)I", "Lkotlin/ULong;", "countLeadingZeroBits-VKZWuLQ", "(J)I", "Lkotlin/UShort;", "countLeadingZeroBits-xj2QHRw", "(S)I", "countOneBits", "countOneBits-7apg3OU", "countOneBits-WZ4Q5Ns", "countOneBits-VKZWuLQ", "countOneBits-xj2QHRw", "countTrailingZeroBits", "countTrailingZeroBits-7apg3OU", "countTrailingZeroBits-WZ4Q5Ns", "countTrailingZeroBits-VKZWuLQ", "countTrailingZeroBits-xj2QHRw", "rotateLeft", "bitCount", "rotateLeft-LxnNnR4", "(BI)B", "rotateLeft-V7xB4Y4", "(II)I", "rotateLeft-JSWoG40", "(JI)J", "rotateLeft-olVBNx4", "(SI)S", "rotateRight", "rotateRight-LxnNnR4", "rotateRight-V7xB4Y4", "rotateRight-JSWoG40", "rotateRight-olVBNx4", "takeHighestOneBit", "takeHighestOneBit-7apg3OU", "(B)B", "takeHighestOneBit-WZ4Q5Ns", "takeHighestOneBit-VKZWuLQ", "(J)J", "takeHighestOneBit-xj2QHRw", "(S)S", "takeLowestOneBit", "takeLowestOneBit-7apg3OU", "takeLowestOneBit-WZ4Q5Ns", "takeLowestOneBit-VKZWuLQ", "takeLowestOneBit-xj2QHRw", "kotlin-stdlib"}, k = 2, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class UNumbersKt {
    /* renomeado de: countOneBits-WZ4Q5Ns, motivo: nome Java inválido */
    private static final int m1132countOneBitsWZ4Q5Ns(int $this$countOneBits_u2dWZ4Q5Ns) {
        return Integer.bitCount($this$countOneBits_u2dWZ4Q5Ns);
    }

    /* renomeado de: countLeadingZeroBits-WZ4Q5Ns, motivo: nome Java inválido */
    private static final int m1128countLeadingZeroBitsWZ4Q5Ns(int $this$countLeadingZeroBits_u2dWZ4Q5Ns) {
        return Integer.numberOfLeadingZeros($this$countLeadingZeroBits_u2dWZ4Q5Ns);
    }

    /* renomeado de: countTrailingZeroBits-WZ4Q5Ns, motivo: nome Java inválido */
    private static final int m1136countTrailingZeroBitsWZ4Q5Ns(int $this$countTrailingZeroBits_u2dWZ4Q5Ns) {
        return Integer.numberOfTrailingZeros($this$countTrailingZeroBits_u2dWZ4Q5Ns);
    }

    /* renomeado de: takeHighestOneBit-WZ4Q5Ns, motivo: nome Java inválido */
    private static final int m1148takeHighestOneBitWZ4Q5Ns(int $this$takeHighestOneBit_u2dWZ4Q5Ns) {
        return UInt.m975constructorimpl(Integer.highestOneBit($this$takeHighestOneBit_u2dWZ4Q5Ns));
    }

    /* renomeado de: takeLowestOneBit-WZ4Q5Ns, motivo: nome Java inválido */
    private static final int m1152takeLowestOneBitWZ4Q5Ns(int $this$takeLowestOneBit_u2dWZ4Q5Ns) {
        return UInt.m975constructorimpl(Integer.lowestOneBit($this$takeLowestOneBit_u2dWZ4Q5Ns));
    }

    /* renomeado de: rotateLeft-V7xB4Y4, motivo: nome Java inválido */
    private static final int m1140rotateLeftV7xB4Y4(int $this$rotateLeft_u2dV7xB4Y4, int bitCount) {
        return UInt.m975constructorimpl(Integer.rotateLeft($this$rotateLeft_u2dV7xB4Y4, bitCount));
    }

    /* renomeado de: rotateRight-V7xB4Y4, motivo: nome Java inválido */
    private static final int m1144rotateRightV7xB4Y4(int $this$rotateRight_u2dV7xB4Y4, int bitCount) {
        return UInt.m975constructorimpl(Integer.rotateRight($this$rotateRight_u2dV7xB4Y4, bitCount));
    }

    /* renomeado de: countOneBits-VKZWuLQ, motivo: nome Java inválido */
    private static final int m1131countOneBitsVKZWuLQ(long $this$countOneBits_u2dVKZWuLQ) {
        return Long.bitCount($this$countOneBits_u2dVKZWuLQ);
    }

    /* renomeado de: countLeadingZeroBits-VKZWuLQ, motivo: nome Java inválido */
    private static final int m1127countLeadingZeroBitsVKZWuLQ(long $this$countLeadingZeroBits_u2dVKZWuLQ) {
        return Long.numberOfLeadingZeros($this$countLeadingZeroBits_u2dVKZWuLQ);
    }

    /* renomeado de: countTrailingZeroBits-VKZWuLQ, motivo: nome Java inválido */
    private static final int m1135countTrailingZeroBitsVKZWuLQ(long $this$countTrailingZeroBits_u2dVKZWuLQ) {
        return Long.numberOfTrailingZeros($this$countTrailingZeroBits_u2dVKZWuLQ);
    }

    /* renomeado de: takeHighestOneBit-VKZWuLQ, motivo: nome Java inválido */
    private static final long m1147takeHighestOneBitVKZWuLQ(long $this$takeHighestOneBit_u2dVKZWuLQ) {
        return ULong.m1054constructorimpl(Long.highestOneBit($this$takeHighestOneBit_u2dVKZWuLQ));
    }

    /* renomeado de: takeLowestOneBit-VKZWuLQ, motivo: nome Java inválido */
    private static final long m1151takeLowestOneBitVKZWuLQ(long $this$takeLowestOneBit_u2dVKZWuLQ) {
        return ULong.m1054constructorimpl(Long.lowestOneBit($this$takeLowestOneBit_u2dVKZWuLQ));
    }

    /* renomeado de: rotateLeft-JSWoG40, motivo: nome Java inválido */
    private static final long m1138rotateLeftJSWoG40(long $this$rotateLeft_u2dJSWoG40, int bitCount) {
        return ULong.m1054constructorimpl(Long.rotateLeft($this$rotateLeft_u2dJSWoG40, bitCount));
    }

    /* renomeado de: rotateRight-JSWoG40, motivo: nome Java inválido */
    private static final long m1142rotateRightJSWoG40(long $this$rotateRight_u2dJSWoG40, int bitCount) {
        return ULong.m1054constructorimpl(Long.rotateRight($this$rotateRight_u2dJSWoG40, bitCount));
    }

    /* renomeado de: countOneBits-7apg3OU, motivo: nome Java inválido */
    private static final int m1130countOneBits7apg3OU(byte $this$countOneBits_u2d7apg3OU) {
        return Integer.bitCount(UInt.m975constructorimpl($this$countOneBits_u2d7apg3OU & 255));
    }

    /* renomeado de: countLeadingZeroBits-7apg3OU, motivo: nome Java inválido */
    private static final int m1126countLeadingZeroBits7apg3OU(byte $this$countLeadingZeroBits_u2d7apg3OU) {
        return Integer.numberOfLeadingZeros($this$countLeadingZeroBits_u2d7apg3OU & 255) - 24;
    }

    /* renomeado de: countTrailingZeroBits-7apg3OU, motivo: nome Java inválido */
    private static final int m1134countTrailingZeroBits7apg3OU(byte $this$countTrailingZeroBits_u2d7apg3OU) {
        return Integer.numberOfTrailingZeros($this$countTrailingZeroBits_u2d7apg3OU | 256);
    }

    /* renomeado de: takeHighestOneBit-7apg3OU, motivo: nome Java inválido */
    private static final byte m1146takeHighestOneBit7apg3OU(byte $this$takeHighestOneBit_u2d7apg3OU) {
        return UByte.m898constructorimpl((byte) Integer.highestOneBit($this$takeHighestOneBit_u2d7apg3OU & 255));
    }

    /* renomeado de: takeLowestOneBit-7apg3OU, motivo: nome Java inválido */
    private static final byte m1150takeLowestOneBit7apg3OU(byte $this$takeLowestOneBit_u2d7apg3OU) {
        return UByte.m898constructorimpl((byte) Integer.lowestOneBit($this$takeLowestOneBit_u2d7apg3OU & 255));
    }

    /* renomeado de: rotateLeft-LxnNnR4, motivo: nome Java inválido */
    private static final byte m1139rotateLeftLxnNnR4(byte $this$rotateLeft_u2dLxnNnR4, int bitCount) {
        return UByte.m898constructorimpl(NumbersKt.rotateLeft($this$rotateLeft_u2dLxnNnR4, bitCount));
    }

    /* renomeado de: rotateRight-LxnNnR4, motivo: nome Java inválido */
    private static final byte m1143rotateRightLxnNnR4(byte $this$rotateRight_u2dLxnNnR4, int bitCount) {
        return UByte.m898constructorimpl(NumbersKt.rotateRight($this$rotateRight_u2dLxnNnR4, bitCount));
    }

    /* renomeado de: countOneBits-xj2QHRw, motivo: nome Java inválido */
    private static final int m1133countOneBitsxj2QHRw(short $this$countOneBits_u2dxj2QHRw) {
        return Integer.bitCount(UInt.m975constructorimpl(65535 & $this$countOneBits_u2dxj2QHRw));
    }

    /* renomeado de: countLeadingZeroBits-xj2QHRw, motivo: nome Java inválido */
    private static final int m1129countLeadingZeroBitsxj2QHRw(short $this$countLeadingZeroBits_u2dxj2QHRw) {
        return Integer.numberOfLeadingZeros(65535 & $this$countLeadingZeroBits_u2dxj2QHRw) - 16;
    }

    /* renomeado de: countTrailingZeroBits-xj2QHRw, motivo: nome Java inválido */
    private static final int m1137countTrailingZeroBitsxj2QHRw(short $this$countTrailingZeroBits_u2dxj2QHRw) {
        return Integer.numberOfTrailingZeros(65536 | $this$countTrailingZeroBits_u2dxj2QHRw);
    }

    /* renomeado de: takeHighestOneBit-xj2QHRw, motivo: nome Java inválido */
    private static final short m1149takeHighestOneBitxj2QHRw(short $this$takeHighestOneBit_u2dxj2QHRw) {
        return UShort.m1161constructorimpl((short) Integer.highestOneBit(65535 & $this$takeHighestOneBit_u2dxj2QHRw));
    }

    /* renomeado de: takeLowestOneBit-xj2QHRw, motivo: nome Java inválido */
    private static final short m1153takeLowestOneBitxj2QHRw(short $this$takeLowestOneBit_u2dxj2QHRw) {
        return UShort.m1161constructorimpl((short) Integer.lowestOneBit(65535 & $this$takeLowestOneBit_u2dxj2QHRw));
    }

    /* renomeado de: rotateLeft-olVBNx4, motivo: nome Java inválido */
    private static final short m1141rotateLeftolVBNx4(short $this$rotateLeft_u2dolVBNx4, int bitCount) {
        return UShort.m1161constructorimpl(NumbersKt.rotateLeft($this$rotateLeft_u2dolVBNx4, bitCount));
    }

    /* renomeado de: rotateRight-olVBNx4, motivo: nome Java inválido */
    private static final short m1145rotateRightolVBNx4(short $this$rotateRight_u2dolVBNx4, int bitCount) {
        return UShort.m1161constructorimpl(NumbersKt.rotateRight($this$rotateRight_u2dolVBNx4, bitCount));
    }
}
