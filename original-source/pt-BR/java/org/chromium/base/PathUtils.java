package org.chromium.base;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Build;
import android.os.Environment;
import android.os.storage.StorageManager;
import android.provider.MediaStore;
import android.system.Os;
import android.text.TextUtils;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;
import java.util.concurrent.atomic.AtomicBoolean;
import org.chromium.base.compat.ApiHelperForM;
import org.chromium.base.compat.ApiHelperForQ;
import org.chromium.base.compat.ApiHelperForR;
import org.chromium.base.task.AsyncTask;
import org.chromium.build.annotations.MainDex;

@MainDex
/* carregado de: classes17.dex */
public abstract class PathUtils {
    static final /* sintético */ boolean $assertionsDisabled = false;
    private static final int CACHE_DIRECTORY = 2;
    private static final int DATA_DIRECTORY = 0;
    private static final int NUM_DIRECTORIES = 3;
    private static final String TAG = "PathUtils";
    private static final int THUMBNAIL_DIRECTORY = 1;
    private static final String THUMBNAIL_DIRECTORY_NAME = "textures";
    private static String sCacheDirectoryBasePath;
    private static String sCacheSubDirectory;
    private static String sDataDirectoryBasePath;
    private static String sDataDirectorySuffix;
    private static FutureTask<String[]> sDirPathFetchTask;
    private static final AtomicBoolean sInitializationStarted = new AtomicBoolean();

    private PathUtils() {
    }

    public static void resetForTesting() {
        sInitializationStarted.set(false);
        sDirPathFetchTask = null;
        sDataDirectorySuffix = null;
        sCacheSubDirectory = null;
        sDataDirectoryBasePath = null;
        sCacheDirectoryBasePath = null;
    }

