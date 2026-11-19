package org.chromium.net;

import android.content.Context;
import android.util.Log;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import j$.util.DesugarCollections;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import org.chromium.net.CronetEngine;

/* carregado de: classes17.dex */
public abstract class CronetProvider {
    private static final String GMS_CORE_CRONET_PROVIDER_CLASS = "com.google.android.gms.net.GmsCoreCronetProvider";
    private static final String JAVA_CRONET_PROVIDER_CLASS = "org.chromium.net.impl.JavaCronetProvider";
    private static final String NATIVE_CRONET_PROVIDER_CLASS = "org.chromium.net.impl.NativeCronetProvider";
    private static final String PLAY_SERVICES_CRONET_PROVIDER_CLASS = "com.google.android.gms.net.PlayServicesCronetProvider";
    public static final String PROVIDER_NAME_APP_PACKAGED = "App-Packaged-Cronet-Provider";
    public static final String PROVIDER_NAME_FALLBACK = "Fallback-Cronet-Provider";
    private static final String RES_KEY_CRONET_IMPL_CLASS = "CronetProviderClassName";
    private static final String TAG = CronetProvider.class.getSimpleName();
    protected final Context mContext;

    public abstract CronetEngine.Builder createBuilder();

    public abstract String getName();

    public abstract String getVersion();

    public abstract boolean isEnabled();

    protected CronetProvider(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("Context must not be null");
        }
        this.mContext = context;
    }

    public String toString() {
        return "[class=" + getClass().getName() + ", name=" + getName() + ", version=" + getVersion() + ", enabled=" + isEnabled() + "]";
    }

    public static List<CronetProvider> getAllProviders(Context context) {
        Set<CronetProvider> providers = new LinkedHashSet<>();
        addCronetProviderFromResourceFile(context, providers);
        addCronetProviderImplByClassName(context, PLAY_SERVICES_CRONET_PROVIDER_CLASS, providers, false);
        addCronetProviderImplByClassName(context, GMS_CORE_CRONET_PROVIDER_CLASS, providers, false);
        addCronetProviderImplByClassName(context, NATIVE_CRONET_PROVIDER_CLASS, providers, false);
        addCronetProviderImplByClassName(context, JAVA_CRONET_PROVIDER_CLASS, providers, false);
        return DesugarCollections.unmodifiableList(new ArrayList(providers));
    }

    private static boolean addCronetProviderImplByClassName(Context context, String className, Set<CronetProvider> providers, boolean logError) {
        ClassLoader loader = context.getClassLoader();
        try {
            Constructor<? extends CronetProvider> ctor = loader.loadClass(className).asSubclass(CronetProvider.class).getConstructor(Context.class);
            providers.add((CronetProvider) ctor.newInstance(context));
            return true;
        } catch (ClassNotFoundException e) {
            logReflectiveOperationException(className, logError, e);
            return false;
        } catch (IllegalAccessException e2) {
            logReflectiveOperationException(className, logError, e2);
            return false;
        } catch (InstantiationException e3) {
            logReflectiveOperationException(className, logError, e3);
            return false;
        } catch (NoSuchMethodException e4) {
            logReflectiveOperationException(className, logError, e4);
            return false;
        } catch (InvocationTargetException e5) {
            logReflectiveOperationException(className, logError, e5);
            return false;
        }
    }

    private static void logReflectiveOperationException(String className, boolean logError, Exception e) {
        if (logError) {
            Log.e(TAG, "Unable to load provider class: " + className, e);
        } else if (Log.isLoggable(TAG, 3)) {
            Log.d(TAG, "Tried to load " + className + " provider class but it wasn't included in the app classpath");
        }
    }

    private static boolean addCronetProviderFromResourceFile(Context context, Set<CronetProvider> providers) {
        String className;
        int resId = context.getResources().getIdentifier(RES_KEY_CRONET_IMPL_CLASS, TypedValues.Custom.S_STRING, context.getPackageName());
        if (resId == 0 || (className = context.getResources().getString(resId)) == null || className.equals(PLAY_SERVICES_CRONET_PROVIDER_CLASS) || className.equals(GMS_CORE_CRONET_PROVIDER_CLASS) || className.equals(JAVA_CRONET_PROVIDER_CLASS) || className.equals(NATIVE_CRONET_PROVIDER_CLASS)) {
            return false;
        }
        if (!addCronetProviderImplByClassName(context, className, providers, true)) {
            Log.e(TAG, "Unable to instantiate Cronet implementation class " + className + " that is listed as in the app string resource file under CronetProviderClassName key");
        }
        return true;
    }
}
