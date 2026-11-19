package j$.sun.nio.cs;

/* carregado de: classes15.dex */
public interface ArrayEncoder {
    int encode(char[] cArr, int i, int i2, byte[] bArr);

    int encodeFromLatin1(byte[] bArr, int i, int i2, byte[] bArr2);

    int encodeFromUTF16(byte[] bArr, int i, int i2, byte[] bArr2);

    boolean isASCIICompatible();

    /* renomeado de: j$.sun.nio.cs.ArrayEncoder$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static int $default$encodeFromLatin1(ArrayEncoder _this, byte[] src, int sp, int len, byte[] dst) {
            return -1;
        }

        public static int $default$encodeFromUTF16(ArrayEncoder _this, byte[] src, int sp, int len, byte[] dst) {
            return -1;
        }

        public static boolean $default$isASCIICompatible(ArrayEncoder _this) {
            return false;
        }
    }
}
