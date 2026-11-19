package org.chromium.net.impl;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.os.Bundle;
import org.chromium.net.impl.CronetLogger;

/* carregado de: classes17.dex */
public final class CronetManifest {
    static final String ENABLE_TELEMETRY_META_DATA_KEY = "android.net.http.EnableTelemetry";
    static final String META_DATA_HOLDER_SERVICE_NAME = "android.net.http.MetaDataHolder";
    public static final String READ_HTTP_FLAGS_META_DATA_KEY = "android.net.http.EXPERIMENTAL_ReadHttpFlags";

    private CronetManifest() {
    }

    public static boolean isAppOptedInForTelemetry(Context context, CronetLogger.CronetSource source) {
        boolean telemetryIsDefaultEnabled = source == CronetLogger.CronetSource.CRONET_SOURCE_PLATFORM || source == CronetLogger.CronetSource.CRONET_SOURCE_PLAY_SERVICES;
        return getMetaData(context).getBoolean(ENABLE_TELEMETRY_META_DATA_KEY, telemetryIsDefaultEnabled);
    }

    public static boolean shouldReadHttpFlags(Context context) {
        return getMetaData(context).getBoolean(READ_HTTP_FLAGS_META_DATA_KEY, false);
    }

    private static Bundle getMetaData(Context context) {
        ServiceInfo serviceInfo;
        try {
            serviceInfo = context.getPackageManager().getServiceInfo(new ComponentName(context, META_DATA_HOLDER_SERVICE_NAME), 787072);
        } catch (PackageManager.NameNotFoundException e) {
            serviceInfo = null;
        }
        return serviceInfo != null ? serviceInfo.metaData : new Bundle();
    }
}
