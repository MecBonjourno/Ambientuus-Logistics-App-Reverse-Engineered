package androidx.camera.video.internal.utils;

import java.io.File;

/* loaded from: classes.dex */
public final class OutputUtil {
    private static final String TAG = "OutputUtil";

    private OutputUtil() {
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:30:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String getAbsolutePathFromUri(android.content.ContentResolver r9, android.net.Uri r10, java.lang.String r11) {
        /*
            r1 = 0
            r2 = 0
            java.lang.String[] r0 = new java.lang.String[]{r11}     // Catch: java.lang.Throwable -> L2e java.lang.RuntimeException -> L33
            r5 = r0
            r7 = 0
            r8 = 0
            r6 = 0
            r3 = r9
            r4 = r10
            android.database.Cursor r9 = r3.query(r4, r5, r6, r7, r8)     // Catch: java.lang.RuntimeException -> L2b java.lang.Throwable -> L5a
            r1 = r9
            if (r1 != 0) goto L1a
        L14:
            if (r1 == 0) goto L19
            r1.close()
        L19:
            return r2
        L1a:
            int r9 = r1.getColumnIndexOrThrow(r11)     // Catch: java.lang.RuntimeException -> L2b java.lang.Throwable -> L5a
            r1.moveToFirst()     // Catch: java.lang.RuntimeException -> L2b java.lang.Throwable -> L5a
            java.lang.String r10 = r1.getString(r9)     // Catch: java.lang.RuntimeException -> L2b java.lang.Throwable -> L5a
            if (r1 == 0) goto L2a
            r1.close()
        L2a:
            return r10
        L2b:
            r0 = move-exception
            r9 = r0
            goto L37
        L2e:
            r0 = move-exception
            r3 = r9
            r4 = r10
            r9 = r0
            goto L5c
        L33:
            r0 = move-exception
            r3 = r9
            r4 = r10
            r9 = r0
        L37:
            java.lang.String r10 = "OutputUtil"
            java.lang.String r0 = "Failed in getting absolute path for Uri %s with Exception %s"
            java.lang.String r5 = r4.toString()     // Catch: java.lang.Throwable -> L5a
            java.lang.String r6 = r9.toString()     // Catch: java.lang.Throwable -> L5a
            r7 = 2
            java.lang.Object[] r7 = new java.lang.Object[r7]     // Catch: java.lang.Throwable -> L5a
            r8 = 0
            r7[r8] = r5     // Catch: java.lang.Throwable -> L5a
            r5 = 1
            r7[r5] = r6     // Catch: java.lang.Throwable -> L5a
            java.lang.String r0 = java.lang.String.format(r0, r7)     // Catch: java.lang.Throwable -> L5a
            androidx.camera.core.Logger.e(r10, r0)     // Catch: java.lang.Throwable -> L5a
            if (r1 == 0) goto L59
            r1.close()
        L59:
            return r2
        L5a:
            r0 = move-exception
            r9 = r0
        L5c:
            if (r1 == 0) goto L61
            r1.close()
        L61:
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.video.internal.utils.OutputUtil.getAbsolutePathFromUri(android.content.ContentResolver, android.net.Uri, java.lang.String):java.lang.String");
    }

    public static boolean createParentFolder(File file) {
        File parentFile = file.getParentFile();
        if (parentFile == null) {
            return false;
        }
        return parentFile.exists() ? parentFile.isDirectory() : parentFile.mkdirs();
    }
}
