package org.jni_zero;

/* carregado de: classes17.dex */
public class NativeLibraryLoadedStatus {
    private static NativeLibraryLoadedStatusProvider sProvider;

    public interface NativeLibraryLoadedStatusProvider {
        boolean areNativeMethodsReady();
    }

    public static class NativeNotLoadedException extends RuntimeException {
        public NativeNotLoadedException(String s) {
            super(s);
        }
    }

    public static void checkLoaded() {
        if (sProvider != null && !sProvider.areNativeMethodsReady()) {
            throw new NativeNotLoadedException("Native method called before the native library was ready.");
        }
    }

    public static void setProvider(NativeLibraryLoadedStatusProvider statusProvider) {
        sProvider = statusProvider;
    }

    public static NativeLibraryLoadedStatusProvider getProviderForTesting() {
        return sProvider;
    }
}
