package androidx.camera.video.internal.utils;

import android.os.StatFs;
import androidx.camera.video.AudioStats;
import androidx.constraintlayout.widget.ConstraintLayout;
import java.io.File;
import java.io.FileNotFoundException;
import java.text.DecimalFormat;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;

/* compiled from: StorageUtil.kt */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0007J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u0005H\u0007J\u0010\u0010\u000b\u001a\u00020\u00072\u0006\u0010\f\u001a\u00020\rH\u0007J\u0010\u0010\u000e\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u0007H\u0007J\u0014\u0010\u0010\u001a\u00020\u00112\n\u0010\u0012\u001a\u00060\u0013j\u0002`\u0014H\u0007R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0015"}, d2 = {"Landroidx/camera/video/internal/utils/StorageUtil;", "", "<init>", "()V", "TAG", "", "getAvailableBytes", "", "file", "Ljava/io/File;", "path", "getAvailableBytesForMediaStoreUri", "uri", "Landroid/net/Uri;", "formatSize", "bytes", "isStorageFullException", "", "e", "Ljava/lang/Exception;", "Lkotlin/Exception;", "camera-video_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* loaded from: classes.dex */
public final class StorageUtil {
    public static final StorageUtil INSTANCE = new StorageUtil();
    private static final String TAG = "StorageUtil";

    private StorageUtil() {
    }

    @JvmStatic
    public static final long getAvailableBytes(File file) {
        Intrinsics.checkNotNullParameter(file, "file");
        String path = file.getPath();
        Intrinsics.checkNotNullExpressionValue(path, "getPath(...)");
        return getAvailableBytes(path);
    }

    @JvmStatic
    public static final long getAvailableBytes(String path) {
        Intrinsics.checkNotNullParameter(path, "path");
        return new StatFs(path).getAvailableBytes();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0044, code lost:
    
        if (r0.equals("external") == false) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x004d, code lost:
    
        if (r0.equals("external_primary") != false) goto L18;
     */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    @kotlin.jvm.JvmStatic
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final long getAvailableBytesForMediaStoreUri(android.net.Uri r3) {
        /*
            java.lang.String r0 = "uri"
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r3, r0)
            java.lang.String r0 = r3.getScheme()
            java.lang.String r1 = "content"
            boolean r0 = kotlin.jvm.internal.Intrinsics.areEqual(r0, r1)
            if (r0 == 0) goto L7b
            java.util.List r0 = r3.getPathSegments()
            r1 = 0
            java.lang.Object r0 = r0.get(r1)
            java.lang.String r0 = (java.lang.String) r0
            if (r0 == 0) goto L5d
            int r1 = r0.hashCode()
            switch(r1) {
                case -1921573490: goto L47;
                case -1820761141: goto L3e;
                case 570410685: goto L27;
                default: goto L26;
            }
        L26:
            goto L5d
        L27:
            java.lang.String r1 = "internal"
            boolean r0 = r0.equals(r1)
            if (r0 != 0) goto L30
            goto L5d
        L30:
            java.io.File r0 = android.os.Environment.getDataDirectory()
            java.lang.String r1 = "getDataDirectory(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r0, r1)
            long r0 = getAvailableBytes(r0)
            goto L7a
        L3e:
            java.lang.String r1 = "external"
            boolean r0 = r0.equals(r1)
            if (r0 != 0) goto L4f
            goto L5d
        L47:
            java.lang.String r1 = "external_primary"
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L5d
        L4f:
            java.io.File r0 = android.os.Environment.getExternalStorageDirectory()
            java.lang.String r1 = "getExternalStorageDirectory(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r0, r1)
            long r0 = getAvailableBytes(r0)
            goto L7a
        L5d:
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.String r1 = "Unknown MediaStore URI: "
            java.lang.StringBuilder r0 = r0.append(r1)
            java.lang.StringBuilder r0 = r0.append(r3)
            java.lang.String r0 = r0.toString()
            java.lang.String r1 = "StorageUtil"
            androidx.camera.core.Logger.w(r1, r0)
            r0 = 9223372036854775807(0x7fffffffffffffff, double:NaN)
        L7a:
            return r0
        L7b:
            r0 = 0
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "Not a content uri: "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r3)
            java.lang.String r0 = r1.toString()
            java.lang.IllegalStateException r1 = new java.lang.IllegalStateException
            java.lang.String r0 = r0.toString()
            r1.<init>(r0)
            throw r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.video.internal.utils.StorageUtil.getAvailableBytesForMediaStoreUri(android.net.Uri):long");
    }

    @JvmStatic
    public static final String formatSize(long bytes) {
        double d;
        if (!(bytes >= 0)) {
            throw new IllegalArgumentException("Bytes cannot be negative".toString());
        }
        String[] units = {"B", "KB", "MB", "GB", "TB"};
        DecimalFormat decimalFormat = new DecimalFormat("#.##");
        int unitIndex = 0;
        double size = bytes;
        while (true) {
            d = 1024.0d;
            if (size < 1024.0d || unitIndex >= units.length - 1) {
                break;
            }
            size /= 1024.0d;
            unitIndex++;
        }
        if (unitIndex == 0) {
            return decimalFormat.format(size) + ' ' + units[unitIndex];
        }
        StringBuilder result = new StringBuilder();
        double remainingSize = bytes;
        int i = unitIndex;
        while (-1 < i) {
            double unitSize = Math.pow(d, i);
            double unitValue = Math.floor(remainingSize / unitSize);
            if (unitValue > AudioStats.AUDIO_AMPLITUDE_NONE) {
                result.append(decimalFormat.format(unitValue)).append(" ").append(units[i]).append(" ");
                remainingSize -= unitValue * unitSize;
            }
            i--;
            d = 1024.0d;
        }
        return StringsKt.trim(result).toString();
    }

    @JvmStatic
    public static final boolean isStorageFullException(Exception e) {
        Intrinsics.checkNotNullParameter(e, "e");
        if (!(e instanceof FileNotFoundException)) {
            return false;
        }
        String message = e.getMessage();
        return message != null && StringsKt.contains$default((CharSequence) message, (CharSequence) "No space left on device", false, 2, (Object) null);
    }
}
