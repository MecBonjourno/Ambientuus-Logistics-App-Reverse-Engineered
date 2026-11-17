package androidx.camera.camera2.internal.compat.workaround;

import android.util.Size;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.constraintlayout.widget.ConstraintLayout;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: SizeFilteredEncoderProfilesProvider.kt */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010%\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u0012\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\nH\u0016J\u0012\u0010\u000f\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u000e\u001a\u00020\nH\u0016J\u0010\u0010\u0010\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u000bH\u0002J\u0018\u0010\u0012\u001a\u0004\u0018\u00010\u000b2\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\n0\u0004H\u0002R\u000e\u0010\u0002\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u001c\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\n\u0012\u0006\u0012\u0004\u0018\u00010\u000b0\tX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0014"}, d2 = {"Landroidx/camera/camera2/internal/compat/workaround/SizeFilteredEncoderProfilesProvider;", "Landroidx/camera/core/impl/EncoderProfilesProvider;", "provider", "supportedSizes", "", "Landroid/util/Size;", "<init>", "(Landroidx/camera/core/impl/EncoderProfilesProvider;Ljava/util/List;)V", "encoderProfilesCache", "", "", "Landroidx/camera/core/impl/EncoderProfilesProxy;", "hasProfile", "", "quality", "getAll", "isResolutionSupported", "profiles", "findFirstAvailableProfile", "qualityOrder", "camera-camera2_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* loaded from: classes.dex */
public final class SizeFilteredEncoderProfilesProvider implements EncoderProfilesProvider {
    private final Map<Integer, EncoderProfilesProxy> encoderProfilesCache;
    private final EncoderProfilesProvider provider;
    private final List<Size> supportedSizes;

    public SizeFilteredEncoderProfilesProvider(EncoderProfilesProvider provider, List<Size> supportedSizes) {
        Intrinsics.checkNotNullParameter(provider, "provider");
        Intrinsics.checkNotNullParameter(supportedSizes, "supportedSizes");
        this.provider = provider;
        this.supportedSizes = supportedSizes;
        this.encoderProfilesCache = new LinkedHashMap();
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public boolean hasProfile(int quality) {
        return getAll(quality) != null;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public EncoderProfilesProxy getAll(int quality) {
        EncoderProfilesProxy encoderProfilesProxy = null;
        if (!this.provider.hasProfile(quality)) {
            return null;
        }
        if (this.encoderProfilesCache.containsKey(Integer.valueOf(quality))) {
            return this.encoderProfilesCache.get(Integer.valueOf(quality));
        }
        EncoderProfilesProxy profiles = this.provider.getAll(quality);
        if (profiles != null && !isResolutionSupported(profiles)) {
            switch (quality) {
                case 0:
                    List<Integer> QUALITY_HIGH_TO_LOW = EncoderProfilesProvider.QUALITY_HIGH_TO_LOW;
                    Intrinsics.checkNotNullExpressionValue(QUALITY_HIGH_TO_LOW, "QUALITY_HIGH_TO_LOW");
                    encoderProfilesProxy = findFirstAvailableProfile(CollectionsKt.reversed(QUALITY_HIGH_TO_LOW));
                    break;
                case 1:
                    List<Integer> QUALITY_HIGH_TO_LOW2 = EncoderProfilesProvider.QUALITY_HIGH_TO_LOW;
                    Intrinsics.checkNotNullExpressionValue(QUALITY_HIGH_TO_LOW2, "QUALITY_HIGH_TO_LOW");
                    encoderProfilesProxy = findFirstAvailableProfile(QUALITY_HIGH_TO_LOW2);
                    break;
            }
            profiles = encoderProfilesProxy;
        }
        this.encoderProfilesCache.put(Integer.valueOf(quality), profiles);
        return profiles;
    }

    private final boolean isResolutionSupported(EncoderProfilesProxy profiles) {
        if (this.supportedSizes.isEmpty() || profiles.getVideoProfiles().isEmpty()) {
            return false;
        }
        EncoderProfilesProxy.VideoProfileProxy videoProfile = profiles.getVideoProfiles().get(0);
        return this.supportedSizes.contains(videoProfile.getResolution());
    }

    private final EncoderProfilesProxy findFirstAvailableProfile(List<Integer> qualityOrder) {
        Iterator<Integer> it = qualityOrder.iterator();
        while (it.hasNext()) {
            int quality = it.next().intValue();
            EncoderProfilesProxy it2 = getAll(quality);
            if (it2 != null) {
                return it2;
            }
        }
        return null;
    }
}
