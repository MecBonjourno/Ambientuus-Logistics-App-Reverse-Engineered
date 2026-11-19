package org.chromium.net.httpflags;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.ResolveInfo;
import android.os.Build;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import org.chromium.base.Log;
import org.chromium.net.impl.CronetManifest;

/* carregado de: classes17.dex */
public final class HttpFlagsLoader {
    static final String FLAGS_FILE_DIR_NAME = "app_httpflags";
    static final String FLAGS_FILE_NAME = "flags.binarypb";
    static final String FLAGS_FILE_PROVIDER_INTENT_ACTION = "android.net.http.FLAGS_FILE_PROVIDER";
    private static final String TAG = "HttpFlagsLoader";

    private HttpFlagsLoader() {
    }

    public static Flags load(Context context) {
        if (!CronetManifest.shouldReadHttpFlags(context)) {
            Log.d(TAG, "Not loading HTTP flags because they are disabled in the manifest", new Object[0]);
            return null;
        }
        try {
            ApplicationInfo providerApplicationInfo = getProviderApplicationInfo(context);
            if (providerApplicationInfo == null) {
                return null;
            }
            Log.d(TAG, "Found application exporting HTTP flags: %s", providerApplicationInfo.packageName);
            File flagsFile = getFlagsFileFromProvider(context, providerApplicationInfo);
            Log.d(TAG, "HTTP flags file path: %s", flagsFile.getAbsolutePath());
            Flags flags = loadFlagsFile(flagsFile);
            if (flags == null) {
                return null;
            }
            Log.d(TAG, "Successfully loaded HTTP flags: %s", flags);
            return flags;
        } catch (RuntimeException exception) {
            Log.e(TAG, "Unable to load HTTP flags file", (Throwable) exception);
            return null;
        }
    }

    private static ApplicationInfo getProviderApplicationInfo(Context context) {
        ResolveInfo resolveInfo = context.getPackageManager().resolveService(new Intent(FLAGS_FILE_PROVIDER_INTENT_ACTION), 1048576);
        if (resolveInfo == null) {
            Log.w(TAG, "Unable to resolve the HTTP flags file provider package. This is expected if the host system is not set up to provide HTTP flags.");
            return null;
        }
        return resolveInfo.serviceInfo.applicationInfo;
    }

    private static File getFlagsFileFromProvider(Context context, ApplicationInfo providerApplicationInfo) {
        String str;
        if (Build.VERSION.SDK_INT >= 24) {
            str = providerApplicationInfo.deviceProtectedDataDir;
        } else {
            str = providerApplicationInfo.dataDir;
        }
        return new File(new File(new File(str), FLAGS_FILE_DIR_NAME), FLAGS_FILE_NAME);
    }

    private static Flags loadFlagsFile(File file) {
        try {
            FileInputStream fileInputStream = new FileInputStream(file);
            try {
                Flags parseDelimitedFrom = Flags.parseDelimitedFrom(fileInputStream);
                fileInputStream.close();
                return parseDelimitedFrom;
            } catch (Throwable th) {
                try {
                    fileInputStream.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
                throw th;
            }
        } catch (FileNotFoundException e) {
            Log.w(TAG, "HTTP flags file `%s` is missing. This is expected if HTTP flags functionality is currently disabled in the host system.", file.getPath());
            return null;
        } catch (IOException exception) {
            throw new RuntimeException("Unable to read HTTP flags file", exception);
        }
    }
}
