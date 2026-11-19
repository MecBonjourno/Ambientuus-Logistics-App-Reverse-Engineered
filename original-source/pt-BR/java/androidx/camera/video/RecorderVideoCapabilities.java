package androidx.camera.video;

import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.DynamicRanges;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.Quirks;
import androidx.camera.video.internal.BackupHdrProfileEncoderProfilesProvider;
import androidx.camera.video.internal.DynamicRangeMatchedEncoderProfilesProvider;
import androidx.camera.video.internal.QualityExploredEncoderProfilesProvider;
import androidx.camera.video.internal.VideoValidatedEncoderProfilesProxy;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import androidx.camera.video.internal.workaround.DefaultEncoderProfilesProvider;
import androidx.camera.video.internal.workaround.QualityAddedEncoderProfilesProvider;
import androidx.camera.video.internal.workaround.QualityResolutionModifiedEncoderProfilesProvider;
import androidx.camera.video.internal.workaround.QualityValidatedEncoderProfilesProvider;
import androidx.core.util.Preconditions;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* carregado de: classes.dex */
public class RecorderVideoCapabilities implements VideoCapabilities {
    private static final String TAG = "RecorderVideoCapabilities";
    private final Map<DynamicRange, CapabilitiesByQuality> mCapabilitiesMapForFullySpecifiedDynamicRange = new HashMap();
    private final Map<DynamicRange, CapabilitiesByQuality> mCapabilitiesMapForNonFullySpecifiedDynamicRange = new HashMap();
    private final boolean mIsStabilizationSupported;
    private final EncoderProfilesProvider mProfilesProvider;
    private final int mQualitySource;

    RecorderVideoCapabilities(int videoCapabilitiesSource, CameraInfoInternal cameraInfo, int videoCaptureType, VideoEncoderInfo.Finder videoEncoderInfoFinder) {
        Preconditions.checkArgument(videoCapabilitiesSource == 0 || videoCapabilitiesSource == 1, "Not a supported video capabilities source: " + videoCapabilitiesSource);
        this.mQualitySource = videoCaptureType == 2 ? 2 : 1;
        this.mProfilesProvider = getEncoderProfilesProvider(videoCapabilitiesSource, cameraInfo, videoEncoderInfoFinder, this.mQualitySource);
        for (DynamicRange dynamicRange : cameraInfo.getSupportedDynamicRanges()) {
            EncoderProfilesProvider constrainedProvider = new DynamicRangeMatchedEncoderProfilesProvider(this.mProfilesProvider, dynamicRange);
            CapabilitiesByQuality capabilities = new CapabilitiesByQuality(constrainedProvider, this.mQualitySource);
            if (!capabilities.getSupportedQualities().isEmpty()) {
                this.mCapabilitiesMapForFullySpecifiedDynamicRange.put(dynamicRange, capabilities);
            }
        }
        this.mIsStabilizationSupported = cameraInfo.isVideoStabilizationSupported();
    }

    @Override // androidx.camera.video.VideoCapabilities
    public Set<DynamicRange> getSupportedDynamicRanges() {
        return this.mCapabilitiesMapForFullySpecifiedDynamicRange.keySet();
    }

    @Override // androidx.camera.video.VideoCapabilities
    public List<Quality> getSupportedQualities(DynamicRange dynamicRange) {
        CapabilitiesByQuality capabilities = getCapabilities(dynamicRange);
        return capabilities == null ? new ArrayList() : capabilities.getSupportedQualities();
    }

    @Override // androidx.camera.video.VideoCapabilities
    public boolean isQualitySupported(Quality quality, DynamicRange dynamicRange) {
        CapabilitiesByQuality capabilities = getCapabilities(dynamicRange);
        return capabilities != null && capabilities.isQualitySupported(quality);
    }

    @Override // androidx.camera.video.VideoCapabilities
    public boolean isStabilizationSupported() {
        return this.mIsStabilizationSupported;
    }

    @Override // androidx.camera.video.VideoCapabilities
    public VideoValidatedEncoderProfilesProxy getProfiles(Quality quality, DynamicRange dynamicRange) {
        CapabilitiesByQuality capabilities = getCapabilities(dynamicRange);
        if (capabilities == null) {
            return null;
        }
        return capabilities.getProfiles(quality);
    }

    @Override // androidx.camera.video.VideoCapabilities
    public VideoValidatedEncoderProfilesProxy findNearestHigherSupportedEncoderProfilesFor(Size size, DynamicRange dynamicRange) {
        CapabilitiesByQuality capabilities = getCapabilities(dynamicRange);
        if (capabilities == null) {
            return null;
        }
        return capabilities.findNearestHigherSupportedEncoderProfilesFor(size);
    }

