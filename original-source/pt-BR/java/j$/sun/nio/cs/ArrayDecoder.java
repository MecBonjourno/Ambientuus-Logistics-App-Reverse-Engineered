package j$.sun.nio.cs;

/* carregado de: classes15.dex */
public interface ArrayDecoder {
    int decode(byte[] bArr, int i, int i2, char[] cArr);

    boolean isASCIICompatible();

    /* renomeado de: j$.sun.nio.cs.ArrayDecoder$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static boolean $default$isASCIICompatible(ArrayDecoder _this) {
            return false;
        }
    }
}
