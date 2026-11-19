package androidx.camera.video;

import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.video.internal.VideoValidatedEncoderProfilesProxy;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* carregado de: classes.dex */
public interface VideoCapabilities {
    public static final VideoCapabilities EMPTY = new VideoCapabilities() { // da classe: androidx.camera.video.VideoCapabilities.1
        @Override // androidx.camera.video.VideoCapabilities
        public /* sintético */ VideoValidatedEncoderProfilesProxy findNearestHigherSupportedEncoderProfilesFor(Size size, DynamicRange dynamicRange) {
            return CC.$default$findNearestHigherSupportedEncoderProfilesFor(this, size, dynamicRange);
        }

        @Override // androidx.camera.video.VideoCapabilities
        public /* sintético */ Quality findNearestHigherSupportedQualityFor(Size size, DynamicRange dynamicRange) {
            return CC.$default$findNearestHigherSupportedQualityFor(this, size, dynamicRange);
        }

        @Override // androidx.camera.video.VideoCapabilities
        public /* sintético */ VideoValidatedEncoderProfilesProxy getProfiles(Quality quality, DynamicRange dynamicRange) {
            return CC.$default$getProfiles(this, quality, dynamicRange);
        }

        @Override // androidx.camera.video.VideoCapabilities
        public /* sintético */ boolean isStabilizationSupported() {
            return CC.$default$isStabilizationSupported(this);
        }

        @Override // androidx.camera.video.VideoCapabilities
        public Set<DynamicRange> getSupportedDynamicRanges() {
            return new HashSet();
        }

        @Override // androidx.camera.video.VideoCapabilities
        public List<Quality> getSupportedQualities(DynamicRange dynamicRange) {
            return new ArrayList();
        }

        @Override // androidx.camera.video.VideoCapabilities
        public boolean isQualitySupported(Quality quality, DynamicRange dynamicRange) {
            return false;
        }
    };

    VideoValidatedEncoderProfilesProxy findNearestHigherSupportedEncoderProfilesFor(Size size, DynamicRange dynamicRange);

    Quality findNearestHigherSupportedQualityFor(Size size, DynamicRange dynamicRange);

    VideoValidatedEncoderProfilesProxy getProfiles(Quality quality, DynamicRange dynamicRange);

    Set<DynamicRange> getSupportedDynamicRanges();

    List<Quality> getSupportedQualities(DynamicRange dynamicRange);

    boolean isQualitySupported(Quality quality, DynamicRange dynamicRange);

    boolean isStabilizationSupported();

    /* renomeado de: androidx.camera.video.VideoCapabilities$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static boolean $default$isStabilizationSupported(VideoCapabilities _this) {
            return false;
        }

        public static VideoValidatedEncoderProfilesProxy $default$getProfiles(VideoCapabilities _this, Quality quality, DynamicRange dynamicRange) {
            return null;
        }

        public static VideoValidatedEncoderProfilesProxy $default$findNearestHigherSupportedEncoderProfilesFor(VideoCapabilities _this, Size size, DynamicRange dynamicRange) {
            return null;
        }

        public static Quality $default$findNearestHigherSupportedQualityFor(VideoCapabilities _this, Size size, DynamicRange dynamicRange) {
            return Quality.NONE;
        }
    }
}
