package androidx.camera.core.impl.utils;

import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Build;
import j$.util.Objects;

/* loaded from: classes.dex */
public final class ContextUtil {
    public static Context getApplicationContext(Context context) {
        Context resultContext = context.getApplicationContext();
        if (Build.VERSION.SDK_INT >= 34) {
            int deviceIdContext = Api34Impl.getDeviceId(context);
            int deviceIdResultContext = Api34Impl.getDeviceId(resultContext);
            if (deviceIdContext != deviceIdResultContext) {
                resultContext = Api34Impl.createDeviceContext(resultContext, deviceIdContext);
            }
        }
        if (Build.VERSION.SDK_INT >= 30) {
            String attributeTagContext = Api30Impl.getAttributionTag(context);
            String attributeTagResultContext = Api30Impl.getAttributionTag(resultContext);
            if (!Objects.equals(attributeTagContext, attributeTagResultContext)) {
                return Api30Impl.createAttributionContext(resultContext, attributeTagContext);
            }
            return resultContext;
        }
        return resultContext;
    }

    public static Application getApplicationFromContext(Context context) {
        for (Context appContext = getApplicationContext(context); appContext instanceof ContextWrapper; appContext = ((ContextWrapper) appContext).getBaseContext()) {
            if (appContext instanceof Application) {
                Application application = (Application) appContext;
                return application;
            }
        }
        return null;
    }

    private ContextUtil() {
    }

    private static class Api30Impl {
        private Api30Impl() {
        }

        static Context createAttributionContext(Context context, String attributeTag) {
            return context.createAttributionContext(attributeTag);
        }

        static String getAttributionTag(Context context) {
            return context.getAttributionTag();
        }
    }

    private static class Api34Impl {
        private Api34Impl() {
        }

        static Context createDeviceContext(Context context, int deviceId) {
            return context.createDeviceContext(deviceId);
        }

        static int getDeviceId(Context context) {
            return context.getDeviceId();
        }
    }
}
