package androidx.camera.view.internal.compat.quirk;

import androidx.camera.core.impl.Quirk;
import androidx.camera.core.impl.QuirkSettings;
import java.util.ArrayList;
import java.util.List;

/* carregado de: classes.dex */
public class DeviceQuirksLoader {
    private DeviceQuirksLoader() {
    }

    static List<Quirk> loadQuirks(QuirkSettings quirkSettings) {
        List<Quirk> quirks = new ArrayList<>();
        if (quirkSettings.shouldEnableQuirk(SurfaceViewStretchedQuirk.class, SurfaceViewStretchedQuirk.load())) {
            quirks.add(new SurfaceViewStretchedQuirk());
        }
        if (quirkSettings.shouldEnableQuirk(SurfaceViewNotCroppedByParentQuirk.class, SurfaceViewNotCroppedByParentQuirk.load())) {
            quirks.add(new SurfaceViewNotCroppedByParentQuirk());
        }
        return quirks;
    }
}