    @Override // androidx.camera.video.VideoCapabilities
    public Quality findNearestHigherSupportedQualityFor(Size size, DynamicRange dynamicRange) {
        CapabilitiesByQuality capabilities = getCapabilities(dynamicRange);
        return capabilities == null ? Quality.NONE : capabilities.findNearestHigherSupportedQualityFor(size);
    }

    private static EncoderProfilesProvider getEncoderProfilesProvider(int videoCapabilitiesSource, CameraInfoInternal cameraInfo, VideoEncoderInfo.Finder videoEncoderInfoFinder, int qualitySource) {
        VideoEncoderInfo.Finder videoEncoderInfoFinder2;
        EncoderProfilesProvider encoderProfilesProvider = cameraInfo.getEncoderProfilesProvider();
        if (qualitySource == 2) {
            if (!cameraInfo.isHighSpeedSupported()) {
                return EncoderProfilesProvider.EMPTY;
            }
            return encoderProfilesProvider;
        }
        if (!CapabilitiesByQuality.containsSupportedQuality(encoderProfilesProvider, qualitySource)) {
            Logger.w(TAG, "Camera EncoderProfilesProvider doesn't contain any supported Quality.");
            List<Quality> targetQualities = Arrays.asList(Quality.FHD, Quality.HD, Quality.SD);
            encoderProfilesProvider = new DefaultEncoderProfilesProvider(cameraInfo, targetQualities, videoEncoderInfoFinder);
        }
        Quirks deviceQuirks = DeviceQuirks.getAll();
        EncoderProfilesProvider encoderProfilesProvider2 = new QualityAddedEncoderProfilesProvider(encoderProfilesProvider, deviceQuirks, cameraInfo, videoEncoderInfoFinder);
        if (videoCapabilitiesSource != 1) {
            videoEncoderInfoFinder2 = videoEncoderInfoFinder;
        } else {
            videoEncoderInfoFinder2 = videoEncoderInfoFinder;
            encoderProfilesProvider2 = new QualityExploredEncoderProfilesProvider(encoderProfilesProvider2, Quality.getSortedQualities(), Collections.singleton(DynamicRange.SDR), cameraInfo.getSupportedResolutions(34), videoEncoderInfoFinder2);
        }
        EncoderProfilesProvider encoderProfilesProvider3 = new QualityResolutionModifiedEncoderProfilesProvider(encoderProfilesProvider2, deviceQuirks);
        if (isHlg10SupportedByCamera(cameraInfo)) {
            encoderProfilesProvider3 = new BackupHdrProfileEncoderProfilesProvider(encoderProfilesProvider3, videoEncoderInfoFinder2);
        }
        return new QualityValidatedEncoderProfilesProvider(encoderProfilesProvider3, cameraInfo, deviceQuirks);
    }

    private CapabilitiesByQuality getCapabilities(DynamicRange dynamicRange) {
        if (dynamicRange.isFullySpecified()) {
            return this.mCapabilitiesMapForFullySpecifiedDynamicRange.get(dynamicRange);
        }
        if (this.mCapabilitiesMapForNonFullySpecifiedDynamicRange.containsKey(dynamicRange)) {
            return this.mCapabilitiesMapForNonFullySpecifiedDynamicRange.get(dynamicRange);
        }
        CapabilitiesByQuality capabilities = generateCapabilitiesForNonFullySpecifiedDynamicRange(dynamicRange);
        this.mCapabilitiesMapForNonFullySpecifiedDynamicRange.put(dynamicRange, capabilities);
        return capabilities;
    }

    private static boolean isHlg10SupportedByCamera(CameraInfoInternal cameraInfoInternal) {
        Set<DynamicRange> dynamicRanges = cameraInfoInternal.getSupportedDynamicRanges();
        for (DynamicRange dynamicRange : dynamicRanges) {
            Integer encoding = Integer.valueOf(dynamicRange.getEncoding());
            int bitDepth = dynamicRange.getBitDepth();
            if (encoding.equals(3) && bitDepth == 10) {
                return true;
            }
        }
        return false;
    }

    private CapabilitiesByQuality generateCapabilitiesForNonFullySpecifiedDynamicRange(DynamicRange dynamicRange) {
        if (!DynamicRanges.canResolve(dynamicRange, getSupportedDynamicRanges())) {
            return null;
        }
        EncoderProfilesProvider constrainedProvider = new DynamicRangeMatchedEncoderProfilesProvider(this.mProfilesProvider, dynamicRange);
        return new CapabilitiesByQuality(constrainedProvider, this.mQualitySource);
    }
}
