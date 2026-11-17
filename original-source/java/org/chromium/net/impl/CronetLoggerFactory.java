package org.chromium.net.impl;

import android.content.Context;
import android.os.Build;
import android.util.Log;
import org.chromium.net.impl.CronetLogger;

/* loaded from: classes17.dex */
public final class CronetLoggerFactory {
    private static final String CRONET_LOGGER_IMPL_CLASS = "com.google.net.cronet.telemetry.CronetLoggerImpl";
    private static final int SAMPLE_RATE_PER_SECOND = 1;
    private static final String TAG = CronetLoggerFactory.class.getSimpleName();
    private static final CronetLogger sDefaultLogger = new NoOpLogger();
    private static CronetLogger sTestingLogger;

    private CronetLoggerFactory() {
    }

    public static CronetLogger createNoOpLogger() {
        return sDefaultLogger;
    }

    public static CronetLogger createLogger(Context ctx, CronetLogger.CronetSource source) {
        if (sTestingLogger != null) {
            return sTestingLogger;
        }
        if (!CronetManifest.isAppOptedInForTelemetry(ctx, source) || Build.VERSION.SDK_INT < 30) {
            return sDefaultLogger;
        }
        Class<? extends CronetLogger> cronetLoggerImplClass = fetchLoggerImplClass();
        if (cronetLoggerImplClass == null) {
            return sDefaultLogger;
        }
        try {
            return cronetLoggerImplClass.getConstructor(Integer.TYPE).newInstance(1);
        } catch (Exception e) {
            Log.e(TAG, "Exception creating an instance of CronetLoggerImpl", e);
            return sDefaultLogger;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void setLoggerForTesting(CronetLogger testingLogger) {
        sTestingLogger = testingLogger;
    }

    public static class SwapLoggerForTesting implements AutoCloseable {
        public SwapLoggerForTesting(CronetLogger testLogger) {
            CronetLoggerFactory.setLoggerForTesting(testLogger);
        }

        @Override // java.lang.AutoCloseable
        public void close() {
            CronetLoggerFactory.setLoggerForTesting(null);
        }
    }

    private static Class<? extends CronetLogger> fetchLoggerImplClass() {
        ClassLoader loader = CronetLoggerFactory.class.getClassLoader();
        try {
            return loader.loadClass(CRONET_LOGGER_IMPL_CLASS).asSubclass(CronetLogger.class);
        } catch (Exception e) {
            Log.e(TAG, "Exception fetching LoggerImpl class", e);
            return null;
        }
    }
}
