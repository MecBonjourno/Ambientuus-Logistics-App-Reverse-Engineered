package androidx.camera.video.internal.encoder;

import android.media.MediaCodecInfo;
import android.util.Range;
import androidx.camera.core.Logger;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import androidx.camera.video.internal.utils.CodecUtil;
import androidx.camera.video.internal.workaround.VideoEncoderInfoWrapper;
import j$.util.Objects;

/* loaded from: classes.dex */
public class VideoEncoderInfoImpl extends EncoderInfoImpl implements VideoEncoderInfo {
    public static final VideoEncoderInfo.Finder FINDER = new VideoEncoderInfo.Finder() { // from class: androidx.camera.video.internal.encoder.VideoEncoderInfoImpl$$ExternalSyntheticLambda0
        @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo.Finder
        public final VideoEncoderInfo find(String str) {
            return VideoEncoderInfoImpl.lambda$static$0(str);
        }
    };
    private static final String TAG = "VideoEncoderInfoImpl";
    private final MediaCodecInfo.VideoCapabilities mVideoCapabilities;

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public /* synthetic */ boolean isSizeSupportedAllowSwapping(int i, int i2) {
        return VideoEncoderInfo.CC.$default$isSizeSupportedAllowSwapping(this, i, i2);
    }

    static /* synthetic */ VideoEncoderInfo lambda$static$0(String mimeType) {
        try {
            VideoEncoderInfoImpl videoEncoderInfo = new VideoEncoderInfoImpl(CodecUtil.findCodecAndGetCodecInfo(mimeType), mimeType);
            return VideoEncoderInfoWrapper.from(videoEncoderInfo, null);
        } catch (InvalidConfigException e) {
            Logger.w(TAG, "Unable to find a VideoEncoderInfoImpl", e);
            return null;
        }
    }

    VideoEncoderInfoImpl(MediaCodecInfo codecInfo, String mime) throws InvalidConfigException {
        super(codecInfo, mime);
        this.mVideoCapabilities = (MediaCodecInfo.VideoCapabilities) Objects.requireNonNull(this.mCodecCapabilities.getVideoCapabilities());
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public boolean canSwapWidthHeight() {
        return true;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public boolean isSizeSupported(int width, int height) {
        return this.mVideoCapabilities.isSizeSupported(width, height);
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedWidths() {
        return this.mVideoCapabilities.getSupportedWidths();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedHeights() {
        return this.mVideoCapabilities.getSupportedHeights();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedWidthsFor(int height) {
        try {
            return this.mVideoCapabilities.getSupportedWidthsFor(height);
        } catch (Throwable t) {
            throw toIllegalArgumentException(t);
        }
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedHeightsFor(int width) {
        try {
            return this.mVideoCapabilities.getSupportedHeightsFor(width);
        } catch (Throwable t) {
            throw toIllegalArgumentException(t);
        }
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public int getWidthAlignment() {
        return this.mVideoCapabilities.getWidthAlignment();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public int getHeightAlignment() {
        return this.mVideoCapabilities.getHeightAlignment();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedBitrateRange() {
        return this.mVideoCapabilities.getBitrateRange();
    }

    private static IllegalArgumentException toIllegalArgumentException(Throwable t) {
        if (t instanceof IllegalArgumentException) {
            return (IllegalArgumentException) t;
        }
        return new IllegalArgumentException(t);
    }
}
