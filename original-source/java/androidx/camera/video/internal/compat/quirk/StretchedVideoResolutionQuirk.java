package androidx.camera.video.internal.compat.quirk;

import android.os.Build;
import android.util.Size;
import androidx.camera.core.impl.Quirk;

/* loaded from: classes.dex */
public class StretchedVideoResolutionQuirk implements Quirk {
    static boolean load() {
        return isMotoE5Play();
    }

    private static boolean isMotoE5Play() {
        return "motorola".equalsIgnoreCase(Build.BRAND) && "moto e5 play".equalsIgnoreCase(Build.MODEL);
    }

    public Size getAlternativeResolution(int quality) {
        switch (quality) {
            case 4:
                return new Size(640, 480);
            case 5:
                return new Size(960, 720);
            case 6:
                return new Size(1440, 1080);
            default:
                return null;
        }
    }
}
