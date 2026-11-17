package org.chromium.base;

import android.os.StrictMode;
import java.util.TimeZone;
import org.chromium.base.annotations.JNINamespace;
import org.chromium.build.annotations.MainDex;

@JNINamespace("base::android")
@MainDex
/* loaded from: classes17.dex */
class TimezoneUtils {
    private TimezoneUtils() {
    }

    private static String getDefaultTimeZoneId() {
        StrictMode.ThreadPolicy oldPolicy = StrictMode.allowThreadDiskReads();
        String timezoneID = TimeZone.getDefault().getID();
        StrictMode.setThreadPolicy(oldPolicy);
        return timezoneID;
    }
}
