package j$.util.stream;

import java.security.AccessController;
import java.security.PrivilegedAction;

/* carregado de: classes15.dex */
final class Tripwire {
    static final boolean ENABLED = ((Boolean) AccessController.doPrivileged(new PrivilegedAction() { // da classe: j$.util.stream.Tripwire$$ExternalSyntheticLambda0
        @Override // java.security.PrivilegedAction
        public final Object run() {
            Boolean valueOf;
            valueOf = Boolean.valueOf(Boolean.getBoolean(Tripwire.TRIPWIRE_PROPERTY));
            return valueOf;
        }
    })).booleanValue();
    private static final String TRIPWIRE_PROPERTY = "org.openjdk.java.util.stream.tripwire";

    private Tripwire() {
    }

    static void trip(Class<?> trippingClass, String msg) {
        throw new UnsupportedOperationException(trippingClass + " tripwire tripped but logging not supported: " + msg);
    }
}
