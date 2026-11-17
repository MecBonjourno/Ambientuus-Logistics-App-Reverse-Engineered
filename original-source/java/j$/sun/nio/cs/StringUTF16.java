package j$.sun.nio.cs;

import j$.sun.misc.DesugarUnsafe;

/* loaded from: classes15.dex */
class StringUTF16 {
    private static final DesugarUnsafe unsafe = DesugarUnsafe.getUnsafe();

    StringUTF16() {
    }

    public static char getChar(byte[] val, int index) {
        return unsafe.getChar(val, DesugarUnsafe.ARRAY_BYTE_BASE_OFFSET + (DesugarUnsafe.ARRAY_BYTE_INDEX_SCALE * index * 2));
    }
}
