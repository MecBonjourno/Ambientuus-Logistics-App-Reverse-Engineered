package androidx.camera.core.internal.utils;

/* loaded from: classes.dex */
public final class VideoUtil {
    private static final String TAG = "VideoUtil";

    private VideoUtil() {
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:24:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String getAbsolutePathFromUri(android.content.ContentResolver r9, android.net.Uri r10) {
        /*
            java.lang.String r0 = "_data"
            r1 = 0
            java.lang.String[] r2 = new java.lang.String[]{r0}     // Catch: java.lang.Throwable -> L2d java.lang.RuntimeException -> L32
            r5 = r2
            r7 = 0
            r8 = 0
            r6 = 0
            r3 = r9
            r4 = r10
            android.database.Cursor r9 = r3.query(r4, r5, r6, r7, r8)     // Catch: java.lang.RuntimeException -> L2a java.lang.Throwable -> L5a
            r1 = r9
            java.lang.Object r9 = androidx.core.util.Preconditions.checkNotNull(r1)     // Catch: java.lang.RuntimeException -> L2a java.lang.Throwable -> L5a
            android.database.Cursor r9 = (android.database.Cursor) r9     // Catch: java.lang.RuntimeException -> L2a java.lang.Throwable -> L5a
            r1 = r9
            int r9 = r1.getColumnIndexOrThrow(r0)     // Catch: java.lang.RuntimeException -> L2a java.lang.Throwable -> L5a
            r1.moveToFirst()     // Catch: java.lang.RuntimeException -> L2a java.lang.Throwable -> L5a
            java.lang.String r10 = r1.getString(r9)     // Catch: java.lang.RuntimeException -> L2a java.lang.Throwable -> L5a
            if (r1 == 0) goto L29
            r1.close()
        L29:
            return r10
        L2a:
            r0 = move-exception
            r9 = r0
            goto L36
        L2d:
            r0 = move-exception
            r3 = r9
            r4 = r10
            r9 = r0
            goto L5c
        L32:
            r0 = move-exception
            r3 = r9
            r4 = r10
            r9 = r0
        L36:
            java.lang.String r10 = "VideoUtil"
            java.lang.String r0 = "Failed in getting absolute path for Uri %s with Exception %s"
            java.lang.String r2 = r4.toString()     // Catch: java.lang.Throwable -> L5a
            java.lang.String r5 = r9.toString()     // Catch: java.lang.Throwable -> L5a
            r6 = 2
            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch: java.lang.Throwable -> L5a
            r7 = 0
            r6[r7] = r2     // Catch: java.lang.Throwable -> L5a
            r2 = 1
            r6[r2] = r5     // Catch: java.lang.Throwable -> L5a
            java.lang.String r0 = java.lang.String.format(r0, r6)     // Catch: java.lang.Throwable -> L5a
            androidx.camera.core.Logger.e(r10, r0)     // Catch: java.lang.Throwable -> L5a
            java.lang.String r10 = ""
            if (r1 == 0) goto L59
            r1.close()
        L59:
            return r10
        L5a:
            r0 = move-exception
            r9 = r0
        L5c:
            if (r1 == 0) goto L61
            r1.close()
        L61:
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.core.internal.utils.VideoUtil.getAbsolutePathFromUri(android.content.ContentResolver, android.net.Uri):java.lang.String");
    }
}
