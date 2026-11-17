package j$.sun.nio.cs;

/* loaded from: classes15.dex */
public interface ArrayDecoder {
    int decode(byte[] bArr, int i, int i2, char[] cArr);

    boolean isASCIICompatible();

    /* renamed from: j$.sun.nio.cs.ArrayDecoder$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static boolean $default$isASCIICompatible(ArrayDecoder _this) {
            return false;
        }
    }
}