    private static String[] getOrComputeDirectoryPaths() {
        if (!sDirPathFetchTask.isDone()) {
            StrictModeContext ignored = StrictModeContext.allowDiskWrites();
            try {
                sDirPathFetchTask.run();
                if (ignored != null) {
                    ignored.close();
                }
            } catch (Throwable th) {
                if (ignored != null) {
                    try {
                        ignored.close();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                }
                throw th;
            }
        }
        try {
            return sDirPathFetchTask.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private static void chmod(String path, int mode) {
        try {
            Os.chmod(path, mode);
        } catch (Exception e) {
            Log.e(TAG, "Failed to set permissions for path \"" + path + "\"");
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static String[] setPrivateDirectoryPathInternal() {
        File dataDir;
        File thumbnailDir;
        File cacheDir;
        String[] paths = new String[3];
        Context appContext = ContextUtils.getApplicationContext();
        if (sDataDirectoryBasePath == null) {
            dataDir = appContext.getDir(sDataDirectorySuffix, 0);
            thumbnailDir = appContext.getDir(THUMBNAIL_DIRECTORY_NAME, 0);
        } else {
            dataDir = new File(sDataDirectoryBasePath, sDataDirectorySuffix);
            dataDir.mkdirs();
            thumbnailDir = new File(sDataDirectoryBasePath, THUMBNAIL_DIRECTORY_NAME);
            thumbnailDir.mkdirs();
        }
        if (sCacheDirectoryBasePath != null) {
            cacheDir = new File(sCacheDirectoryBasePath);
        } else {
            cacheDir = appContext.getCacheDir();
        }
        if (cacheDir != null) {
            if (sCacheSubDirectory != null) {
                cacheDir = new File(cacheDir, sCacheSubDirectory);
            }
            if (sCacheDirectoryBasePath != null || sCacheSubDirectory != null) {
                cacheDir.mkdirs();
                chmod(cacheDir.getPath(), 1472);
            }
            paths[2] = cacheDir.getPath();
        }
        paths[0] = dataDir.getPath();
        chmod(paths[0], 448);
        paths[1] = thumbnailDir.getPath();
        return paths;
    }

    public static void setPrivateDirectoryPath(String dataBasePath, String cacheBasePath, String dataDirSuffix, String cacheSubDir) {
        if (!sInitializationStarted.getAndSet(true)) {
            if (ContextUtils.getApplicationContext() == null) {
                throw new AssertionError();
            }
            sDataDirectoryBasePath = dataBasePath;
            sCacheDirectoryBasePath = cacheBasePath;
            sDataDirectorySuffix = dataDirSuffix;
            sCacheSubDirectory = cacheSubDir;
            sDirPathFetchTask = new FutureTask<>(new Callable() { // da classe: org.chromium.base.PathUtils$$ExternalSyntheticLambda0
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    String[] privateDirectoryPathInternal;
                    privateDirectoryPathInternal = PathUtils.setPrivateDirectoryPathInternal();
                    return privateDirectoryPathInternal;
                }
            });
            AsyncTask.THREAD_POOL_EXECUTOR.execute(sDirPathFetchTask);
            return;
        }
        if (!TextUtils.equals(sDataDirectoryBasePath, dataBasePath)) {
            throw new AssertionError(String.format("%s != %s", dataBasePath, sDataDirectoryBasePath));
        }
        if (!TextUtils.equals(sCacheDirectoryBasePath, cacheBasePath)) {
            throw new AssertionError(String.format("%s != %s", cacheBasePath, sCacheDirectoryBasePath));
        }
        if (!TextUtils.equals(sDataDirectorySuffix, dataDirSuffix)) {
            throw new AssertionError(String.format("%s != %s", dataDirSuffix, sDataDirectorySuffix));
        }
        if (!TextUtils.equals(sCacheSubDirectory, cacheSubDir)) {
            throw new AssertionError(String.format("%s != %s", cacheSubDir, sCacheSubDirectory));
        }
    }

    public static void setPrivateDataDirectorySuffix(String suffix, String cacheSubDir) {
        setPrivateDirectoryPath(null, null, suffix, cacheSubDir);
    }

    public static void setPrivateDataDirectorySuffix(String suffix) {
        setPrivateDataDirectorySuffix(suffix, null);
    }

    private static String getDirectoryPath(int index) {
        String[] paths = getOrComputeDirectoryPaths();
        return paths[index];
    }

    public static String getDataDirectory() {
        if (sDirPathFetchTask == null) {
            throw new AssertionError("setDataDirectorySuffix must be called first.");
        }
        return getDirectoryPath(0);
    }

    public static String getCacheDirectory() {
        if (sDirPathFetchTask == null) {
            throw new AssertionError("setDataDirectorySuffix must be called first.");
        }
        return getDirectoryPath(2);
    }

    public static String getThumbnailCacheDirectory() {
        if (sDirPathFetchTask == null) {
            throw new AssertionError("setDataDirectorySuffix must be called first.");
        }
        return getDirectoryPath(1);
    }

    public static String getDownloadsDirectory() {
        StrictModeContext ignored = StrictModeContext.allowDiskReads();
        try {
            if (Build.VERSION.SDK_INT >= 29) {
                String[] dirs = getAllPrivateDownloadsDirectories();
                if (dirs == null) {
                    throw new AssertionError();
                }
                String str = dirs.length == 0 ? "" : dirs[0];
                if (ignored != null) {
                    ignored.close();
                }
                return str;
            }
            String path = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS).getPath();
            if (ignored != null) {
                ignored.close();
            }
            return path;
        } catch (Throwable th) {
            if (ignored != null) {
                try {
                    ignored.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    public static String[] getAllPrivateDownloadsDirectories() {
        List<File> files = new ArrayList<>();
        StrictModeContext ignored = StrictModeContext.allowDiskWrites();
        try {
            File[] externalDirs = ContextUtils.getApplicationContext().getExternalFilesDirs(Environment.DIRECTORY_DOWNLOADS);
            List<File> files2 = externalDirs == null ? files : Arrays.asList(externalDirs);
            if (ignored != null) {
                ignored.close();
            }
            return toAbsolutePathStrings(files2);
        } catch (Throwable th) {
            if (ignored != null) {
                try {
                    ignored.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    public static String[] getExternalDownloadVolumesNames() {
        ArrayList<File> files = new ArrayList<>();
        Set<String> volumes = ApiHelperForQ.getExternalVolumeNames(ContextUtils.getApplicationContext());
        for (String vol : volumes) {
            if (!TextUtils.isEmpty(vol) && !vol.contains("external_primary")) {
                StorageManager manager = (StorageManager) ApiHelperForM.getSystemService(ContextUtils.getApplicationContext(), StorageManager.class);
                File volumeDir = ApiHelperForR.getVolumeDir(manager, MediaStore.Files.getContentUri(vol));
                File volumeDownloadDir = new File(volumeDir, Environment.DIRECTORY_DOWNLOADS);
                if (!volumeDownloadDir.isDirectory()) {
                    Log.w(TAG, "Download dir missing: %s, parent dir:%s, isDirectory:%s", volumeDownloadDir.getAbsolutePath(), volumeDir.getAbsolutePath(), Boolean.valueOf(volumeDir.isDirectory()));
                }
                files.add(volumeDownloadDir);
            }
        }
        return toAbsolutePathStrings(files);
    }

    private static String[] toAbsolutePathStrings(List<File> files) {
        ArrayList<String> absolutePaths = new ArrayList<>();
        for (File file : files) {
            if (file != null && !TextUtils.isEmpty(file.getAbsolutePath())) {
                absolutePaths.add(file.getAbsolutePath());
            }
        }
        return (String[]) absolutePaths.toArray(new String[absolutePaths.size()]);
    }

    private static String getNativeLibraryDirectory() {
        ApplicationInfo ai = ContextUtils.getApplicationContext().getApplicationInfo();
        if ((ai.flags & 128) != 0 || (ai.flags & 1) == 0) {
            return ai.nativeLibraryDir;
        }
        return "/system/lib/";
    }

    public static String getExternalStorageDirectory() {
        return Environment.getExternalStorageDirectory().getAbsolutePath();
    }
}
