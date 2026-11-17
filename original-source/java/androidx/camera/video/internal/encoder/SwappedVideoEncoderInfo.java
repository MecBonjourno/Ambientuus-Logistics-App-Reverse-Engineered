package androidx.camera.video.internal.encoder;

import android.util.Range;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import androidx.core.util.Preconditions;

/* loaded from: classes.dex */
public class SwappedVideoEncoderInfo implements VideoEncoderInfo {
    private final VideoEncoderInfo mVideoEncoderInfo;

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public /* synthetic */ boolean isSizeSupportedAllowSwapping(int i, int i2) {
        return VideoEncoderInfo.CC.$default$isSizeSupportedAllowSwapping(this, i, i2);
    }

    public SwappedVideoEncoderInfo(VideoEncoderInfo videoEncoderInfo) {
        Preconditions.checkArgument(videoEncoderInfo.canSwapWidthHeight());
        this.mVideoEncoderInfo = videoEncoderInfo;
    }

    @Override // androidx.camera.video.internal.encoder.EncoderInfo
    public String getName() {
        return this.mVideoEncoderInfo.getName();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public boolean canSwapWidthHeight() {
        return this.mVideoEncoderInfo.canSwapWidthHeight();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public boolean isSizeSupported(int width, int height) {
        return this.mVideoEncoderInfo.isSizeSupported(height, width);
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedWidths() {
        return this.mVideoEncoderInfo.getSupportedHeights();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedHeights() {
        return this.mVideoEncoderInfo.getSupportedWidths();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedWidthsFor(int height) {
        return this.mVideoEncoderInfo.getSupportedHeightsFor(height);
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedHeightsFor(int width) {
        return this.mVideoEncoderInfo.getSupportedWidthsFor(width);
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public int getWidthAlignment() {
        return this.mVideoEncoderInfo.getHeightAlignment();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public int getHeightAlignment() {
        return this.mVideoEncoderInfo.getWidthAlignment();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedBitrateRange() {
        return this.mVideoEncoderInfo.getSupportedBitrateRange();
    }
}
